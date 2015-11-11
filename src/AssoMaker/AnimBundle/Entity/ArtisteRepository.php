<?php

namespace AssoMaker\AnimBundle\Entity;

use Doctrine\ORM\EntityRepository;

/**
 * ArtisteRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class ArtisteRepository extends EntityRepository {

    public function search($s) {
        return $this->getEntityManager()
                        ->createQuery("SELECT a FROM AssoMakerAnimBundle:Artiste a WHERE (a.nom LIKE :s)")
                        ->setParameter('s', "%" . $s . "%")
                        ->getResult();
    }

}
