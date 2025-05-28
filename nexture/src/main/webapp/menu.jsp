<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" session="true" import= "com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<lang = esp>
<title>NexTure</title>
<link href= "css/Style.css" rel= "stylesheet" type= "text/css">
</head>
<body>
	<main>
		<%
		String usuario;
		HttpSession sesion = request.getSession();
		if (sesion.getAttribute("usuario") == null) //Se verifica si existe la variable
		{
		%>
		<nav>
			<jsp:forward page="login.jsp">
		 	<jsp:param name="error" value="Debe registrarse en el sistema."/>
		 	</jsp:forward>
		 	<%
			 	}
			 	else
			 	{
			 	usuario=(String)sesion.getAttribute("usuario"); //Se devuelve los valores de atributos
			 	int perfil=(Integer)sesion.getAttribute("perfil");
		 	%>
		 	<%
				Pagina pag=new Pagina();
				String menu=pag.mostrarMenu(perfil);
				out.print(menu);
			%>
			<%}%>
		</nav>
		<div class = "agrupar">>
			<section>
				<h1>Sitio Privado de Productos</h1>
				<h4>Bienvenido
					<%
					usuario=(String)sesion.getAttribute("usuario"); //Se devuelve los valores de atributos
					out.println(usuario);
					%>
					<br>
					<a href= "cambiarClave.jsp">Cambiar Clave</a>
				</h4>
			</section>
		</div>

	</main>
</body>
</html>