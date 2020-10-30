<?php
session_start();
$aceptar=$_POST["aceptar"];
$user=htmlspecialchars($_POST["user"]);
$passwordc=hash('sha256',$_POST["passwordc"]);


$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "bbdd_act14restaurante";


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
        //si no está vacío input user y password 
        if (!empty($user) && !empty($passwordc)) 
        {
            echo "<h1>INICIAR SESION</h1>";


            //2 conexiones con bbdd con la info de user y admin coincidiendo con los valores metidos en los inputs
            $sql="SELECT useradmin,pasword FROM user_admin WHERE useradmin = '$user' AND pasword = '$passwordc'";
            $sql2="SELECT usercliente,pasword FROM USER_CLIENTE WHERE usercliente = '$user' AND pasword = '$passwordc'";
            $result= $conn->query($sql);
            $result2= $conn->query($sql2);
            //si el resultado de la conexion 1(user_admin) tiene una fila en la bbdd
            if ($result->num_rows==1){ 
                echo "<p>ADMIN</p>";
                $_SESSION["user"]=$user;
                $_SESSION["password"]=$passwordc;
                $_SESSION['pedido']=array();
                header('location:administrar.php');
            }
            //si el resultado de la conexion 2(user_cliente) tiene una fila en la bbdd
            elseif ($result2->num_rows==1) {
                echo "<p>USER</p>";
                $_SESSION["user"]=$user;
                $_SESSION["password"]=$passwordc;
                $_SESSION['pedido']=array();
                header('location:pedido.php');
            }
            else 
            {
                echo "Hay algo incorrecto vuelve a intentarlo<br>Redirigiendo...";
                header('refresh:3;url=./index.php');
            }


            
                
            


           /* //seleccionar de la bbdd de la tabla user_cliente el usuario y la contraseña  donde coincidan las variables que se ingresan en los inputs --> con los valores de la bbdd
           $sql2="SELECT usercliente,pasword FROM USER_CLIENTE WHERE usercliente = '$user' AND pasword = '$passwordc'";
           $result2= $conn->query($sql2);
           if ($result2->num_rows==1) 
           {
               $_SESSION["user"]=$user;
               $_SESSION["password"]=$passwordc;
               $_SESSION['pedido']=array();
               //header('location:pedido.php');
               echo "<p>USER</p>";
           }
           else 
           {
               echo "Hay algo incorrecto vuelve a intentarlo<br>Redirigiendo...";
               header('refresh:3;url=./index.php');
           } */




   
        
        }
        else
        {
            echo "Debes rellenar los campos<br>Redirigiendo...";
            header('refresh:2;url=./index.php');
        }

    }
    
}    
?>