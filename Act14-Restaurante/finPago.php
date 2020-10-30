<?php
session_start();



$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "bbdd_act14restaurante";


if(!empty($_SESSION['user']) && !empty($_SESSION['password']))
{
    if (isset($_POST["finpago"]))
    {
        //sesion nombre User
        $sesionuser=$_SESSION['user'];

        //sesion puntos input
        $utilpuntos=$_SESSION["puntosn"];

        //Array datos pedido form
        $pedido=$_SESSION['pedido'];

        //sesion suma total del pedido
        $sumapedido=$_SESSION['totalpedido'];

        echo "<h1>Gracias. Vuelve pronto!!</h1>";
        
        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) 
        {
            die("Connection failed: " . $conn->connect_error);
        }
        else
        {
            echo "<p>Tu pedido:</p>";
            //Meter el pedido en la bbdd
            //Recorrer array sesion de los datos del pedido form e insertarlo en la tabla pedido
            foreach ($pedido as $elpedido => $plato) {
                    
                echo $plato[0].": <strong>".$plato[3]."€</strong><br>";

                $sql="INSERT INTO PEDIDO(usercliente,precio,nombre_plato,fecha,cantidad) values ('$sesionuser','$plato[3]','$plato[0]',NOW(),$plato[2])";
                    $result = $conn->query($sql);
                    if($result) 
                    {
                        //echo "Has efectuado tu pedido";
                    }
                    else
                    {
                        echo "Error al actualizar la base de datos: " . $sql . "<br>" . $conn->error;
                    }
            }
            echo "<p>TOTAL: <strong>".$sumapedido."</strong></p>";

            //Meter los puntos en la bbdd
            //función con los argumentos de la variable conexion, la variable de sesion usuario, y la variable puntos (que ira dentro de cada if para indicar los putos que se van a agregar).
            function sumpuntos($conn,$sesionuser,$puntos){
                $sql2="UPDATE user_cliente SET puntos = (SELECT puntos FROM user_cliente WHERE usercliente = '$sesionuser') + $puntos WHERE usercliente = '$sesionuser'";
                    if ($conn->query($sql2)===TRUE)
                    {
                        echo "<hr><p>Se han agregado <strong>".$puntos."</strong> puntos</p>";
                        
                    }
                    else 
                    {
                        echo "Error: " . $sql2 . "<br>" . $conn->error;
                    }
            }
            //comparar la variable de sesion con el total del pedido y dependiendo del coste, ejecutar la funcion que agrega los puntos a la bbdd
            if ($sumapedido>0 && $sumapedido<30) {
                $puntos=10;
                sumpuntos($conn,$sesionuser,$puntos);
                
            }
            elseif ($sumapedido>=30 && $sumapedido<70) {
                $puntos=30;
                sumpuntos($conn,$sesionuser,$puntos);
            }
            else{
                $puntos=50;
                sumpuntos($conn,$sesionuser,$puntos);
            }

            
            $sql3="UPDATE user_cliente SET puntos = (SELECT puntos FROM user_cliente WHERE usercliente = '$sesionuser') - $utilpuntos WHERE usercliente = '$sesionuser'";
            $result= $conn->query($sql3);


        } 
        ?>
        <!-- <form action="pedido.php" method="POST">
        <input type="submit" value="Seguir comprando" name="scomprando"/>
        </form>	 -->
        <form action="index.php" method="POST">
        <input type="submit" value="Desconectar" name="logout"/>
        </form>	
        
        <?php

    }

}
else 
{
    echo "No está registrado o logueado.Redirigiendo...";
    header('refresh:2;url=./index.php');
}
            



?>