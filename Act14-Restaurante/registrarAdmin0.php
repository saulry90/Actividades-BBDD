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


    <h1>Registro de nuevo admin</h1>
    <form action="registrarAdmin.php" method="post">
        <label>Nombre</label><input type="text" name="nombre" maxlength="50"><br>
        <label>Apellido1</label><input type="text" name="apellido1" maxlength="50"><br>
        <label>Apellido2</label><input type="text" name="apellido2" maxlength="50"><br>
        <label>Dirección</label><input type="text" name="direccion" maxlength="150"><br>
        <label>Provincia</label><input type="text" name="provincia" maxlength="50"><br>
        <label>Teléfono</label><input type="tel" name="telefono" maxlength="12"><br>
        <label>Nombre Admin</label><input type="text" name="admin" maxlength="100">
        <label>Password</label><input type="password" name="passwordc" maxlength="20">
        <input type="submit" value="aceptar" name="aceptar">
    </form> 
</body>
</html>