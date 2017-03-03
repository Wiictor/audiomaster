<?php

namespace indexBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class Listados2Controller extends Controller
{
    public function listadosAction(Request $request)
    {
        $session = new Session();

        if($session->has("id"))
        {
            $fecha1 = $request->get("fecha12");
            $fecha2 = $request->get("fecha22");
            $agencia = $request->get("agencia2");

            $em = $this->getDoctrine()->getManager();

            $query = $em->createQuery(
                "SELECT e.nombre as transporte, count(f.empresaTransporteId) as numero
                    FROM indexBundle:Cliente c,
                         indexBundle:Factura f,
                         indexBundle:AgenciaTransporte e
                    WHERE f.clienteId = c.id 
                      AND e.id = f.empresaTransporteId
                      AND f.fecha
                      BETWEEN :fecha1 AND :fecha2
                    GROUP BY transporte
                      "
            )->setParameter("fecha1", $fecha1)
                ->setParameter("fecha2", $fecha2);

            $datos = $query->getResult();

            // Codificación correcta
            return $this->render("indexBundle:Index:listados2.html.twig", array("fechaAntigua" => $fecha1, "fechaNueva" => $fecha2,                 "agencias" => $agencia, "listadoagencias2" => $datos));
        }
    }
}
