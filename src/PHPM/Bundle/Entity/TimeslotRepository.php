<?php

namespace PHPM\Bundle\Entity;

use Doctrine\ORM\EntityRepository;

/**
 * TimeslotRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class TimeslotRepository extends EntityRepository
{
	
	public function getAffectable($id)
	{
		$em = $this->getEntityManager();
	
	
	
		$dql = "SELECT t FROM PHPMBundle:Timeslot t WHERE
	            t.id NOT IN 
	                (
	                SELECT t2.id FROM
	                PHPMBundle:Timeslot t1,
	                PHPMBundle:Timeslot t2
	                WHERE t1.orga =$id
	                AND (
	                NOT(t1.endtime <= t2.begintime OR t1.begintime >=t2.endtime)
	                OR t2.orga != 1 )
	                )
	            ";
	
	
		$query = $em->createQuery($dql);
	
		$entity = $query->getResult();
					
		return  $entity;
	}
	
	
}