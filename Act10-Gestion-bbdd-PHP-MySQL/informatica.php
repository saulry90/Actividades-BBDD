<?php
$verOpcion=$_POST["verOpcion"];
$opcion=$_POST["opciones_visualizacion"];



$claveProveedor=$_POST["claveProveedor"];
$precioProd1=$_POST["precioProd1"];
$precioProd2=$_POST["precioProd2"];
$tipoProveedor=$_POST["tipoProveedor"];
$nombreProveedor=$_POST["nombreProveedor"];

$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "bbdd_act10";

$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) 
{
    die("Connection failed: " . $conn->connect_error);
}
else
{
    if (isset($_POST["verOpcion"]))
    {
        if (!empty($opcion)) 
        {
            switch ($opcion) 
            {
                case '1':
                    echo "<h2>Todos los productos de la tienda</h2>";
                    $sql="SELECT * FROM PRODUCTOS;";

                    $result= $conn->query($sql);
                    if ($result->num_rows>0) 
                    {
                        while($row=$result->fetch_assoc()) 
                        {
                        echo "<p>Código:<strong> ".$row['codigo']." </strong>Nombre:<strong> ".$row['nombre_producto']."</strong> Precio: <strong> ".$row['precio']."</strong> Código de proveedor: <strong> ".$row['codigo_proveedor']."</strong></p>";
                        }
                        ?>
                        <form action="index.html">
                            <input type="submit" value="ACEPTAR" />
                        </form>						
                        <?php
                    } 
                    else 
                    {
                        echo "No se han obtenido resultados";
                        ?>
                        <form action="index.html">
                            <input type="submit" value="ACEPTAR" />
                        </form>						
                        <?php
                    }
                    break;

                case '2':
                    echo "<h2>Nombres y precios de los productos de la tienda</h2>";
                    $sql="SELECT nombre_producto,precio FROM PRODUCTOS";

                    $result= $conn->query($sql);
                    if ($result->num_rows>0) 
                    {
                        while($row=$result->fetch_assoc()) 
                        {
                        echo "<p>Nombre:<strong> ".$row['nombre_producto']." </strong>Precio:<strong> ".$row['precio']."</strong></p>";
                        }
                        ?>
                        <form action="index.html">
                            <input type="submit" value="ACEPTAR" />
                        </form>						
                        <?php
                    } 
                    else 
                    {
                        echo "No se han obtenido resultados";
                        ?>
                    <form action="index.html">
                        <input type="submit" value="ACEPTAR" />
                    </form>						
                    <?php
                    }
                    break;

                case '3':
                    echo "<h2>Productos según clave específica</h2>";
                    $sql="SELECT * FROM PRODUCTOS WHERE codigo_proveedor = $claveProveedor";

                    $result= $conn->query($sql);
                    if ($result->num_rows>0) 
                    {
                        while($row=$result->fetch_assoc()) 
                        {
                        echo "<p>Nombre:<strong> ".$row['nombre_producto']." </strong>Precio:<strong> ".$row['precio']."</strong></p>";
                        }
                        ?>
                        <form action="index.html">
                            <input type="submit" value="ACEPTAR" />
                        </form>						
                        <?php
                    } 
                    else 
                    {
                        echo "No se han obtenido resultados";
                        ?>
                    <form action="index.html">
                        <input type="submit" value="ACEPTAR" />
                    </form>						
                    <?php
                    }
                    break;

                case '4':
                    echo "<h2>Productos de un tipo en concreto</h2>";
                    $sql="SELECT * FROM PRODUCTOS WHERE nombre_producto LIKE '%$tipoProveedor%' ";

                    $result= $conn->query($sql);
                    if ($result->num_rows>0) 
                    {
                        while($row=$result->fetch_assoc()) 
                        {
                        echo "<p>Nombre:<strong> ".$row['nombre_producto']." </strong>Precio:<strong> ".$row['precio']."</strong></p>";
                        }
                        ?>
                        <form action="index.html">
                            <input type="submit" value="ACEPTAR" />
                        </form>						
                        <?php
                    } 
                    else 
                    {
                        echo "No se han obtenido resultados";
                        ?>
                    <form action="index.html">
                        <input type="submit" value="ACEPTAR" />
                    </form>						
                    <?php
                    }
                    break;

                case '5':
                    echo "<h2>Productos igual o superior al precio</h2>";
                    $sql="SELECT * FROM PRODUCTOS WHERE precio >= $precioProd1;
                    ";

                    $result= $conn->query($sql);
                    if ($result->num_rows>0) 
                    {
                        while($row=$result->fetch_assoc()) 
                        {
                        echo "<p>Nombre:<strong> ".$row['nombre_producto']." </strong>Precio:<strong> ".$row['precio']."</strong></p>";
                        }
                        ?>
                        <form action="index.html">
                            <input type="submit" value="ACEPTAR" />
                        </form>						
                        <?php
                    } 
                    else 
                    {
                        echo "No se han obtenido resultados";
                        ?>
                    <form action="index.html">
                        <input type="submit" value="ACEPTAR" />
                    </form>						
                    <?php
                    }
                    break;

                case '6':
                    echo "<h2>Productos entre dos precios</h2>";
                    $sql="SELECT * FROM PRODUCTOS WHERE precio BETWEEN $precioProd1 AND $precioProd2;
                    ";

                    $result= $conn->query($sql);
                    if ($result->num_rows>0) 
                    {
                        while($row=$result->fetch_assoc()) 
                        {
                        echo "<p>Nombre:<strong> ".$row['nombre_producto']." </strong>Precio:<strong> ".$row['precio']."</strong></p>";
                        }
                        ?>
                        <form action="index.html">
                            <input type="submit" value="ACEPTAR" />
                        </form>						
                        <?php
                    } 
                    else 
                    {
                        echo "No se han obtenido resultados";
                        ?>
                    <form action="index.html">
                        <input type="submit" value="ACEPTAR" />
                    </form>						
                    <?php
                    }
                    break; 
                    
                case '7':
                    
                    echo "<h2>Productos del fabricante</h2>";
                    $sql="SELECT * FROM PRODUCTOS WHERE codigo_proveedor = (SELECT codigo FROM PROVEEDOR WHERE nombre_proveedor = '$nombreProveedor')";
                    

                    $result= $conn->query($sql);
                    if ($result->num_rows>0) 
                    {
                        while($row=$result->fetch_assoc()) 
                        {
                        echo "<p>Nombre:<strong> ".$row['nombre_producto']." </strong>Precio:<strong> ".$row['precio']."</strong></p>";
                        }
                        ?>
                        <form action="index.html">
                            <input type="submit" value="ACEPTAR" />
                        </form>						
                        <?php
                    } 
                    else 
                    {
                        echo "No se han obtenido resultados";
                        ?>
                    <form action="index.html">
                        <input type="submit" value="ACEPTAR" />
                    </form>						
                    <?php
                    }
                    break;
                        
                case '8':
                    
                    echo "<h2>Productos con su fabricante</h2>";
                    $sql="SELECT * FROM PRODUCTOS,PROVEEDOR WHERE PRODUCTOS.codigo_proveedor=PROVEEDOR.codigo";
                    

                    $result= $conn->query($sql);
                    if ($result->num_rows>0) 
                    {
                        while($row=$result->fetch_assoc()) 
                        {
                        echo "<p>Nombre:<strong> ".$row['nombre_producto']." </strong>Precio:<strong> ".$row['precio']." </strong>Proveedor:<strong> ".$row['nombre_proveedor']."</strong></p>";
                        }
                        ?>
                        <form action="index.html">
                            <input type="submit" value="ACEPTAR" />
                        </form>						
                        <?php
                    } 
                    else 
                    {
                        echo "No se han obtenido resultados";
                        ?>
                    <form action="index.html">
                        <input type="submit" value="ACEPTAR" />
                    </form>						
                    <?php
                    }
                    break;

                case '9':
                    
                    echo "<h2>Productos del fabricante ordenado por nombre Ascendente </h2>";
                    $sql="SELECT * FROM PRODUCTOS WHERE codigo_proveedor = $claveProveedor ORDER BY nombre_producto";
                    

                    $result= $conn->query($sql);
                    if ($result->num_rows>0) 
                    {
                        while($row=$result->fetch_assoc()) 
                        {
                        echo "<p>Nombre:<strong> ".$row['nombre_producto']." </strong>Precio:<strong> ".$row['precio']." </strong></p>";
                        }
                        ?>
                        <form action="index.html">
                            <input type="submit" value="ACEPTAR" />
                        </form>						
                        <?php
                    } 
                    else 
                    {
                        echo "No se han obtenido resultados";
                        ?>
                    <form action="index.html">
                        <input type="submit" value="ACEPTAR" />
                    </form>						
                    <?php
                    }
                    break;

                case '10':
                    
                    echo "<h2>Productos del fabricante ordenado por precio DESCENDENTE </h2>";
                    $sql="SELECT * FROM PRODUCTOS WHERE codigo_proveedor = (SELECT codigo FROM PROVEEDOR WHERE nombre_proveedor = '$nombreProveedor') ORDER BY precio DESC";
                    

                    $result= $conn->query($sql);
                    if ($result->num_rows>0) 
                    {
                        while($row=$result->fetch_assoc()) 
                        {
                        echo "<p>Nombre:<strong> ".$row['nombre_producto']." </strong>Precio:<strong> ".$row['precio']." </strong></p>";
                        }
                        ?>
                        <form action="index.html">
                            <input type="submit" value="ACEPTAR" />
                        </form>						
                        <?php
                    } 
                    else 
                    {
                        echo "No se han obtenido resultados";
                        ?>
                    <form action="index.html">
                        <input type="submit" value="ACEPTAR" />
                    </form>						
                    <?php
                    }
                    break;

            }
        }
        else 
        {
            echo "!!!Selecciona alguna opción a realizar<br>Redirigiendo...";
            header('refresh:1;url=./index.html');

        }
    }
}    
?>