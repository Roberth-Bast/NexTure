<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.productos.negocio.*"%>
<%
String mensaje = "";
    Product pr = new Product();

    String idStr = request.getParameter("id");
    if (idStr == null) {
        response.sendRedirect("productos.jsp");
        return;
    }
    int idProducto = Integer.parseInt(idStr);

    // Variables para formulario
    String nombre = "";
    int idCat = 0;
    int cantidad = 0;
    double precio = 0.0;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            nombre = request.getParameter("txtNombre");
            idCat = Integer.parseInt(request.getParameter("cmbCategoria"));
            cantidad = Integer.parseInt(request.getParameter("cantidad"));
            precio = Double.parseDouble(request.getParameter("precio"));

            mensaje = pr.actualizarProducto(idProducto, nombre, idCat, cantidad, precio);

            if (!mensaje.startsWith("❌")) {
                mensaje = "✔ Se ha actualizado el producto.";
            }

        } catch (Exception e) {
            mensaje = "❌ El producto: " + e.getMessage() + "No se puede actualizar.";
        }
    }

    if (!"POST".equalsIgnoreCase(request.getMethod()) || mensaje.startsWith("❌")) {
        Object[] datos = pr.obtenerProductoCompletoPorId(idProducto);
        if (datos != null) {
            nombre = (String) datos[0];
            idCat = (Integer) datos[1];
            cantidad = (Integer) datos[2];
            precio = (Double) datos[3];
        } else {
            response.sendRedirect("productos.jsp");
            return;
        }
    }
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Actualizar</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
<link href= "css/Style.css" rel= "stylesheet" type= "text/css">
</head>
<body>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
	<main>
		<div class="card-body">
			<% if (!mensaje.isEmpty()) { %>
		<div class="alert <%= mensaje.startsWith("❌") ? "alert-danger" : "alert-success" %>">
			<strong><%= mensaje %></strong>
		</div>
		<% } %>
		<div class = "agrupar">
			<section>
				<form action="actualizar.jsp?id=<%= idProducto %>" method="post">
				<div class="mb-3">
	  				<label for="formGroupExampleInput" class="form-label">Nombre</label>
	  				<input type="text" class="form-control" id="nombre" name="txtNombre" placeholder="Nombre del producto">
				</div>
				<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label">Categoría</label>
				<%
					Categoria cat = new Categoria();
					out.print(cat.mostrarCategoria());	
				%>
				<div class="mb-3">
				  <label for="formGroupExampleInput2" class="form-label">Cantidad</label>
				  <input type="number" class="form-control" id="cantidad" name="cantidad" placeholder="">
				</div>
				<div class="mb-3">
				  <label for="formGroupExampleInput2" class="form-label">Precio</label>
				  <input type="number" class="form-control" id="precio" name = "precio" placeholder="$">
				</div>
				<button type="submit" class="btn btn-primary">Confirmar</button>
		        <button type="button" class="btn btn-outline-secondary" onclick="window.location='productos.jsp'">
					<i class="bi bi-x-circle"></i> Cancelar
				</button>
				</form>
			</section>
		</div>
	</main>
</body>
</html>