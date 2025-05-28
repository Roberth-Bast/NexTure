<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import  = "com.productos.seguridad.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Cambio de clave</h3>
	<p>
	
	<%
	
	out.println("Su nombre es: "+request.getParameter("txtNombre") + "<br/>");
	String nombre = request.getParameter("txtNombre");
	String cedula = request.getParameter("txtCedula");
	String perfil = request.getParameter("cmbTPerfil");
	String ecivil = request.getParameter("cmbECivil");
	String email = request.getParameter("txtEmail");
	String clave = "653421" ;
	boolean active = true;
	int per = Integer.parseInt(perfil);
	int eciv = Integer.parseInt(ecivil);
	Usuario user = new Usuario(per, eciv, nombre, cedula, email, clave, active);
	user.ingresarCliente();
	
	%>
	<br/> Su número de cédula es:
	<%=cedula %>
	<br/> Su Estado civil es:
	<%=ecivil %>
	<br/> Su rol es:
	<%=perfil%>
	<br/> Su correo electrónico es:
	<em><%=email%></em>
	</p>
</body>
</html>