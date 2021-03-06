/*
 * Page affectation
 * Helper offrant une "abstraction" du mode,
 * permettant de simplifier le code
 */

/*
 * Création du namespace et utils
 */
function PmMode() {
	this.master = {};
	this.slave = {};
	this.calendar = {};
	this.orgaClick = {};
}
	
/*
 * Fonctions
 */
PmMode.prototype = {
	/*
	 * Set les boutons pour changer de mode
	 */
	setBoutons: function() {
		$('#bouton_mode_orga').bind('click', {mode: 'orga'}, pmAffectation.controllers.calendar.changeMode);
		$('#bouton_mode_tache').bind('click', {mode: 'tache'}, pmAffectation.controllers.calendar.changeMode);
	},
	
	/*
	 * Set le mode de l'application :
	 * Orga -> Créneau ou Tache -> Orga
	 */
	setMode: function(mode, setDefault) {
		(mode) && (pmAffectation.current.mode = mode);

		// on oublie pas les filtres de recherche !
		$('#champ_orga_rechercher').val('');
		$('#champ_tache_rechercher').val('');
		
		(setDefault === true) && (pmUtils.setDefault());
		pmHistory.setUrlParam();
		
		if (pmAffectation.current.mode === 'orga') {
			// on filtre les boutons
			$('#boutons_orga_nav').show();
			$('#boutons_tache_nav').hide();
			$('#bouton_orga_detail').show();
			$('#bouton_orga_statut').show();
			$('#bouton_tache_detail').hide();
			$('#filtre_tache_duree').parent().show();
			$('#filtre_tache_confiance').parent().show();
			$('#bouton_mode_orga').button('toggle');
			
			// on va chercher la colonne orgas
			pmAffectation.controllers.orga = new OrgaController();
			pmAffectation.controllers.orga.getData();
	
			// colonne tache - dedans on met des créneaux
			pmAffectation.controllers.creneau = new CreneauController();
			// pas besoin d'aller chercher des données dedans
			
			// on met à jour les références
			this.master.update = function() { pmAffectation.controllers.orga.getData() };
			this.calendar.update = function() { pmAffectation.controllers.orga.getDispos() };
			this.slave.update = function() { pmAffectation.controllers.creneau.getData() };
			this.orgaClick = function(obj) { pmAffectation.controllers.orga.chargerListeOrgas(obj); }
		} else if (pmAffectation.current.mode === 'tache') {
			// on filtre les boutons
			$('#boutons_orga_nav').hide();
			$('#boutons_tache_nav').show();
			$('#bouton_orga_detail').hide();
			$('#bouton_orga_statut').hide();
			$('#bouton_tache_detail').show();
			$('#filtre_tache_duree').parent().hide();
			$('#filtre_tache_confiance').parent().hide();
			$('#bouton_mode_tache').button('toggle');
			
			// 1 - colonne orga
			pmAffectation.controllers.orga = new OrgaController();
			// pas besoin d'aller chercher des données dedans
			
			// 2 - on va chercher la colonne tache
			pmAffectation.controllers.tache = new TacheController();
			pmAffectation.controllers.tache.getData();
			
			// on met à jour les références
			this.master.update = function() { pmAffectation.controllers.tache.getData() };
			this.calendar.update = function() { pmAffectation.controllers.tache.getCreneaux() };
			this.slave.update = function() { pmAffectation.controllers.orga.getData() };
			this.orgaClick = function(obj) { pmAffectation.controllers.orga.affecterOrga(obj); }
		}
	}
};