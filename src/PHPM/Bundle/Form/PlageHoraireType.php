<?php

namespace PHPM\Bundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilder;

class PlageHoraireType extends AbstractType
{
	
	protected $config;
	
	function __construct($config)
	{
	
		$this->config = $config;
	
	}
	
    public function buildForm(FormBuilder $builder, array $options) {
        $choixDurees= array();
        
        for ($i=1;$i<=12;$i++){
            $s= 900*$i;
            $choixDurees[$s]=gmdate("H\hi", $s);
        }
        
        $choixRC= array();
        
        for ($i=0;$i<=2;$i++){
            $s= 900*$i;
            $choixRC[$s]=gmdate("H\hi", $s);
        }
        
        $builder
            ->add('debut',null,array(
                    'label'=>'Début',
                    'widget' => 'single_text',
                    'attr'=>array('class'=>'debutdp')))
            ->add('fin',null,array(
                    'label'=>'Fin',
                    'widget' => 'single_text',
                    'attr'=>array('class'=>'findp')))
            ->add('creneauUnique', null, array('label'=>'Créneau Unique (pas de découpage)'))
            ->add('dureeCreneau', 'choice', array('label'=>'Durée d\'un créneau', 'choices'=>$choixDurees))
            ->add('recoupementCreneau', 'choice', array('label'=>'Recoupement entre deux créneaux consécutifs (en sec.)', 'choices' => $choixRC ))
			->add('besoinsOrga','collection', array('type' => new BesoinOrgaType($this->config),
													'allow_add' => true,
													'allow_delete' => true,
									                'by_reference' => false,
												    'label'  => ' ',
									                'options'  => array('label' => ' ')
        										));
    }
    
    public function getDefaultOptions(array $options) {
        return array(
                'data_class' => 'PHPM\Bundle\Entity\PlageHoraire',
        );
    }

    public function getName() {
        return 'phpm_bundle_plagehorairetype';
    }
	
}
