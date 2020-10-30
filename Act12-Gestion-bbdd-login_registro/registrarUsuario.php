<?php
$dni=htmlspecialchars($_POST["dni"]);
$nombre=htmlspecialchars($_POST["nombre"]);
$apellido1=htmlspecialchars($_POST["apellido1"]);
$apellido2=htmlspecialchars($_POST["apellido2"]);
$calle=htmlspecialchars($_POST["calle"]);
$cp=htmlspecialchars($_POST["cp"]);
$poblacion=htmlspecialchars($_POST["poblacion"]);
$provincia=htmlspecialchars($_POST["provincia"]);

$user=htmlspecialchars($_POST["user"]);
$passwordc=hash('sha256',$_POST["passwordc"]);
$aceptar=$_POST["aceptar"];


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
        if (!empty($dni) && !empty($nombre) && !empty($calle) && !empty($provincia) && !empty($user) && !empty($passwordc)) 
        {
            echo "<h1>REGISTRAR</h1>";
            $sql="INSERT INTO CLIENTE (dni,nombre,apellido1,apellido2,calle,cp,poblacion,provincia,user,contrasena) VALUES ('$dni','$nombre','$apellido1','$apellido2','$calle','$cp','$poblacion','$provincia','$user','$passwordc')";
            //$result= $conn->query($sql);
                if ($conn->query($sql)===TRUE)
                {
                    echo "<p>Usuario registrado como cliente!!</p>";
                    ?>
                    <form action="index.php">
                        <input type="submit" value="ACEPTAR" />
                    </form>						
                    <?php
                }
                else 
                {
                    echo "Error: " . $sql . "<br>" . $conn->error;
                }
        }
        //*/*/*/*/Si el usuario a registrar ya existe????¿?¿??¿
        else
        {
            echo "Debes rellenar los campos<br>Redirigiendo...";
            header('refresh:1;url=./index.php');
        }
    }
}    
?>