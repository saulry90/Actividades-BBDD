
<?php 
function recarga(){
    header('Location: pedido.php');
}

session_start();

$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "bbdd_act14restaurante";

$sumpedido=0;

//Si la Session no están vacias
if(!empty($_SESSION['user']) && !empty($_SESSION['password']))
{
    $sesionuser=$_SESSION['user'];
    $sesionpass=$_SESSION['password'];

    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) 
    {
        die("Connection failed: " . $conn->connect_error);
    }
    else
    {
        //selecciona user y pass de la tabla user_cliente si user es = a sesion user y pass = a sesion pass
        $user="SELECT usercliente,pasword FROM USER_CLIENTE WHERE usercliente = '$sesionuser' AND pasword = '$sesionpass'";
        $resultUser= $conn->query($user);
        if ($resultUser->num_rows>0) {
            
            while($rowUser=$resultUser->fetch_assoc()){

                echo "Hola ".$rowUser['usercliente']."<br>";
                echo "<h1>Haz tu pedido</h1>";
            }
        }
        echo "<form action = 'pedido.php' method = 'post'>";
        echo "<p><select name='tipoplato'>
        <option select hidden value='0'>Filtra por tipo de plato</option>";
        
        //CREAR filtro tipo plato
        //seleccion de tipo de plato la bbdd plato y crea los option del select del form con los datos    
        $sql1="SELECT DISTINCT tipo FROM PLATO";
        $result1= $conn->query($sql1);
        if ($result1->num_rows>0)
        {
        while($row=$result1->fetch_assoc())
        {
            $tipoplato=$row['tipo'];
            echo "<option value='";
            echo $tipoplato."' name='tplatoname'>".$tipoplato."</option>";
        }
        }
        echo "</select><input type='submit' value='ACEPTAR' name='aceptar'/></form></p>";
        
        if (isset($_POST["aceptar"]))
        {
            //si del form no se selecciona nada: "elige para filtrar", si no muestra el form con los platos
            switch ($_POST["tipoplato"]) {
                case '0':
                    echo "Elige para filtrar";
                    break;
                
                default:
                    $inputPlatot=$_POST["tipoplato"];
                    echo "Has elegido: ";
                    //selecciona valores de la bbdd plato para crear el form
                    $sql2="SELECT tipo,nombre_plato,precio,cantidad FROM plato WHERE tipo = '$inputPlatot'";
                    $result2= $conn->query($sql2);
                    if ($result2->num_rows>0){

                        while($row=$result2->fetch_assoc())
                        {
                            $nombreplato=$row['nombre_plato'];
                            $nameInput=strtolower(str_replace(' ','',$nombreplato));
                            $tipoplato=$row['tipo'];
                            $precioplato=$row['precio'];
                            $cantplato=$row['cantidad'];
                            
                            echo "<form action = '' method = 'post'>";
                            echo "<input type='hidden' value='$nombreplato' name='nomplato'>";
                            echo "<input type='hidden' value='$precioplato' name='preciop'>";

                            echo $tipoplato." -> ".$nombreplato.": <strong>".$precioplato."</strong> <input type='number' name='cantplato' max='$cantplato' style='width:50px;'>";
                            echo "<input type = 'submit' name = 'anadir' value = 'Añadir'>";
                            echo "</form>";
                        }
                    }
                    else 
                    {
                        echo "No hay datos en bbdd";
                        //header('url=./index.php');
                    }
                    break;
            }
        }
    }
    echo "<p>Productos Añadidos:</p>";

        //función añade a array de sesion pedido el array plato, que tiene la información de cada plato
        function pedir($sesionuser)
        {
            if(isset($_POST['anadir']))
            {
                
                //esto se muestra sin el location:
                //echo "<p>".$_POST["nomplato"]." ";
                //echo "<strong>".$_POST["preciop"]."€ </strong>";
                //echo "Número de platos añadidos: <strong>".$_POST["cantplato"]."</strong><br></p>";

                
                $plato=array($_POST["nomplato"],$_POST["preciop"],$_POST["cantplato"],($_POST["preciop"]*$_POST["cantplato"]));
                array_push($_SESSION['pedido'],$plato);

                //para que no se realice la repetición del ultimo dato del form:
                //header('Location: pedido.php');
                recarga();

            }
        }
        // Llamamos a la función para que se ejecute
        pedir($sesionuser);


        //recorrer array de la sesion pedido para mostrar los platos que ha pedido y su precio
        foreach ($_SESSION['pedido'] as $pedido => $plato) {
            echo $plato[0]." -> <strong>".$plato[1]."€</strong> Num platos: <strong>".$plato[2]."</strong> Total = <strong>".$plato[3]."€</strong><br>";
            $sumpedido+=$plato[3];
        }

        //mandar a sesion total del pedido
        $_SESSION['totalpedido']=$sumpedido;

        echo "<p>Total del pedido: <strong>".$_SESSION['totalpedido']."€ </strong></p>";

        ?>
        <form action="pedidoOK.php" method="POST">
        <input type="submit" value="ACEPTAR" name="aceptar"/>
        </form>	
        <?php
    }
else 
{
    echo "No está registrado o logueado.Redirigiendo...";
    header('refresh:2;url=./index.php');
}
?>