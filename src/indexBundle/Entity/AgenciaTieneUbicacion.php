<?php

namespace indexBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * AgenciaTieneUbicacion
 */
class AgenciaTieneUbicacion
{
    /**
     * @var int
     */
    private $id;

    /**
     * @var int
     */
    private $agenciaId;

    /**
     * @var int
     */
    private $ubicacionId;

    /**
     * @var int
     */
    private $precio;


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
     * Set agenciaId
     *
     * @param integer $agenciaId
     * @return AgenciaTieneUbicacion
     */
    public function setAgenciaId($agenciaId)
    {
        $this->agenciaId = $agenciaId;

        return $this;
    }

    /**
     * Get agenciaId
     *
     * @return integer 
     */
    public function getAgenciaId()
    {
        return $this->agenciaId;
    }

    /**
     * Set ubicacionId
     *
     * @param integer $ubicacionId
     * @return AgenciaTieneUbicacion
     */
    public function setUbicacionId($ubicacionId)
    {
        $this->ubicacionId = $ubicacionId;

        return $this;
    }

    /**
     * Get ubicacionId
     *
     * @return integer 
     */
    public function getUbicacionId()
    {
        return $this->ubicacionId;
    }

    /**
     * Set precio
     *
     * @param integer $precio
     * @return AgenciaTieneUbicacion
     */
    public function setPrecio($precio)
    {
        $this->precio = $precio;

        return $this;
    }

    /**
     * Get precio
     *
     * @return integer 
     */
    public function getPrecio()
    {
        return $this->precio;
    }
}
