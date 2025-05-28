<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import  = "com.productos.seguridad.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmacion</title>
</head>
<body>
	<h3>Datos del Nuevo Empleado</h3>
	<p>
	
	<%
	
	out.println("Su nombre es: "+request.getParameter("txtNombre") + "<br/>");
	String claveAnt = request.getParameter("txtClaveAnterior");
	String claveNew = request.getParameter("txtClaveNueva");
	String repClaveNew = request.getParameter("txtRepClaveNueva");
	
	Usuario user = new Usuario();
	user.ingresarCliente();
	
	%>

	</p>
</body>
</html>