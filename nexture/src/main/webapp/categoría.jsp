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
		<div class = "lgback" >
		<a href="http://localhost:8080/nexture/index.jsp"><img class="alinear-centro" src="images/Nexture_logo.png" width="200" height="200"></a>
		</div>
 			<h1 class="large-font">Welcome to NexTure </h1>
 			<h2  class="dest" class="romper-float">Next + Future + Couture </h2>
 			<h4 id="favorito" class="romper-float">The new way to buy and fill your wardrobe</h4>
 		</header>
		     <nav>
		       <a href="consulta.jsp">Ver Productos</a>
		       <a href="reporteCategoria.jsp">Buscar Por Categoria</a>
		       <a href="login.jsp">Login</a>
		     </nav>
		     <div class="agrupar">
		       <section>
		       	<form action="reporteCategoria.jsp" method="post">
		       		<h3>Reporte por Categoría</h3> 
			          <%
						Categoria cat = new Categoria();
			          	out.print(cat.mostrarCategoria());
			          %>
			          <input type="submit" name="btnEnviar" id="btnEnviar" value="enviar"/>
		 		</form>
		      </section>
		      <aside>
		        <a href="https://www.linkedin.com/in/jossue-bastidas-667128205?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BM%2FJvAsE7TlySbkJ55DgUIg%3D%3D">Ver más información sobre los desarrolladores   
				</a> <br/>
				<iframe src="https://www.google.com/maps/d/embed?mid=1r5aik6CGM2FLfkW0Sdw2o5UlMHQytnQ&ehbc=2E312F" width="160" height="120"> 
				</iframe>
		      </aside>
		   </div>
		  <footer>
 		<ul>
 			<li><a href="https://www.facebook.com/jossue.bast/">
 			<img src= "icons/facebook.png" width="60" height="60" alt="imagen de facebook" title = "facebook"></a></li>
 			<li><a href="https://www.instagram.com/jossue.bast/">
 			<img src= "icons/instagram.png" width="60" height="60" alt="imagen de Instagram" title="Instagram"></a></li>
 			<li><a href="https://www.tiktok.com/es/">
 			<img src= "icons/tik-tok.png" width="60" height="60" alt="imagen de TikTok" title="TikTok"></a></li>	
 		</ul>
	</footer> 	
		</main>

	</body>
</html>