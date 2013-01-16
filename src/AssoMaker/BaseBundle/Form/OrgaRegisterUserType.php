<?php

namespace AssoMaker\BaseBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use AssoMaker\BaseBundle\Entity\EquipeRepository;

class OrgaRegisterUserType extends AbstractType
{
    protected $config;
    protected $forcedConfiance;
    function __construct($config,$forcedConfiance){
            $this->config =$config;
            $this->forcedConfiance=$forcedConfiance;
    }
    
    
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $libellesPermis =  json_decode($this->config->getValue('manifestation_permis_libelles'),true);
        $choixCompetences =  json_decode($this->config->getValue('phpm_competences_orga'),true);
        
    	$currentYear = date('Y');
    	$years = array(); 	
    	
    	for ($i=($currentYear-27);$i<=($currentYear-16);$i++){
    		array_push($years, $i);
    	
    	}
    	
    	$builder
    	    ->add('prenom',null,array('label'=>'Prénom'))
            ->add('nom',null,array('label'=>'Nom'))
            ->add('surnom',null,array('label'=>'Surnom'))
            
            ->add('telephone',null,array('label'=>'Téléphone portable','help'=>'Sans séparateurs : 0648851224'))
            ->add('email',null,array('label'=>'Adresse email')
            
            ->add('dateDeNaissance', 'birthday', array(
            		'input'=>'datetime',
                    'label'=>'Date de naissance',
                    'years'=>$years,
                    'widget' => 'single_text',
                    'attr'=>array('class'=>'birthdaydp'),
                    'format' => 'yyyy-MM-dd'))
           	->add('anneeEtudes','choice',array(	'label'=>'Année d\'études',
                            			'required'=>false,
                            			'choices'=>array(1=>1,2,3,4,5,6,7,8,0=>'Autre')))
            ->add('departement','choice',array('label'=>'Département INSA', 'required'=>false, 'choices'=>array(
                    'PC'=>'PC','GMC'=>'GMC','GMD'=>'GMD', 'GMPP'=>'GMPP', 'IF'=>'IF', 'SGM'=>'SGM',
                    'GI'=>'GI', 'GE'=>'GE', 'TC'=>'TC', 'GCU'=>'GCU', 'BIM'=>'BIM', 'BIOCH'=>'BIOCH', 'GEN'=>'GEN', 'Autre'=>'Autre' 
                    )))
            ->add('groupePC','integer',array('label'=>'Groupe (Premier Cycle Uniquement)',
            							'attr'=>array('placeHolder'=>'00'),'required'=>false))   
            ->add('commentaire')
            ->add('celibataire','choice',array(	'label'=>'Célib\'?',
            									'required'=>false,
            									'choices'=>array('0'=>'Non','1'=>'Oui'),
            									'attr'=>array('class'=>'inline')))
			->add('competences', 'choice', array(
			        'choices'=>$choixCompetences,
			        'multiple'=>true,
			        'expanded'=>true,
			        'label'=>'Compétences'
			))
    	    ;
    	    
    	    if($this->forcedConfiance){
    	        
    	    	$code=$this->forcedConfiance;
    	    	$builder->add('equipe','entity',array('label'=>'Équipe',
    	    			'class' => 'AssoMakerBaseBundle:Equipe',
    	    			'query_builder' => function(EquipeRepository $er)use($code){return $er->findAllWithConfianceCode($code);}))

    	    	
    	    	;
    	    }
    	    
    	
    }

    public function getName()
    {
        return 'assomaker_base_bundle_orga_register_user_type';
    }
    
    
}
