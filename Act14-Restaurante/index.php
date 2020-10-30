<?php
session_start();

session_destroy();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESTAURANTE</title>
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

    <h1>Registro de nuevo usuario</h1>
    <form action="registrarUsuario.php" method="post">
        <label>Nombre</label><input type="text" name="nombre" maxlength="50"><br>
        <label>Apellido1</label><input type="text" name="apellido1" maxlength="50"><br>
        <label>Apellido2</label><input type="text" name="apellido2" maxlength="50"><br>
        <label>Dirección</label><input type="text" name="direccion" maxlength="150"><br>
        <label>Provincia</label><input type="text" name="provincia" maxlength="50"><br>
        <label>Teléfono</label><input type="tel" name="telefono" maxlength="12"><br>
        <label>Nombre User</label><input type="text" name="user" maxlength="100">
        <label>Password</label><input type="password" name="passwordc" maxlength="20">
        <input type="submit" value="aceptar" name="aceptar">
    </form> 
</body>
</html>