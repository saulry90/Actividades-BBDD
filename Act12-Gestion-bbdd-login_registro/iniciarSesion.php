<?php
session_start();
$aceptar=$_POST["aceptar"];
$user=htmlspecialchars($_POST["user"]);
$passwordc=hash('sha256',$_POST["passwordc"]);


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
    if (isset($_POST["aceptar"]))
    {
        if (!empty($user) && !empty($passwordc)) 
        {
            echo "<h1>INICIAR SESION</h1>";

            $sql="SELECT user,contrasena FROM CLIENTE WHERE user = '$user' AND contrasena = '$passwordc'";
            $result= $conn->query($sql);
            if ($result->num_rows==1) 
            {
                $_SESSION["user"]=$user;
                $_SESSION["contrasena"]=$passwordc;
                //$_SESSION["carro"]=array();//array para luego ir metiendo productos
                header('location:tiendashop.php');
                echo "YES";
            }
            else 
            {
                echo "Hay algo incorrecto vuelve a intentarlo<br>Redirigiendo...";
                header('refresh:1;url=./index.php');
            }

        }
        else
        {
            echo "Debes rellenar los campos<br>Redirigiendo...";
            header('refresh:1;url=./index.php');
        }

    }
}    
?>