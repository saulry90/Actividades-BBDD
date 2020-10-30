<?php
session_start();
//añadir
$tiplato="";


$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "bbdd_act14restaurante";

//comprobar tipo plato del form eligió y almacenarlo en una variable
switch (!empty($_POST["tipoplato"])){
    case 'Entrante':
        $tiplato=$_POST["tipoplato"];
        break;

    case 'Primero':
        $tiplato=$_POST["tipoplato"];
        break;

    case 'Segundo':
        $tiplato=$_POST["tipoplato"];
        break;

    case 'Postre':
        $tiplato=$_POST["tipoplato"];
        break;
}

if (isset($_POST["anadir"]))
{
    
    //comprobar todos los inputs llenos y añadir plato en bbdd
    if (!empty($_POST["nplato"]) && !empty($_POST["prplato"]) && !empty($tiplato)) {
        $nplato=$_POST["nplato"];
        $prplato=$_POST["prplato"];

        $conn = new mysqli($servername, $username, $password, $dbname);
        // Check connection
        if ($conn->connect_error) 
        {
            die("Connection failed: " . $conn->connect_error);
        }
        else
        {
            $sql="INSERT INTO plato (tipo,nombre_plato,precio) VALUES ('$tiplato','$nplato','$prplato')";
                if ($conn->query($sql)===TRUE)
                {
                    echo "<p>Nuevo plato añadido:</p>";
                    echo "<p>".$tiplato." - ".$nplato." - ".$prplato." €</p>";
                    
                }
                else 
                {
                    echo "Error: " . $sql . "<br>" . $conn->error;
                }
        }
    }
    else {
        echo "Debes rellenar los campos<br>Redirigiendo...";
        header('refresh:1;url=./administrar.php');
    }   
}
if (isset($_POST["modificar"])){

    if (!empty($nplato) && !empty($prplato) && !empty($tiplato) && !empty($_POST["nombre_plato"])){
        $nombre_plato=$_POST["nombre_plato"];
        $conn = new mysqli($servername, $username, $password, $dbname);
        // Check connection
        if ($conn->connect_error) 
        {
            die("Connection failed: " . $conn->connect_error);
        }
        else
        {
            $sql="UPDATE plato SET nombre_plato='$nplato',tipo='$tiplato',precio=$prplato WHERE nombre_plato='$nombre_plato'";
                if ($conn->query($sql)===TRUE)
                {
                    echo "<p>Plato modificado:</p>";
                    echo "<p>Has cambiado ".$nombre_plato." a: <br>".$tiplato." - ".$nplato." - ".$prplato." €</p>";
                    
                }
                else 
                {
                    echo "Error: " . $sql . "<br>" . $conn->error;
                }
        }
    }
    else {
        echo "Debes rellenar los campos<br>Redirigiendo...";
        header('refresh:1;url=./administrar.php');
    }
}

if (isset($_POST["eliminar"])){
    if (!empty($_POST["nombre_plato"])){
        $nombre_plato=$_POST["nombre_plato"];
        $conn = new mysqli($servername, $username, $password, $dbname);
        // Check connection
        if ($conn->connect_error) 
        {
            die("Connection failed: " . $conn->connect_error);
        }
        else
        {
            $sql="DELETE FROM plato WHERE nombre_plato='$nombre_plato'";
                if ($conn->query($sql)===TRUE)
                {
                    echo "<p>Plato eliminado:</p>";
                    echo $nombre_plato;
                    
                }
                else 
                {
                    echo "Error: " . $sql . "<br>" . $conn->error;
                }
        }
    }
    else {
        echo "Debes elegir un plato para eliminar<br>Redirigiendo...";
        header('refresh:1;url=./administrar.php');
    }
}
 

?>
                    <form action="administrar.php">
                        <input type="submit" value="ACEPTAR" />
                    </form>						
                    <?php
?>
