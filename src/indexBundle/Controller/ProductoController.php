<?php

namespace indexBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class ProductoController extends Controller
{
    public function indexAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $query = $em->createQuery(
            "SELECT p.marca, p.modelo, p.descripcion, p.precio, p.stockActual, i.url, c.nombre categoria
                FROM indexBundle:Producto p,
                      indexBundle:Imagen i,
                      indexBundle:ImagenTieneProducto itp,
                      indexBundle:Categoria c
                WHERE p.id = itp.productoId
                      AND itp.imagenId = i.id
                      AND p.id = :id
                      AND p.categoriaId = c.id"
        )->setParameter("id", $id);

        $producto = $query->getResult();

        $query2 = $em->createQuery(
            "SELECT at.nombre, u.ubicacion, atu.precio
                FROM indexBundle:AgenciaTransporte at,
                     indexBundle:ubicacion u,
                     indexBundle:AgenciaTieneUbicacion atu 
                WHERE at.id=atu.agenciaId 
                  AND u.id=atu.ubicacionId
                  ORDER BY at.id, u.id"
        );
        $precio = $query2->getResult();
//        var_dump($precio[0]["precio"]);exit;
        $query3 = $em->createQuery(
            "SELECT at.id,at.nombre
                FROM indexBundle:AgenciaTransporte at
                  ORDER BY at.id"
        );
        $agencias = $query3->getResult();
        $query4 = $em->createQuery(
            "SELECT u.id,u.ubicacion
                FROM indexBundle:ubicacion u
                  ORDER BY u.id"
        );
        $ubicacion = $query4->getResult();
//        var_dump($agencias);exit;

        if(!empty($producto)) {
            for($i = 1; $i < count($producto); $i++) {
                $producto[0]["url"] .= "," . $producto[$i]["url"];
            }

            for($j = count($producto) - 1; $j > 0; $j--) {
                unset($producto[$j]);
            }

            $producto = array_values($producto);

            //var_dump($producto);exit;


            return $this->render("indexBundle:Index:producto.html.twig", array("producto" => $producto,"agencias" => $agencias, "ubicacion" => $ubicacion, "precio" => $precio));
        }
        else {
            return $this->render("indexBundle:Index:404producto.html.twig");
        }
    }
}
