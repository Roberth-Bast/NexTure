<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Nuevo Clientes</title>
    <link href= "css/Style.css" rel="stylesheet" type= "text/css">
</head>
<body>
	<div class="agrupar">
 		<section>
    <h3>Registro Nuevo Cliente</h3>
    <form action="respuesta.jsp" method="post">
        <table border="1">
            <tr> 
                <td>
                    Nombre
                </td>
                <td>
                    <input type="text" name="txtNombre" maxlength="50    "/>*
                </td> 
            </tr>  
            <tr> 
                <td>Cedula</td>
                <td>
                    <input type="text" name="txtCedula" maxlength="10"/>*
                </td> 
            </tr>
            <tr>
                <td>
                    Estado Civil:
                </td>
                <td><select name="cmbECivil">  
                    <option value="2">Soltero</option> 
                    <option value="1">Casado</option> 
                    <option value="3">Divorciado</option> 
                    <option value="4">Viudo</option> 
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    Lugar de Residencia:
                </td>
                <td>
                    <input type="radio" name="rdResidencia" value="Sur"/>Sur   
                    <input type="radio" name="rdResidencia" value="Norte"/>Norte 
                    <input type="radio" name="rdResidencia" value="Centro"/>Centro
                </td>
            </tr>
            <tr>
                <td>Foto</td>
                <td><input type="file" name="fileFoto" accept=".jpg, .jpeg, .png"></td>
            </tr>
            <tr>
                <td>Mes y Año de Nacimiento</td>
                <td><input type="month" name="fecha" required/>*</td>
            </tr>
            <tr>
                <td>Color favorito</td>
                <td><input type="color" id="color" name="color"/></td>
            </tr>
            <tr>
                <td>Correo electrónico</td>
                <td><input type="text"name = "txtEmail" required />*</td>
            </tr>
            <tr>
                <td>Clave</td>
                <td><input type="password" id="password"  name="txtClave" pattern=".{8,}"  
					title="La contraseña debe tener al menos 8 caracteres"
					required/>*</td>
            </tr>
            <tr>
                <td colspan="2">*campo obligatorio</td> <!-- Para colapsar dos columnas-->
            </tr>
            <tr> <td><input type="submit" name="btnEnviar" id="btnEnviar" value="Enviar"/></td>
            <td><input type="reset" name="btnDelete" id="btnDelete" value="Borrar"/></td></tr>
        </table>
    </form>
    	</section>
    		</div>     	
</body>
</html>