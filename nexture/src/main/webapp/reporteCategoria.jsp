<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" import = "com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>NEXTURE</title>
		<link href="css/Style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<main>
		     <header>
		       <h1>Nexture</h1>
		       <h2 class="destacado">Moda casual sostenible</h2>
		       <h4 id="favorito">Consumir la moda de manera consciente e intencionada</h4>
		     </header>
		     <nav>
		       <a href="consulta.jsp">Ver Productos</a>
		       <a href="categoría.jsp">Buscar Por Categoria</a>
		       <a href="login.jsp">Login</a>
		     </nav>
		     <div class="agrupar">
		       <section>
		       		<form action="reporteCategoria.jsp" method="post">
		       		<h3>Reporte por Categoría</h3> 
						<%
							Product pr = new Product();
				          	int cat = Integer.parseInt(request.getParameter("cmbCategoria"));
				          	String tabla = pr.buscarProductoCategoria(cat);
				          	out.print(tabla);
						%>
			          <input type="submit" name="btnEnviar" id="btnEnviar" value="enviar"/>
		 		</form>
		 
		      </section>
		      <aside>
		        <a href="https://www.linkedin.com/in/jossue-bastidas-667128205?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BM%2FJvAsE7TlySbkJ55DgUIg%3D%3D">Ver mÃ¡s informaciÃ³n sobre los desarrolladores   
				</a> <br/>
				<iframe src="https://www.google.com/maps/d/embed?mid=1r5aik6CGM2FLfkW0Sdw2o5UlMHQytnQ&ehbc=2E312F" width="160" height="120"> 
				</iframe>
		      </aside>
		   </div>
		   <footer>
		      <ul>
		         <li>Facebook</li>
		         <li>Instagram</li>
		         <li>Tiktok</li>
		     </ul>
		   </footer>
		</main>

	</body>
</html>