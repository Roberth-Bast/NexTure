<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmacion</title>
</head>
<body>
		<%				
			String nombre = request.getParameter("txtNombre");
            String categoria = request.getParameter("cmbCategoria");
           	int id_categoria = Integer.parseInt(categoria);
            int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
            float precio = Float.parseFloat(request.getParameter("txtPrecio"));
            String foto = request.getParameter("foto");
            Product pr = new Product ();
            pr.setNombre(nombre);
            pr.setId_cat(id_categoria);
            pr.setCantidad(cantidad);
			pr.setPrecio(precio);
			out.println(pr.agregarProducto());		
		%>
</body>
</html>