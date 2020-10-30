<?php
session_start();

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESTAURANTE</title>
</head>
<body>


    <h1>Administrar</h1>
    <form action="" method="post">
    <select name="opciones">
        <option select hidden value="0">Gestión platos</option>
        <option value="anadir" name="anadir">Añadir plato</option>
        <option value="modificar" name="modificar">Modificar plato</option>
        <option value="eliminar" name="eliminar">Eliminar plato</option>
        <option value="cierre" name="cierre">Cierre caja</option>
	</select>
        <!-- <label>Apellido1</label><input type="text" name="apellido1" maxlength="50"><br>
        <label>Apellido2</label><input type="text" name="apellido2" maxlength="50"><br>
        <label>Dirección</label><input type="text" name="direccion" maxlength="150"><br>
        <label>Provincia</label><input type="text" name="provincia" maxlength="50"><br>
        <label>Teléfono</label><input type="tel" name="telefono" maxlength="12"><br>
        <label>Nombre Admin</label><input type="text" name="admin" maxlength="100">
        <label>Password</label><input type="password" name="passwordc" maxlength="20"> -->
        <input type="submit" value="Aceptar" name="aceptar">
    </form> 
<?php
$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "bbdd_act14restaurante";
    if (isset($_POST["aceptar"])){
        switch ($_POST["opciones"]) {
            case 'anadir':
                echo "<p>AÑADIR PLATO</p>";
                echo "<p>Elija el tipo de plato a añadir, su nombre y su precio en euros</p>";
                ?>
                    <form action="gestion.php" method="post">
                    <label>Tipo de plato</label>
                    <select name="tipoplato">
                        <option select hidden value="0">Elige el tipo de plato</option>
                        <option value="Entrante" name="entrante">Entrante</option>
                        <option value="Primero" name="primero">Primero</option>
                        <option value="Segundo" name="segundo">Segundo</option>
                        <option value="Postre" name="postre">Postre</option>
                    </select>
                    <label>Nombre del plato</label><input type="text" name="nplato" maxlength="120">
                    <label>Precio €</label><input type="text" name="prplato">
                    <input type="submit" value="Añadir" name="anadir">
                    </form>
                <?php
             
                break;
            
            case 'modificar':
                echo "<p>MODIFICAR PLATO</p>";
                $conn = new mysqli($servername, $username, $password, $dbname);
                // Check connection
                if ($conn->connect_error) 
                {
                    die("Connection failed: " . $conn->connect_error);
                }
                else
                {
                echo "<p>Elija el plato a modificar y agregue los nuevos valores</p>";
                ?>
                    <form action="gestion.php" method="post">
                <?php
                    echo "<p><select name='nombre_plato'>
                    <option select hidden value='0'>Elige el plato a modificar</option>";
                    
                        $sql="SELECT nombre_plato FROM PLATO";
                        $result= $conn->query($sql);
                        if ($result->num_rows>0){
                            while($row=$result->fetch_assoc()){
                                $nombreplato=$row['nombre_plato'];
                                echo "<option value='";
                                echo $nombreplato."' name='platoname'>".$nombreplato."</option>";
                            }
                        }
                    echo "</select></p>";
                
                ?>
                    <label>Elige el nuevo tipo de plato</label>
                    <select name="tipoplato">
                        <option select hidden value="0">Elige el tipo de plato</option>
                        <option value="Entrante" name="entrante">Entrante</option>
                        <option value="Primero" name="primero">Primero</option>
                        <option value="Segundo" name="segundo">Segundo</option>
                        <option value="Postre" name="postre">Postre</option>
                    </select>
                    <label>Nuevo nombre del plato</label><input type="text" name="nplato" maxlength="120">
                    <label>nuevo precio €</label><input type="text" name="prplato">
                    <input type="submit" value="Modificar" name="modificar">
                    </form>
                <?php
                    
                    
                }
                break;
                
            case 'eliminar':
                echo "<p>ELIMINAR PLATO</p>";
                $conn = new mysqli($servername, $username, $password, $dbname);
                // Check connection
                if ($conn->connect_error) 
                {
                    die("Connection failed: " . $conn->connect_error);
                }
                else
                {
                echo "<p>Elija el plato a eliminar</p>";
                ?>
                    <form action="gestion.php" method="post">
                <?php
                    echo "<p><select name='nombre_plato'>
                    <option select hidden value='0'>Elige el plato a eliminar</option>";
                    
                        $sql="SELECT nombre_plato FROM PLATO";
                        $result= $conn->query($sql);
                        if ($result->num_rows>0){
                            while($row=$result->fetch_assoc()){
                                $nombreplato=$row['nombre_plato'];
                                echo "<option value='";
                                echo $nombreplato."' name='platoname'>".$nombreplato."</option>";
                            }
                        }
                    echo "</select></p><input type='submit' value='Eliminar' name='eliminar'>
                    </form>";
                }   
                break; 
                
                case 'cierre':
                    echo "<p>CIERRE DE CAJA</p>";
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) 
                    {
                        die("Connection failed: " . $conn->connect_error);
                    }
                    else
                    {
                        $date=date("Y-n-j");
                        $totalganado=0;
                        echo "<p>Dinero total ganado</p>";
                        $sql="SELECT precio FROM pedido WHERE fecha = '$date'";
                        $result= $conn->query($sql);
                        if ($result->num_rows>0){
                            while($row=$result->fetch_assoc()){
                                $pvppedido=$row['precio'];
                                //echo $pvppedido."<br>";
                                $totalganado+=$pvppedido;
                            }
                        }
                        echo "El dinero total ganado hoy es de: ".$totalganado." €<br>";

                        echo "<p>Número total de platos vendidos</p>";
                        $sql2 = "SELECT COUNT(*) total FROM pedido WHERE fecha = '$date'";
                        $result2 = $conn->query($sql2);
                        $fila = $result2->fetch_assoc();
                        echo 'Número de total de platos vendidos: '.$fila['total'];
                        

                        
                        //"SELECT codigo_pedido,nombre_plato,cantidad FROM pedido GROUP BY codigo_pedido";
                       //SELECT codigo_pedido,nombre_plato,cantidad FROM pedido ORDER BY cantidad DESC
                      // SELECT codigo_pedido AS Producto, sum(cantidad) AS cantidad FROM pedido GROUP BY codigo_pedido GROUP BY cantidad DESC limit 4;
                     // SELECT nombre_plato,sum(cantidad) AS suma FROM pedido Group by nombre_plato Order by suma DESC 
                        //SELECT cantidad,codigo_pedido,nombre_plato, sum(cantidad) FROM pedido GROUP BY codigo_pedido ORDER BY sum(cantidad) DESC
                        
                        //$nplatops=array();
                        //$cantplatops=array();

                        echo "<p>Los 5 platos más vendidos</p>";
                        $sql3="SELECT sum(cantidad) as suma,nombre_plato from pedido group by nombre_plato order by suma desc limit 5";
                        $result3= $conn->query($sql3);
                        if ($result3->num_rows>0) {
                            while($row=$result3->fetch_assoc()){
                                $nplatoPe=$row['nombre_plato'];
                                $cantplatoPe=$row['suma'];
                                //$totalPe=$row['total'];
                                echo $nplatoPe.": ".$cantplatoPe." unidades totales vendidas <br>";
                                //echo $row['topvendido']."<tbr>" ;
                                //array_push($nplatops,$nplatoPe);
                                //array_push($cantplatops,$cantplatoPe);
                            }
                        }
                        //print_r($nplatops);
                        




                        /* $sql3="SELECT cantidad,nombre_plato, COUNT( cantidad ) AS topvendido FROM pedido GROUP BY nombre_plato ORDER BY cantidad DESC";
                        $result3= $conn->query($sql3);
                        if ($result3->num_rows>0) {
                            while($row=$result3->fetch_assoc()){
                                $nplatoPe=$row['nombre_plato'];
                                $cantplatoPe=$row['cantidad'];
                                echo $nplatoPe.": ".$cantplatoPe." unidades <br>";
                                //echo $row['topvendido']."<br>" ;
                                
                            }
                        } */ /* $fila2 = $result3->fetch_assoc();
                        print_r($fila2); */
                        /* $sql4="SELECT nombre_plato,precio FROM plato";
                        $result4= $conn->query($sql4);
                        if ($result4->num_rows>0) {
                            while($row=$result4->fetch_assoc()){
                                echo $row['nombre_plato'].": ".$row['precio']."/";
                            }
                        } */
                    }   
                    break;
        }
    }
    
?>
</body>
</html>
