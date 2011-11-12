<?php

namespace PHPM\Bundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PHPM\Bundle\Entity\Orga
 *
 * @ORM\Table()
 * @ORM\Entity
 */
class Orga
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string $name
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var datetime $begintime
     *
     * @ORM\Column(name="begintime", type="datetime")
     */
    private $begintime;

    /**
     * @var datetime $endtime
     *
     * @ORM\Column(name="endtime", type="datetime")
     */
    private $endtime;
    
    /**
     * @ORM\OneToMany(targetEntity="Timeslot", mappedBy="orga")
     */
    protected $timeslots;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set name
     *
     * @param string $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set begintime
     *
     * @param datetime $begintime
     */
    public function setBegintime($begintime)
    {
        $this->begintime = $begintime;
    }

    /**
     * Get begintime
     *
     * @return datetime 
     */
    public function getBegintime()
    {
        return $this->begintime;
    }

    /**
     * Set endtime
     *
     * @param datetime $endtime
     */
    public function setEndtime($endtime)
    {
        $this->endtime = $endtime;
    }

    /**
     * Get endtime
     *
     * @return datetime 
     */
    public function getEndtime()
    {
        return $this->endtime;
    }
    
    public function __toString()
    {
        return $this->name;
    }
    public function __construct()
    {
        $this->timeslots = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
    /**
     * Add timeslots
     *
     * @param PHPM\Bundle\Entity\Timeslot $timeslots
     */
    public function addTimeslot(\PHPM\Bundle\Entity\Timeslot $timeslots)
    {
        $this->timeslots[] = $timeslots;
    }

    /**
     * Get timeslots
     *
     * @return Doctrine\Common\Collections\Collection 
     */
    public function getTimeslots()
    {
        return $this->timeslots;
    }
}