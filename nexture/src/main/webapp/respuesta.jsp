<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nuevo Cliente</title>
<link href= "css/Style.css" rel="stylesheet" type= "text/css">
</head>
<body>
	<div class="agrupar">
 		<section>
	<h3>Datos del Nuevo Cliente</h3>
	<p>
	<%
	
	out.println("Su nombre es: "+request.getParameter("txtNombre") + "<br/>");
	String nombre = request.getParameter("txtNombre");
	String cedula = request.getParameter("txtCedula");
	String ecivil = request.getParameter("cmbECivil");
	String residencia = request.getParameter("rdResidencia");
	String foto = request.getParameter("fileFoto");
	String fecha = request.getParameter("fecha");
	String color = request.getParameter("color");
	String email = request.getParameter("txtEmail");
	String clave = request.getParameter("clave");
	boolean active = true;
	int eciv = Integer.parseInt(ecivil);
	Usuario user = new Usuario(2, eciv, nombre, cedula, email, clave, active);
	user.ingresarCliente();
	
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
	</section>
	</div>
</body>
</html>