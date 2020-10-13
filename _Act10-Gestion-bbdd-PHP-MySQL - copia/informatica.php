<?php

$opcion=$_POST["opciones_visualizacion"];

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
    if (isset($_POST["enviar"]))
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
                        echo "<p>Código:<strong> ".$row['codigo']." </strong>Nombre:<strong> ".$row['nombre']."</strong> Precio: <strong> ".$row['precio']."</strong> Código de proveedor: <strong> ".$row['codigo_proveedor']."</strong></p>";
                        }
                    } 
                    else 
                    {
                        echo "No se han obtenido resultados";
                    }
                        
                    ?>
                        <form action="index.html">
                            <input type="submit" value="ACEPTAR" />
                        </form>						
                    <?php
                    break;

                    case '2':
                        echo "<h2>Nombres y precios de los productos de la tienda</h2>";
                        $sql="SELECT nombre,precio FROM PRODUCTOS ORDER BY precio";

                        $result= $conn->query($sql);
                        if ($result->num_rows>0) 
                        {
                            while($row=$result->fetch_assoc()) 
                            {
                            echo "<p>Nombre:<strong> ".$row['nombre']." </strong>Precio:<strong> ".$row['precio']."</strong></p>";
                            }
                        } 
                        else 
                        {
                            echo "No se han obtenido resultados";
                        }
                            
                        ?>
                            <form action="index.html">
                                <input type="submit" value="ACEPTAR" />
                            </form>						
                        <?php
                        break;

            }
        }
        else 
        {
            echo "Selecciona alguna opción a realizar<br>Redirigiendo...";
            header('refresh:1;url=./index.html');

        }
    }
}    
?>