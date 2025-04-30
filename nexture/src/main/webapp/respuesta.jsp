<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nuevo Cliente</title>
</head>
<body>
	<h3>Datos del Nuevo Cliente</h3>
	<p>
	
	<%
	
	out.println("Su nombre es: "+request.getParameter("txtNombre") + "<br/>");
	
	String cedula = request.getParameter("txtCedula");
	String ecivil = request.getParameter("cmbECivil");
	String residencia = request.getParameter("rdResidencia");
	String foto = request.getParameter("fileFoto");
	String fecha = request.getParameter("fecha");
	String color = request.getParameter("color");
	String email = request.getParameter("email");
	String clave = request.getParameter("clave");
	
	%>
	<br/> Su número de cédula es:
	<%=cedula %>
	<br/> Su Estado civil es:
	<%=ecivil %>
	<br/> Su lugar de residencia es:
	<%=residencia %>
	<br/> El archivo seleccionado para foto del perfil es:
	<u><%=foto %></u>
	<br/> Su año y mes de nacimiento son:
	<strong><%=fecha %></strong>
	<br/> Su color favorito es:
	<font color="<%=color %>"><%=color %></font>
	<br/> Su correo electrónico es:
	<em><%=email %></em>
	</p>
</body>
</html>