<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*, java.util.*, java.text.*" %>
<%
    List<Compra> historial = (List<Compra>) session.getAttribute("historialCompras");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nexture</title>
    <link href= "css/Style.css" rel= "stylesheet" type= "text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>
    <main>
        <header>
            <h1>Nexture</h1>
            <h2 class="destacado">Moda casual de segunda</h2>
            <h4 id="favorito">Lo mejor para tí</h4>
            <figure><img src="images/Nexture_logo.png" width="150" height="120" alt="Logo Nexture" title = "Ropa de Segunda mano" ></figure>
        </header>
        
        <nav>
            <a href="index.jsp">Home</a>
            <a href="consulta.jsp">Ver Productos</a>
            <a href="categoría.jsp">Buscar Por Categoría</a>
        </nav>
        
        
        <div class="agrupar">
            <section> 
			    <h2>Historial de Compras</h2>
    
			    <% if (historial == null || historial.isEmpty()) { %>
			        <p>No has realizado ninguna compra aún.</p>
			    <% } else { %>
			        <% for (Compra compra : historial) { %>
			        <div style="margin-bottom: 20px;">
			            <table>
			                <tr class="compra-header">
			                    <th colspan="4">
			                        Compra realizada el: <%= sdf.format(compra.getFecha()) %> | 
			                        Estado: <%= compra.getEstado() %> | 
			                        Total: $<%= String.format("%.2f", compra.getTotal()) %>
			                    </th>
			                </tr>
			                <tr>
			                    <th>Producto</th>
			                    <th>Precio Unitario</th>
			                    <th>Cantidad</th>
			                    <th>Subtotal</th>
			                </tr>
			                <% for (ItemCarrito item : compra.getItems()) { %>
			                <tr>
			                    <td><%= item.getProducto().getNombre() %></td>
			                    <td>$<%= String.format("%.2f", item.getProducto().getPrecio()) %></td>
			                    <td><%= item.getCantidad() %></td>
			                    <td>$<%= String.format("%.2f", item.getProducto().getPrecio() * item.getCantidad()) %></td>
			                </tr>
			                <% } %>
			            </table>
			        </div>
			        <% } %>
			    <% } %>
			    
			    <br>
			    <a href="consulta.jsp">Volver a la tienda</a>
			</section>

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