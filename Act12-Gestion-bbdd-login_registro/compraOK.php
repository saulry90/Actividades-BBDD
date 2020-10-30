<?php
session_start();
$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "bbdd_act10";

$sesionuser=$_SESSION['user'];

$ClienteUserDni="";
$valProductsAdd=array();

$arraycodes=$_SESSION['codesprod'];

//array de codigos de producto => unidades producto
$codprodUnids=array();

//print_r($arraycodes);
foreach ($arraycodes as $codes => $value) 
{
    //echo"<p>".$value."</p>";


    //echo $value."<br>";
    $codigomanual[$value]=$_POST[$value];

}

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) 
{
    die("Connection failed: " . $conn->connect_error);
}
else
{
    if (isset($_POST["aceptar"]))
    {
        echo "<h1>Tu Compra</h1>";

        //selecciona dni de la tabla que sea igual al del user de la sesion y manda ese dni a la variable ClienteUserDni
        $dniCliente="SELECT dni,user FROM CLIENTE WHERE user = '$sesionuser'";
        $resultDni= $conn->query($dniCliente);
        if ($resultDni->num_rows>0) {
            
            while($rowdni=$resultDni->fetch_assoc()){
                //echo $rowdni['dni']."<br>";
                //echo $rowdni['user']."<br>";
                //echo $sesionuser."<br>";
                $ClienteUserDni=$rowdni['dni'];
            }
        }

        $codProducto="SELECT codigo FROM PRODUCTOS ORDER BY codigo";
        $resultcod= $conn->query($codProducto);
        if ($resultcod->num_rows>0) {
            //echo "<hr>";
                foreach ($arraycodes as $codes => $value) 
            {
                $codigomanual[$value]=$_POST[$value];//array unidades (por orden de inputs)
                //print_r($codigomanual[$value]);
                array_push($valProductsAdd,$codigomanual[$value]);//meter en array para asociar indice=>unidades producto
            }
            
            //echo "<hr>";
            //print_r($arraycodes);//array indice=>código de producto
            //echo "<hr>";
            //print_r($valProductsAdd);//array indice(pos input)=>unidades producto
            //echo "<hr>";

            //combinar array de codigos de producto con array unidades producto
            $codprodUnids=array_combine($arraycodes,$valProductsAdd);
            //echo "<hr>";
            //print_r($codprodUnids);


            foreach ($codprodUnids as $codes => $uds) {
                
                //si hay unidades de producto
                if ($uds!="") {
                    //insertar en la tabla compra
                    //???¿¿¿ Comprobar si ya existe codigo producto añadir a compra
                    $sql="INSERT INTO COMPRA(dni_cliente,codigo_producto,fecha_compra,unidades) values ('$ClienteUserDni',$codes,NOW(),$uds)";
                    $result = $conn->query($sql);
                    if($result) 
                    {
                        echo "<p>Código de producto:".$codes." _ Unidades:".$uds."</p>";
                    }
                    else
                    {
                        echo "Error al actualizar la base de datos: " . $sql . "<br>" . $conn->error;
                    }
                    echo "<hr>";
                    
                    //actualizar unidades de cada producto en base de datos
                    $sql1 = "UPDATE PRODUCTOS SET totalunidades = totalunidades -(".$uds.") WHERE codigo =".$codes."";
                    $result1 = $conn->query($sql1);
                    if($result1) 
                    {
                        //echo "Número de unidades actualizado.";
                        ?>
                        <form action="tiendaShop.php">
                            <input type="submit" value="Seguir Comprando" />
                        </form>	
                        <form action="index.php">
                            <input type="submit" value="Desconectar" />
                        </form>					
                        <?php
                        

                    }
                    else
                    {
                        echo "Error al actualizar la base de datos: " . $sql1 . "<br>" . $conn->error;
                    }
                }
            }

        }

    }
    
}






?>