<?php

namespace indexBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ubicacion
 */
class ubicacion
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var string
     */
    private $ubicacion;


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
     * Set ubicacion
     *
     * @param string $ubicacion
     * @return ubicacion
     */
    public function setUbicacion($ubicacion)
    {
        $this->ubicacion = $ubicacion;

        return $this;
    }

    /**
     * Get ubicacion
     *
     * @return string 
     */
    public function getUbicacion()
    {
        return $this->ubicacion;
    }
}
