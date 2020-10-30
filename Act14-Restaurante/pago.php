<?php
session_start();



/* $ncupon=0;

//variable del input puntos a utilizar
$ncupon=$_POST['ncupon'];

//la mandamos a sesion
$_SESSION["puntosn"]=$ncupon;

//puntos bbdd menos input puntos
$ptotales=$puntostabla-$ncupon;

//precio pedido menos input puntos a descontar
$finalpedido=$sumapedido-$ncupon; */




if(!empty($_SESSION['user']) && !empty($_SESSION['password']))
{
    if (isset($_POST["aceptar"])) {
        //si del formulario el campo del input puntos a utilizar no está vacío --> se muestra su total de pedido descontando los puntos a utilizar
        if (!empty($_POST['ncupon'])) {
            //Array datos pedido form
            $pedido=$_SESSION['pedido'];

            //sesion nombre User
            $sesionuser=$_SESSION['user'];

            //sesion suma total del pedido
            $sumapedido=$_SESSION['totalpedido'];

            //sesion puntos acumulados que tiene el user
            $puntostabla=$_SESSION["puntostabla"];

            //variable del input puntos a utilizar
            $ncupon=$_POST['ncupon'];
            //la mandamos a sesion
            $_SESSION["puntosn"]=$ncupon;

            //puntos bbdd menos input puntos
            $ptotales=$puntostabla-$ncupon;

            //precio pedido menos input puntos a descontar
            $finalpedido=$sumapedido-$ncupon;
            
            echo "<h1>Finalizar pedido</h1>";
            echo "<p>Vas a utilizar <strong>".$ncupon."</strong> puntos para beneficiarte del descuento con lo cual ahora te quedan <strong>".$ptotales."</strong> puntos</p>";
            echo "<p>El precio total a pagar es de: <strong>".$finalpedido."€</strong></p>";
            ?>
            <form action="finPago.php" method="POST">
            <input type="submit" value="Finalizar Pago" name="finpago"/>
            </form>	
            <?php
            
        }
        //si no, se asigna valor 0 a la variable que recoge el input puntos a utilizar y se muestra su total de pedido
        elseif(!isset($_POST['ncupon']) || empty($_POST['ncupon'])) {
            //Array datos pedido form
            $pedido=$_SESSION['pedido'];

            //sesion nombre User
            $sesionuser=$_SESSION['user'];

            //sesion suma total del pedido
            $sumapedido=$_SESSION['totalpedido'];

            //sesion puntos acumulados que tiene el user
            $puntostabla=$_SESSION["puntostabla"];
            
            $ncupon=0;
            //la mandamos a sesion
            $_SESSION["puntosn"]=$ncupon;

            //puntos bbdd menos input puntos
            $ptotales=$puntostabla-$ncupon;

            //precio pedido menos input puntos a descontar
            $finalpedido=$sumapedido-$ncupon;

            echo "<h1>Finalizar pedido</h1>";
            echo "<p>Tienes acumulados: <strong>".$puntostabla."</strong> puntos</p>";

            echo "<p>El precio total a pagar ess de: <strong>".$sumapedido."€</strong></p>";
            ?>
            <form action="finPago.php" method="POST">
            <input type="submit" value="Finalizar Pago" name="finpago"/>
            </form>	
            <?php
        }
    }
}
else 
{
    echo "No está registrado o logueado.Redirigiendo...";
    header('refresh:2;url=./index.php');
}
    
    
    
    


?>