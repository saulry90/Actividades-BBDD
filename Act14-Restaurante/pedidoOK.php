<?php
session_start();
$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "bbdd_act14restaurante";

//variable con los puntos que obtiene el usuario con su pedido, se inicializa a 0 y luego toma el valor dependiendo de...
//$puntosobtenidos=0;

if(!empty($_SESSION['user']) && !empty($_SESSION['password']))
{
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) 
    {
        die("Connection failed: " . $conn->connect_error);
    }
    else
    {
        //Array datos pedido form
        $pedido=$_SESSION['pedido'];
        //sesion nombre User
        $sesionuser=$_SESSION['user'];
        //sesion suma total del pedido
        $sumapedido=$_SESSION['totalpedido'];

        
        if (isset($_POST["aceptar"]))
        {
            echo date("Y-n-j");
            echo "<h1>Tu Pedido es:</h1>";

            //Recorrer array sesion de los datos del pedido form y mostrar las unidades el nombre del plato y el precio
            foreach ($pedido as $elpedido => $plato) {
                echo "Unidades: ".$plato[2]." - ".$plato[0]." - Precio total: <strong>".$plato[3]."€</strong><br>";
            }

            //Muestra la sesion sumapedido y si es dependiendo de... la cantidad le asigna un valor a la variable puntosobtenidos
            echo "<p>El total a pagar es: <strong>".$sumapedido."€</strong></p>";

            if ($sumapedido>0 && $sumapedido<30) {
                $puntosobtenidos=10;
            }
            elseif ($sumapedido>=30 && $sumapedido<70) {
                $puntosobtenidos=30;
            }
            else {
                $puntosobtenidos=50;
            }
    
            //seleccionar puntos del cliente mientras el campo usercliente de la bbdd sea igual a la sesion user
            $sql3="SELECT puntos FROM user_cliente WHERE usercliente = '$sesionuser'";
            $result3= $conn->query($sql3);
            if ($result3->num_rows>0){

                while($row=$result3->fetch_assoc())
                {
                    //si los puntos almacenados en la bbdd del user son mas que 0  -> crear un form que recoja los puntos que desea utulizar en este pedido
                    if ($row['puntos']>0) {
                    //puntos de la bbdd    
                    $npuntos=$row['puntos'];
                    $maxutilpuntos=$npuntos;
                    if ($npuntos>$sumapedido) {
                        //variable limitadora de puntos a utilizar
                        $maxutilpuntos=$sumapedido;
                    }
                    echo "<p>Tienes acumulados <strong>".$npuntos."</strong> puntos.<br> Con este pedido obtienes <strong>".$puntosobtenidos."</strong> puntos</p>";
                    echo "<form action = 'pago.php' method = 'post'><label>Cantidad de puntos a utilizar:</label><input type='number' value='' name='ncupon' min='0' max='";
                    echo $maxutilpuntos;
                    echo "' ><p><input type='submit' value='ACEPTAR' name='aceptar'/></p></form>";
                    //mandar a sesion puntos acumulados que tiene el user
                    $_SESSION["puntostabla"]=$npuntos;
                    
                    if (isset($_POST["aceptar"])) {
                        if (!empty($_POST["ncupon"])) {
                            
                        }
                    }
                    }
                    else {
                        echo "Con este pedido obtienes <strong>".$puntosobtenidos."</strong> puntos</p>";
                        echo "<form action = 'pago.php' method = 'post'><input type='submit' value='ACEPTAR' name='aceptar'/></form>";
                    }
                }
            }
        }
    }
}
else 
{
    echo "No está registrado o logueado.Redirigiendo...";
    header('refresh:2;url=./index.php');
}

?>