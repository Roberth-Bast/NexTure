<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Usuario user = new Usuario();
		
		String nombre = request.getParameter("txtNombre");
		String cedula = request.getParameter("txtCedula");
		String estado = request.getParameter("cmbEstado");
		String correo = request.getParameter("txtCorreo");
		String clave = request.getParameter("txtClave");
		
		user.setNombre(nombre);
		user.setCedula(cedula);
		user.setEstadoCivil(Integer.parseInt(estado));
		user.setCorreo(correo);
		user.setClave(clave);
		
		String message = user.ingresarCliente();
		
	 %>
</body>
</html>