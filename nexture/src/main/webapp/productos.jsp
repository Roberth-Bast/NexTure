<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Sesion Empleado</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
		<link href= "css/Style.css" rel= "stylesheet" type= "text/css">
	</head>
	<nav>
    	<a href="index.jsp">Home</a>
		<a href="consulta.jsp">Ver Productos</a>
		<a href="categoría.jsp">Buscar Por Categoría</a>
    </nav>
	<body>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
		<main>
			<header>
			
			</header>
				<div class="agrupar">
					<section>
						<!-- Formulario -->
						<form action="responseIngresarProducto.jsp" method="get">
							<div class="mb-3">
							  <label for="nombre" class="form-label">Nombre</label>
							  <input type="text" class="form-control" id="nombre" name="txtNombre">
							</div>	
							<%
								Categoria cat = new Categoria();
								out.print(cat.mostrarCategoria());	
							%>
							<label for="cantidad" class="form-label">Cantidad</label>
							<input type="number" class="form-control" id="cantidad" name="txtCantidad">
							<label for="precio" class="form-label">Precio</label>
							<input type="number" class="form-control" id="precio" name="txtPrecio">
							<label for="foto" class="form-label">Foto</label>
							<input type="text" class="form-control" id="foto" name="txtFoto">
							<button type="submit" class="btn btn-primary">Enviar</button>
							<button type="reset" class="btn btn-primary">Borrar</button>
						</form>
						<div>
						  	<%
						  		Product pro = new Product();
								out.print(pro.reporteProducto());
								
						  	%>
						</div>
						<button type="submit" class="btn btn-primary"><a href="menu.jsp"><img src= "icons/return.png" width="60" height="60" alt="imagen de volver" title = "return"></a></button>
					</section>
				</div>
		</main>
	</body>
</html>