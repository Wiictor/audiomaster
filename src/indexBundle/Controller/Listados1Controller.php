<?php

namespace indexBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class Listados1Controller extends Controller
{
    public function listadosAction(Request $request)
    {
        $session = new Session();

        if($session->has("id"))
        {
            $fecha1 = $request->get("fecha11");
            $fecha2 = $request->get("fecha21");
            $agencia = $request->get("agencia1");

            $em = $this->getDoctrine()->getManager();

            $query = $em->createQuery(
                "SELECT c.id, c.nombre, c.apellidos, f.fecha, e.nombre as transporte
                    FROM indexBundle:Cliente c,
                         indexBundle:Factura f,
                         indexBundle:AgenciaTransporte e
                    WHERE f.clienteId = c.id 
                      AND e.id = f.empresaTransporteId
                      AND f.empresaTransporteId = :agencia
                      AND f.fecha BETWEEN :fecha1 AND :fecha2
                      "
            )->setParameter("agencia", $agencia)
                ->setParameter("fecha1", $fecha1)
                ->setParameter("fecha2", $fecha2);

            $datos = $query->getResult();
//            var_dump($datos);exit;
            return $this->render("indexBundle:Index:listados1.html.twig", array("fechaAntigua" => $fecha1, "fechaNueva" => $fecha2, "agencias" => $agencia, "listadoagencias1" => $datos));
        }
    }
}
