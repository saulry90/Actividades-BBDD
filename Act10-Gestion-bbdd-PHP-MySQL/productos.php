<?php
$sendProducto=$_POST["sendProducto"];
$opcionInsert=$_POST["opcionInsert"];

$codProducto=$_POST["codigoProducto"];
$nproducto=$_POST["nproducto"];
$precioProducto=$_POST["precioProducto"];
$codProveedor=$_POST["codProveedor"];

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
    if (!empty($opcionInsert)) 
    {    
        switch ($opcionInsert) {
            case '1':
                if (isset($sendProducto) && !empty($nproducto) && !empty($precioProducto) && !empty($codProveedor)) 
                {
                    $sql="INSERT INTO PRODUCTOS(nombre_producto,precio,codigo_proveedor) VALUES ('$nproducto',$precioProducto,$codProveedor)";
                    //$result= $conn->query($sql);
                        if ($conn->query($sql)===TRUE)
                        {
                            echo "<p>Nuevo producto añadido</p>";
                            ?>
                            <form action="index.html">
                                <input type="submit" value="ACEPTAR" />
                            </form>						
                        <?php
                        }
                        else 
                        {
                            echo "Error: " . $sql . "<br>" . $conn->error;
                        }
                }
                else {
                    echo "Ingrese los datos del nuevo producto a añadir<br>Redirigiendo...";
                    header('refresh:2;url=./index.html');
        
                }
                break;
            
            case '2':
                if (isset($sendProducto) && !empty($codProducto)) 
                {
                    if (!empty($nproducto)) 
                    {
                        $sql="UPDATE PRODUCTOS SET nombre_producto='$nproducto' WHERE codigo=$codProducto";
                        if ($conn->query($sql)===TRUE)
                        {
                        }
                        else 
                        {
                            echo "Error: " . $sql . "<br>" . $conn->error;
                        }
                    }
                    if (!empty($precioProducto)) 
                    {
                        $sql="UPDATE PRODUCTOS SET precio=$precioProducto WHERE codigo=$codProducto";
                        if ($conn->query($sql)===TRUE)
                        {
                        }
                        else 
                        {
                            echo "Error: " . $sql . "<br>" . $conn->error;
                        }
                    }
                    if (!empty($codProveedor)) 
                    {
                        $sql="UPDATE PRODUCTOS SET codigo_proveedor=$codProveedor WHERE codigo=$codProducto";
                        if ($conn->query($sql)===TRUE)
                        {
                        }
                        else 
                        {
                            echo "Error: " . $sql . "<br>" . $conn->error;
                        }
                    }
                    echo "<p>Producto modificado<p>";
                    ?>
                            <form action="index.html">
                                <input type="submit" value="ACEPTAR" />
                            </form>						
                        <?php
                }
                else {
                    echo "Ingrese el código de producto y las modificaciones<br>Redirigiendo...";
                    header('refresh:2;url=./index.html');
        
                }
                break;

            case '3':
                if (isset($sendProducto) && !empty($codProducto)) 
                {
                
                    $sql="DELETE FROM PRODUCTOS WHERE codigo=$codProducto";
                    if ($conn->query($sql)===TRUE)
                    {
                        echo "Producto eliminado";
                    }
                    else 
                    {
                        echo "Error: " . $sql . "<br>" . $conn->error;
                    }
                
                }
                else {
                    echo "Ingrese los datos del producto a eliminar<br>Redirigiendo...";
                    header('refresh:2;url=./index.html');
        
                }
                break;
        


        }
    }
    else 
    {
        echo "Selecciona alguna opción a realizar<br>Redirigiendo...";
        header('refresh:1;url=./index.html');

    }

}    
?>