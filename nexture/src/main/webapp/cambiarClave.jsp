<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NexTure</title>
<link href= "css/Style.css" rel= "stylesheet" type= "text/css">
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
 				<a class= "active" href="consulta.jsp" >Gestion de Usuario</a>
 				<a class= "active" href="categoría.jsp">Bitácora</a>
 				<a class= "active" href="login.jsp">CerrarSesión</a>
 			</nav>
 		<div class="agrupar">
 			<section>
 				<h3>Cambio de Clave</h3>
				<form action="responseClave.jsp" method="post">
        	<table border="1">
            	<tr> 
	                <td>
	                	Clave anterior</td>
	                <td>
	                    <input type="password" id = "txtClaveAnterior" name="txtClaveAnterior" maxlength="50" required/>*
	                </td> 
            	</tr>  
            	<tr> 
	                <td>Clave Nueva</td>
	                <td>
	                    <input type="password" id = "txtClaveNueva" name="txtClaveNueva" maxlength="50" required/>*
	                </td> 
            	</tr>
            	<tr> 
	                <td>Repetir Clave</td>
	                <td>
	                    <input type="password" id = "txtRepClaveNueva" name="txtRepClaveNueva" maxlength="50" required/>*
	                </td> 
            	</tr>
            <tr> <td><input type="submit" name="btnEnviar" id="btnEnviar" value="Enviar"/></td>
            <td><input type="reset" name="btnDelete" id="btnDelete" value="Borrar"/></td></tr>
        </table>
    </form>
 			</section>
 			<aside>
 				<a href="https://www.linkedin.com/in/jossue-bastidas-667128205?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BM%2FJvAsE7TlySbkJ55DgUIg%3D%3D"
 				>Ver más información sobre los desarrolladores</a>
 				<iframe class="mapa" src="https://www.google.com/maps/d/embed?mid=1r5aik6CGM2FLfkW0Sdw2o5UlMHQytnQ&ehbc=2E312F" width="210" height="230" ></iframe>
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