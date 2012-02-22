/*
 * Page affectation
 * Librairie permettant de travailler avec l'historique & l'url :
 * parser les paramètres en hash, lancer les requêtes...
 */

/*
 * Création du namespace et utils
 */
function PmHistory() {
}
	
/*
 * Fonctions
 */
PmHistory.prototype = {
	/*
	 * Init
	 * Set l'event listener sur le changelment d'url
	 * Pas mal de code repris du Github officiel d'History.js (GH)
	 */ 
	initHistoryListener: function() {
		//(function(window, undefined) {
		    var History = window.History; // Note: We are using a capital H instead of a lower h
		    
		    if (! History.enabled) {
		         // History.js is disabled for this browser.
		         // This is because we can optionally choose to support HTML4 browsers or not.
		        return false;
		    }
		
		    // on va écouter le changement d'adresse, dessus on reparse
		    History.Adapter.bind(window, 'statechange', function() { // Note: We are using statechange instead of popstate
		        console.error("déclenché");
		        
		        var State = History.getState(); // Note: We are using History.getState() instead of event.state
		        
		        History.log(State.data, State.title, State.url); // log
		        
		        pmHistory.parseUrlParam(true);
		    });
		//})(window);
	},
	
	/*
	 * Fonction de parsage des paramètres
	 * On les prend, regarde s'ils sont différents des valeurs que l'on a déjà,
	 * va les mettre au bon endroit & relance ce qu'il faut
	 * @param :
	 *  - doLaunch : si true, on lance les controlleurs que les données se mettent à jour
	 */
	parseUrlParam: function(doLaunch) {
		var _hash = History.getHash(); // le hash est ce qui suit le # (non inclus)
		
		if (_hash.substr(0, 6) == 'param&') { // parseur - on a reconnu notre format
			var _str = decodeURIComponent(_hash.substr(6, _hash.length)); // petite décodage du format URL nécessaire
			
			// on décode ça dans un tableau provisoire
			var _params = _str.split('&'); // on part de couple1&couple2&couple3...
			
			for (var _iParam in _params) {
				var _paire = _params[_iParam].split('='); // on a des couples clé=valeur
				
				// pour chaque couple, on va regarder ce qu'il faut faire
				if (pmAffectation.current[_paire[0]] === undefined) {
					// existe pas, on créé la valeur
					pmAffectation.current[_paire[0]] = _paire[1];
				} else {
					// sinon faut tester, voir si on met à jour la valeur
					switch (_paire[0]) {
						case 'orga':
							if (_paire[1] !== pmAffectation.current['orga']) {
								pmAffectation.current['orga'] = _paire[1];
								(doLaunch) && (pmAffectation.controllers.orga.getData());
							}
							break;
						default:
							break;
					}
				}
			}
		} else {
			window.location.hash = ''; // sinon on avait de la bullshit, on écrase
		}
	},
	
	/*
	 * Fonction appelée lors de l'udpate d'un paramètres
	 * Va changer le hash en fonction
	 */
	setUrlParam: function() {
		// concrètement, pour ne pas avoir de problèmes, on reconstruit l'url entière
		// Jquery goodness for sérialiser rapidemment (et en profondeur)
		var _newHash = '#param&' + $.param(pmAffectation.current);
		
        History.pushState(null, null, _newHash);
	},
}