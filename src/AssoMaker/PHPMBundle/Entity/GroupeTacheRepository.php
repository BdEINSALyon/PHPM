<?php

namespace AssoMaker\PHPMBundle\Entity;

use Doctrine\ORM\EntityRepository;

/**
 * GroupeTacheRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class GroupeTacheRepository extends EntityRepository
{
	public function search($s)
	{
		return $this->getEntityManager()
		->createQuery("SELECT g FROM AssoMakerPHPMBundle:GroupeTache g WHERE g.nom LIKE :s AND g.statut != '-1'")
		->setParameter('s', "%".$s."%")
		->getResult();
	}
}