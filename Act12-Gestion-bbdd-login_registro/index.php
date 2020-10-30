<?php
/* session_start();
unset($_SESSION['user']); 
echo $_SESSION['user'];*/
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TIENDA INFORMATICA</title>
</head>
<body>
    <h1>Inicio de sesión</h1>
    <form action="iniciarSesion.php" method="post">
        <label>User</label><input type="text" name="user">
        <label>Password</label><input type="password" name="passwordc">
        <input type="submit" value="aceptar" name="aceptar">
    </form> 

    <hr>
    <hr>

    <h1>Registro de usuario</h1>
    <form action="registrarUsuario.php" method="post">
        <label>DNI</label><input type="text" name="dni" maxlength="9"><br>
        <label>Nombre</label><input type="text" name="nombre" maxlength="50"><br>
        <label>Apellido1</label><input type="text" name="apellido1" maxlength="50"><br>
        <label>Apellido2</label><input type="text" name="apellido2" maxlength="50"><br>
        <label>Calle</label><input type="text" name="calle" maxlength="150"><br>
        <label>Código Postal</label><input type="text" name="cp" maxlength="5"><br>
        <label>Población</label><input type="text" name="poblacion" maxlength="50"><br>
        <label>Provincia</label><input type="text" name="provincia" maxlength="50"><br>

        <label>User</label><input type="text" name="user" maxlength="100">
        <label>Password</label><input type="password" name="passwordc" maxlength="20">
        <input type="submit" value="aceptar" name="aceptar">
    </form> 
</body>
</html>