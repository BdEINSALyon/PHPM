/*
 * Page affectation
 * Petite librairie spécifique
 */

/*
 * Création du namespace et utils
 */
function PmUtils() {
	// les jours de la semaine
	this.jours = new Array('dimanche', 'lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi');
}
	
/*
 * Fonctions
 */
PmUtils.prototype = {
	/* ******************** */
	/* ****** LAYOUT ****** */
	/* ******************** */
	
	/*
	 * Adapte la taille du layout
	 */
	setAppHeight: function(headerHeight) {
		var _headerHeight = (isFinite(headerHeight))? headerHeight : $('#header').height();
		var _contentHeight = $(window).height()-_headerHeight;
		var _clientHeight = _contentHeight-$('#menu_calendar').outerHeight()-3; // 3 de border tout en bas
		
		$('#content').height(_contentHeight+'px');
		$('#client').height(_clientHeight+'px');
		$('#jours').height(_clientHeight-30+'px');
	},
	// fonction appelée au départ, qui en plus créé un handler sur l'event resize
	setResizeableApp: function() {
		window.onresize = pmUtils.setAppHeight;
		
		pmUtils.setAppHeight();
	},
	
	/*
	 * Un bouton permettant de cacher le menu du haut
	 */
	hideTopMenu: function() {
		if ($('.header').css('display') === 'none') {
			$('.header').show(500, 'swing');
			$('#bouton_hide_menu').html('^ Cacher ^');
			pmUtils.setAppHeight(79);
		} else {
			$('.header').hide(500, 'swing');
			$('#bouton_hide_menu').html('&or; Menu &or;');
			pmUtils.setAppHeight(0);
		}
	},
	
	/*
	 * Pour les sidebars redimensionnables
	 */
	setResizeableSidebars: function() {
		$(function() {
			$("#sidebar_orga").resizable({
									minWidth: 150,
									maxWidth: 400,
									autoHide: true,
									handles: 'e',
									resize: pmUtils.hideCalendar,
									stop: pmUtils.resizeHandler
									});
			
			$("#sidebar_tache").resizable({
									minWidth: 150,
									maxWidth: 400,
									autoHide: true,
									handles: 'w',
									resize: pmUtils.hideCalendar,
									stop: pmUtils.resizeHandler
									});
		});
	},
	// handler pendant le resize
	hideCalendar: function() {
		 $('#calendar').css('visibility', 'hidden');
	},
	// handler de fin
	resizeHandler: function(event, ui) {
		$('#calendar').css('visibility', 'visible'); // raffiche
		
		pmUtils.resizeCalendar(ui.originalSize.width-ui.size.width);
		console.log(ui.originalSize.width-ui.size.width);
		
		// on stock ces tailles dans les paramètres de l'utilisateur
		// volontairement on travaille en pixels
		pmUtils.setLocalStorage('SizeSidebarOrga', $('#sidebar_orga').width());
		pmUtils.setLocalStorage('SizeSidebarTache', $('#sidebar_tache').width());
	},
	// resize le calendar et tout ce qui va avec
	resizeCalendar: function(deltaTaille) {
		// on convertit tout en % pour mieux gérer le redimensionnement de la fenêtre
		var _newWidth = ($('#calendar').width()+deltaTaille)/$('.content').width()*100;
		$('#calendar').width(_newWidth+'%');

		// même chose pour les sidebars
		pmUtils.setPourcentWidth('#sidebar_orga');
		pmUtils.setPourcentWidth('#sidebar_tache');
	},
	
	
	/* ******************** */
	/* *** UTILITAIRES **** */
	/* ******************** */
	/*
	 * Retourne la taille de l'élément (jQuery) passé
	 * en pourcentage %
	 */
	getPourcentWidth: function(unElement, elementRelatif) {
		if ($(elementRelatif).width() === null) {
			var _rapport = $(document);
		} else {
			var _rapport = $(elementRelatif);
		}
		
		return $(unElement).width()/_rapport.width()*100;
	},
	/* 
	 * Même chose, l'applique
	 */
	setPourcentWidth: function(unElement, elementRelatif) {
		$(unElement).width(pmUtils.getPourcentWidth(unElement, elementRelatif)+'%');
	},
	
	/*
	 * Stockage et retrieve dans localStorage
	 */
	setLocalStorage: function(uneClef, unElement) {
		try {
			localStorage[uneClef] = JSON.stringify(unElement);
		} catch(err) {
			console.error("Impossible d'accéder à localStorage",err);
		}
	},
	getLocalStorage: function(uneClef) {
		try {
			var _value = localStorage[uneClef];
			
			if (_value !== undefined) {
				return $.parseJSON(_value);
			} else {
				return undefined;
			}
		} catch(err) {
			console.error("Impossible d'accéder à localStorage",err);
		}
	},
	
	/*
	 * Travail sur l'URL
	 */
	// init d'History.js
	initHistory: function() {
	    // Prepare
	    pmAffectation.History = window.History; // Note: We are using a capital H instead of a lower h
	
	    // Bind to StateChange Event
	    pmAffectation.History.Adapter.bind(window, 'statechange', function() { // Note: We are using statechange instead of popstate
	        var State = pmAffectation.History.getState(); // Note: We are using History.getState() instead of event.state
	        pmAffectation.History.log(State.data, State.title, State.url);
	    });
	},
	// regarde si on ne passe pas déjà des paramètres
	parseUrlParam: function() {
		// les paramètres vont dans pmAffectation.current
		
		if (History.getHash().substr(0, 6) == 'param&') {
			// parseur - on a reconnu notre format
			var _hash = History.getHash().substr(7, History.getHash().length);
			
			var _params = _hash.split('&'); // on part de couple1&couple2&couple3...
			
			for (var _iParam in _params) {
				var _paire = _params[_iParam].split('='); // on a des couples clé=valeur

				pmAffectation.current[_paire[0]] = _paire[1]; // le stock
			}
		}
	},
	// update un paramètre et change l'url en fonction
	setUrlParam: function() {
		// concrètement, pour ne pas avoir de problèmes, on reconstruit l'url entière
		var _urlStr = '#param';
		
		for (var _iPaire in pmAffectation.current) {
			_urlStr += '&'+_iPaire+'='+pmAffectation.current[_iPaire];
		}
		
		pmAffectation.History.pushState(pmAffectation.current, 'PlanningMaker - Affectation - '+_urlStr, _urlStr);
	},
	
	/*
	 * Tri un objet associatif - source :
	 * http://www.latentmotion.com/how-to-sort-an-associative-array-object-in-javascript/
	 */
	sortObject: function(arr) {
		// Setup Arrays
		var sortedKeys = new Array();
		var sortedObj = {};
	
		// Separate keys and sort them
		for (var i in arr){
			sortedKeys.push(i);
		}
		sortedKeys.sort();
	
		// Reconstruct sorted obj based on keys
		for (var i in sortedKeys){
			sortedObj[sortedKeys[i]] = arr[sortedKeys[i]];
		}
		
		return sortedObj;
	}
};

