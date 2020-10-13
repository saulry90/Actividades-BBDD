<?php
$sendProveedor=$_POST["sendProveedor"];
$opcionInsertProv=$_POST["opcionInsertProv"];

$nproveedor=$_POST["nproveedor"];
$provedorCod=$_POST["provedorCod"];

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
    if (!empty($opcionInsertProv))
    {
        switch ($opcionInsertProv) {
            case '1':
                if (isset($sendProveedor) && !empty($nproveedor))
                {
                    $sql="INSERT INTO PROVEEDOR (nombre_proveedor) VALUES ('$nproveedor')";
                        if ($conn->query($sql)===TRUE)
                        {
                            echo "<p>Nuevo proveedor añadido</p>";
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
                    echo "Ingrese los datos del proveedor a añadir<br>Redirigiendo...";
                    header('refresh:2;url=./index.html');
        
                }
                break;
            
            case '2':
                if (isset($sendProveedor) && !empty($provedorCod))
                {
                    $sql="UPDATE PROVEEDOR SET nombre_proveedor='$nproveedor' WHERE codigo=$provedorCod";
                        if ($conn->query($sql)===TRUE)
                        {
                            echo "<p>Proveedor modificado</p>";
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
                    echo "Ingrese el código del proveedor a modificar<br>Redirigiendo...";
                    header('refresh:2;url=./index.html');
        
                }
                break;

            case '3':
                if (isset($sendProveedor) && !empty($provedorCod))
                {
                    $sql="DELETE FROM PROVEEDOR WHERE codigo=$provedorCod";
                    if ($conn->query($sql)===TRUE)
                    {
                        echo "Proveedor eliminado";
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
                    echo "Ingrese el código del proveedor a eliminar<br>Redirigiendo...";
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