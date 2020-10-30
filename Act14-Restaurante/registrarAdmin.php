<?php
$nombre=htmlspecialchars($_POST["nombre"]);
$apellido1=htmlspecialchars($_POST["apellido1"]);
$apellido2=htmlspecialchars($_POST["apellido2"]);
$direccion=htmlspecialchars($_POST["direccion"]);
$provincia=htmlspecialchars($_POST["provincia"]);
$telefono=htmlspecialchars($_POST["telefono"]);

$admin=htmlspecialchars($_POST["admin"]);
$passwordc=hash('sha256',$_POST["passwordc"]);
$aceptar=$_POST["aceptar"];


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
        if (!empty($nombre) && !empty($direccion) && !empty($provincia) && !empty($telefono) && !empty($admin) && !empty($passwordc)) 
        {
            echo "<h1>REGISTRAR</h1>";
            $sql="INSERT INTO user_admin (nombre,apellido1,apellido2,direccion,tlfno,provincia,useradmin,pasword) VALUES ('$nombre','$apellido1','$apellido2','$direccion','$telefono','$provincia','$admin','$passwordc')";
            //$result= $conn->query($sql);
                if ($conn->query($sql)===TRUE)
                {
                    echo "<p>Nuevo administrador registrado!!</p>";
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
        else
        {
            echo "Debes rellenar los campos<br>Redirigiendo...";
            header('refresh:1;url=./index.php');
        }
    }
}    
?>