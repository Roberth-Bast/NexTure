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
		       <h1>E-commerce</h1>
		       <h2 class="destacado">Moda casual sostenible</h2>
		       <h4 id="favorito">Consumir la moda de manera consciente e intencionada</h4>
              
		     </header>
		     <nav>
		       <a href="consulta.jsp">Ver Productos</a>
		       <a href="categorÌa.jsp">Buscar Por Categoria</a>
		       <a href="login.jsp">Login</a>
		     </nav>
		     <div class="agrupar">
		       <section> 
		       <article>
		       		<h3>Ingresar al sistema</h3>
			<form action="validarLogin.jsp" method="post">
        		<table border="1">
            		<tr>
                		<td>Correo electrÛnico</td>
                		<td><input type="text" name = "usuario" required /></td>
            		</tr>
            		<tr>
                		<td>Clave</td>
                		<td><input type="password" id="clave"  name="clave" required/></td>
            		</tr>
            		<tr>
                		<td colspan="2">*campo obligatorio</td> <!-- Para colapsar dos columnas-->
            		</tr>
            		<tr> <td><input type="submit" name="btnEnviar" id="btnEnviar" value="Enviar"/></td>
            	<td><input type="reset" name="btnDelete" id="btnDelete" value="Borrar"/></td></tr>
        		</table>
    		</form>
		        	<a href="registro.jsp">Registrarse</a>
		       </article>
               
		      </section>
		      <aside>
		        <a href="https://www.linkedin.com/in/jossue-bastidas-667128205?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BM%2FJvAsE7TlySbkJ55DgUIg%3D%3D">Ver m√°s informaci√≥n sobre los desarrolladores   
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