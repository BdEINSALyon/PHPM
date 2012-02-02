<?php

namespace PHPM\Bundle\Entity;

use Doctrine\ORM\EntityRepository;

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
		->createQuery("SELECT d FROM PHPMBundle:Disponibilite d , PHPMBundle:Creneau c 		
		WHERE d.orga = :orga_id AND c.debut > d.debut AND c.fin < d.fin
		")
		->setParameter('orga_id', $oid)
	
		->getResult();
	
	
	}
}