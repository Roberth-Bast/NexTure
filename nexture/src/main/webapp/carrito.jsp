<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*, java.util.*, java.text.NumberFormat" %>
<%
    Carrito carrito = (Carrito) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new Carrito();
        session.setAttribute("carrito", carrito);
    }

    String action = request.getParameter("action");
    if (action != null) {
        int idProducto = Integer.parseInt(request.getParameter("id"));
        Product product = new Product().obtenerProducto(idProducto);

        switch (action) {
            case "add":
                int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                carrito.agregarItem(product, cantidad);
                break;
            case "remove":
                carrito.eliminarItem(idProducto);
                break;
            case "update":
                int nuevaCantidad = Integer.parseInt(request.getParameter("cantidad"));
                carrito.actualizarCantidad(idProducto, nuevaCantidad);
                break;
        }
    }

    NumberFormat formatoMoneda = NumberFormat.getCurrencyInstance();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Nexture</title>
    <link rel="stylesheet" href="css/Style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Poppins', sans-serif;
    }

    .custom-cart-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 0.95rem;
    }

    .custom-cart-table thead {
        background-color: #f8f9fa;
    }

    .custom-cart-table th, .custom-cart-table td {
        padding: 12px 16px;
        border-bottom: 1px solid #ddd;
    }

    .custom-cart-table th {
        text-align: left;
        font-weight: 600;
        color: #333;
    }

    .custom-cart-table td {
        color: #555;
    }

    .custom-cart-table tr:last-child td {
        border-bottom: none;
    }

    .custom-cart-table .text-end {
        text-align: right;
    }

    .custom-cart-table .text-center {
        text-align: center;
    }

    .custom-cart-table .table-active {
        background-color: #e9ecef;
        font-weight: bold;
    }
</style>
    
</head>
<body>
<main class="container py-4">

    <header class="text-center mb-4">
        <h1>Nexture</h1>
        <h2 class="destacado">Moda casual de segunda</h2>
        <figure>
            <img src="images/Nexture_logo.png" width="250" height="220" 
                 alt="Logo de Nexture - Ropa de segunda mano" 
                 title="Nexture - Moda sustentable">
        </figure>
    </header>

    <nav class="nav justify-content-center mb-4">
        <a class="nav-link" href="index.jsp">Home</a>
        <a class="nav-link" href="consulta.jsp">Ver Productos</a>
        <a class="nav-link" href="categoría.jsp">Buscar Por Categoría</a>
    </nav>

    <section>
        <h2 class="mb-4">Tu Carrito de Compras</h2>

        <% if (carrito.getItems().isEmpty()) { %>
            <div class="card text-center py-5">
                <div class="card-body">
                    <i class="bi bi-cart-x text-muted" style="font-size: 3rem;"></i>
                    <h3 class="h4 mt-3">Tu carrito está vacío</h3>
                    <p class="text-muted">Agrega productos para comenzar tu compra</p>
                    <a href="mostrarProductos.jsp" class="btn btn-primary mt-3">
                        <i class="bi bi-bag"></i> Ver Productos
                    </a>
                </div>
            </div>
        <% } else { %>
            <div class="card shadow">
                <div class="card-header bg-light">
                    <h3 class="h5 mb-0">Mi Carrito</h3>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="custom-cart-table">
                            <thead class="table-light">
                                <tr>
                                    <th>Producto</th>
                                    <th class="text-end">Precio Unitario</th>
                                    <th class="text-center">Cantidad</th>
                                    <th class="text-end">Subtotal</th>
                                    <th class="text-center">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (ItemCarrito item : carrito.getItems()) {
                                    Product producto = item.getProducto();
                                    double subtotal = producto.getPrecio() * item.getCantidad();
                                %>
                                <tr>
                                    <td><%= producto.getNombre() %></td>
                                    <td class="text-end"><%= formatoMoneda.format(producto.getPrecio()) %></td>
                                    <td class="text-center">
                                        <form method="post" action="carrito.jsp" class="d-flex justify-content-center gap-2">
                                            <input type="hidden" name="action" value="update">
                                            <input type="hidden" name="id" value="<%= producto.getId() %>">
                                            <input type="number" name="cantidad" value="<%= item.getCantidad() %>"
                                                   min="1" max="<%= producto.getCantidad() %>"
                                                   class="form-control form-control-sm text-center" style="width: 70px;">
                                            <button type="submit" class="btn btn-sm btn-outline-primary">
                                                <i class="bi bi-arrow-clockwise"></i>
                                            </button>
                                        </form>
                                    </td>
                                    <td class="text-end"><%= formatoMoneda.format(subtotal) %></td>
                                    <td class="text-center">
                                        <a href="carrito.jsp?action=remove&id=<%= producto.getId() %>"
                                           class="btn btn-sm btn-outline-danger">
                                            <i class="bi bi-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                                <% } %>
                                <tr class="table-active">
                                    <td colspan="3" class="text-end"><strong>Total a Pagar</strong></td>
                                    <td class="text-end"><strong><%= formatoMoneda.format(carrito.getTotal()) %></strong></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="d-flex justify-content-between mt-4">
                        <a href="mostrarProductos.jsp" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left"></i> Seguir Comprando
                        </a>
                        <a href="checkout.jsp" class="btn btn-success">
                            <i class="bi bi-credit-card"></i> Proceder al Pago
                        </a>
                    </div>
                </div>
            </div>
        <% } %>
    </section>

</main>
</body>
</html>
