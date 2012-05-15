<?php

namespace PHPM\Bundle\Entity;

use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Query\ResultSetMapping;

/**
 * DisponibiliteRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class DisponibiliteRepository extends EntityRepository
{
	
	public function getContainingDisponibilite($orga, $creneau) 
	{
	
		return $this->getEntityManager()
		->createQuery("SELECT d FROM PHPMBundle:Disponibilite d JOIN d.orga o, PHPMBundle:Creneau c
		WHERE d.orga = :orga_id AND c.id = :creneau_id AND c.debut >= d.debut AND c.fin <= d.fin
		")
		->setMaxResults(1)
		->setParameter('orga_id', $orga->getId())
		->setParameter('creneau_id', $creneau->getId())
	
		->getResult();
		
	
	}
	
	// récupère les dispos d'un orga sur une plage donnée
	// le 1er paramètre est obligatoire
	public function getOrgaDispo($orga_id, $plage_id)
	{
		$rsm = new ResultSetMapping;
		$rsm->addEntityResult('PHPMBundle:Disponibilite', 'd');
		$rsm->addFieldResult('d', 'id', 'id');
		$rsm->addFieldResult('d', 'debut', 'debut');
		$rsm->addFieldResult('d', 'fin', 'fin');
		$rsm->addJoinedEntityResult('PHPMBundle:Creneau', 'c', 'd', 'creneaux');
		$rsm->addFieldResult('c', 'cid', 'id');
		$rsm->addFieldResult('c', 'cd', 'debut');
		$rsm->addFieldResult('c', 'cf', 'fin');
		$rsm->addJoinedEntityResult('PHPMBundle:PlageHoraire', 'p', 'c', 'plageHoraire');
		$rsm->addFieldResult('p', 'pi', 'id');
		$rsm->addJoinedEntityResult('PHPMBundle:Tache', 't', 'p', 'tache');
		$rsm->addFieldResult('t', 'ti', 'id');
		$rsm->addFieldResult('t', 'tn', 'nom');
		$rsm->addFieldResult('t', 'tl', 'lieu');
		$rsm->addJoinedEntityResult('PHPMBundle:GroupeTache', 'g', 't', 'groupeTache');
		$rsm->addFieldResult('g', 'ge', 'id'); // bien garder id, le referredBY name
		
		$sql = 'SELECT d.id, d.debut, d.fin, c.id AS cid, c.debut AS cd, c.fin AS cf, p.id AS pi, t.id AS ti, t.nom AS tn, t.lieu AS tl, g.equipe_id AS ge
				FROM Disponibilite d 
				LEFT OUTER JOIN Creneau c ON c.disponibilite_id = d.id
				LEFT OUTER JOIN PlageHoraire p ON c.plageHoraire_id = p.id
				LEFT OUTER JOIN Tache t ON p.tache_id = t.id
				LEFT OUTER JOIN GroupeTache g ON t.groupetache_id = g.id
				WHERE d.orga_id = ?';
				
		if ($plage_id !== '') {
			$pref = json_decode($this->getEntityManager()->getRepository('PHPMBundle:Config')->findOneByField('manifestation_plages')->getValue(), TRUE);
			$plage = $pref[$plage_id];
			$fin = $plage["fin"];
			$debut = $plage["debut"];

			$sql .= " AND DATE(d.debut) <= '$fin' AND DATE(d.fin) > '$debut'";
		}
		
		$query = $this->getEntityManager()->createNativeQuery($sql, $rsm);
		$query->setParameter(1, $orga_id); // PDO \o/
		
		return $query->getArrayResult();
	}
}