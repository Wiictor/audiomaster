<?php

namespace indexBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ListadosController extends Controller
{
    public function listadosAction()
    {
        $sesion = new Session();

        if ($sesion->has("id")) {
            $em = $this->getDoctrine()->getManager();


            $query = $em->createQuery(
                "SELECT f.fecha
                    FROM indexBundle:Factura f
                    ORDER BY f.fecha ASC"
            )->setMaxResults(1);

            $fechaAntigua = $query->getResult();

            $query2 = $em->createQuery(
                "SELECT f.fecha
                    FROM indexBundle:Factura f
                    ORDER BY f.fecha DESC"
            )->setMaxResults(1);

            $fechaNueva = $query2->getResult();

            $query3 = $em->createQuery(
                "SELECT at.id,at.nombre
                FROM indexBundle:AgenciaTransporte at
                  ORDER BY at.id"
            );
            $agencias = $query3->getResult();

            $fantigua = $fechaAntigua[0]['fecha'];
            $fnueva = $fechaNueva[0]['fecha'];

            $query4 = $em->createQuery(
                "SELECT c.id, c.nombre, c.apellidos, f.fecha, e.nombre as transporte
                    FROM indexBundle:Cliente c,
                         indexBundle:Factura f,
                         indexBundle:AgenciaTransporte e
                    WHERE f.clienteId = c.id 
                      AND e.id = f.empresaTransporteId
                      AND f.empresaTransporteId = 1"
            );

            $listadoagencias1 = $query4->getResult();

            $query5 = $em->createQuery(
                "SELECT e.nombre as transporte, count(f.empresaTransporteId) as numero
                    FROM indexBundle:Cliente c,
                         indexBundle:Factura f,
                         indexBundle:AgenciaTransporte e
                    WHERE f.clienteId = c.id 
                      AND e.id = f.empresaTransporteId
                      AND f.fecha
                      BETWEEN :fantigua AND :fnueva
                    GROUP BY transporte
                      "
            )->setParameter("fantigua", $fantigua)
                ->setParameter("fnueva", $fnueva);
            $listadoagencias2 = $query5->getResult();

            return $this->render("indexBundle:Index:listados.html.twig", array("fechaAntigua" => $fechaAntigua, "fechaNueva" => $fechaNueva, "agencias" => $agencias, "listadoagencias1" => $listadoagencias1, "listadoagencias2" => $listadoagencias2));

        } else {
            die("No tiene permiso para ver esta página.");
        }
    }
    public function ajaxFacturasAction(Request $request)
    {
        $session = new Session();

        if($session->has("id"))
        {
            $fecha1 = $request->get("fecha1");
            $fecha2 = $request->get("fecha2");
            $agencia = $request->get("agencia");

            $em = $this->getDoctrine()->getManager();

            $query = $em->createQuery(
                "SELECT c.id, c.nombre, c.apellidos, f.fecha, e.nombre as transporte
                    FROM indexBundle:Cliente c,
                         indexBundle:Factura f,
                         indexBundle:AgenciaTransporte e
                    WHERE f.clienteId = c.id 
                      AND e.id = f.empresaTransporteId
                      AND f.empresaTransporteId = :agencia
                      AND f.date BETWEEN :fecha1 AND :fecha2"
            )->setParameter("agencia", $agencia)
                ->setParameter("fecha1", $fecha1)
                ->setParameter("fecha2", $fecha2);

            $datos = $query->getResult();
//            var_dump($datos);exit;

            // Codificación correcta
            if ($request->isXMLHttpRequest()) {
                return new JsonResponse($datos);
                exit;
            }
        }
    }
    public function ajaxFacturas2Action(Request $request)
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
            echo mb_convert_encoding(json_encode($datos, JSON_UNESCAPED_UNICODE), "utf8");exit;
        }
    }
}
