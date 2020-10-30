
<?php 
session_start();
$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "bbdd_act10";

$pruductoscodes=array();
$sesionuser=$_SESSION['user'];



//Si la Session no están vacias
if(!empty($_SESSION['user']) && !empty($_SESSION['contrasena']))
{
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) 
    {
        die("Connection failed: " . $conn->connect_error);
    }
    else
    {
        //var_dump($_SESSION['user']);

            $user="SELECT dni,user FROM CLIENTE WHERE user = '$sesionuser'";
            $resultUser= $conn->query($user);
            if ($resultUser->num_rows>0) {
                
                while($rowUser=$resultUser->fetch_assoc()){

                    echo "Hola ".$rowUser['user']."<br>";
                    echo "<h1>Compra</h1>";
                }
            }
            /* $dnirow=$resultDni->fetch_assoc();
            $dni=$dnirow["dni"]; */

            


        $sql="SELECT nombre_producto,precio,codigo FROM PRODUCTOS";
        $result= $conn->query($sql);
        if ($result->num_rows>0)
        {
            ?>
                <form action="compraOK.php" method="POST">
            <?php

            while($row=$result->fetch_assoc())
            {
                $codigoproducto=$row['codigo'];
                array_push($pruductoscodes,$codigoproducto);
                foreach ($pruductoscodes as $codes => $value) 
                {
                }
                echo "<p>".$row['nombre_producto'].": ".$row['precio']."€ - Unidades:<input type='number' name=";
                echo "$value";
                echo " max='100' style='width:50px;'></p>";
                
            }
            ?>
                
                <input type="submit" value="ACEPTAR" name="aceptar"/>
                </form>						
            <?php
            $_SESSION['codesprod']=$pruductoscodes;

            
        }
        else 
        {
            echo "Ahora no hay productos en la tienda<br>Redirigiendo...";
            header('url=./index.php');
        }

    }
 
}
else 
{
    echo "No está registrado o logueado";
    header('url=./index.php');
}


?>