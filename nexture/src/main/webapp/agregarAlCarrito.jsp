<%@ page import="com.productos.negocio.*, java.util.*" %>
<%
    // Obtener parámetros del formulario
    int idProducto = Integer.parseInt(request.getParameter("id"));
    String nombreProducto = request.getParameter("nombre");
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    Product producto = new Product().obtenerProducto(idProducto);
    
    // Validaciones
    if (producto == null) {
        response.sendRedirect("error.jsp?mensaje=El producto no existe");
        return;
    }
    
    if (cantidad > producto.getCantidad()) {
        response.sendRedirect("error.jsp?mensaje=No hay suficiente stock");
        return;
    }
    
    // Manejo del carrito
    Carrito carrito = (Carrito) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new Carrito();
        session.setAttribute("carrito", carrito);
    }
    carrito.agregarItem(producto, cantidad);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Producto Agregado - Nexture</title>
    <link href="css/Style.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <main>
        <header class="text-center mb-4">
            <img src="images/Nexture_logo.png" class="img-fluid" width="250" alt="Logo Nexture">
            <h1 class="mt-3">Nexture</h1>
            <h2 class="text-muted">Moda casual de segunda</h2>
            <h4 class="text-primary">Lo mejor para ti</h4>
        </header>
        
        <nav class="nav justify-content-center bg-light py-3 mb-4">
            <a class="nav-link" href="index.jsp">Home</a>
            <a class="nav-link" href="consulta.jsp">Ver Productos</a>
            <a class="nav-link" href="categoría.jsp">Buscar Por Categoría</a>
        </nav>
        
        <div class="agrupar">
            <section> 
                <div class="container mt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-8 col-lg-6">
                            <div class="card border-success shadow-sm">
                                <div class="card-header bg-success text-white">
                                    <h2 class="h4 mb-0"><i class="bi bi-check-circle"></i> ¡Producto agregado!</h2>
                                </div>
                                
                                <div class="card-body text-center py-4">
                                    <div class="mb-4">
                                        <i class="bi bi-cart-check-fill text-success" style="font-size: 3rem;"></i>
                                    </div>
                                    <h3 class="h5 mb-3">¡Agregado correctamente!</h3>
                                    <p class="lead">Has agregado <span class="fw-bold"><%= cantidad %></span> unidad(es) de <span class="fw-bold">"<%= nombreProducto %>"</span> a tu carrito.</p>
                                    
                                    <div class="d-grid gap-2 d-md-flex justify-content-md-center mt-4">
                                        <a href="mostrarProductos.jsp" class="btn btn-outline-primary me-md-2">
                                            <i class="bi bi-arrow-left"></i> Seguir comprando
                                        </a>
                                        <a href="carrito.jsp" class="btn btn-success">
                                            <i class="bi bi-cart"></i> Ver carrito
                                        </a>
                                    </div>
                                </div>
                                
                                <div class="card-footer bg-transparent text-center py-3">
                                    <small class="text-muted">¿Necesitas ayuda? <a href="#" class="text-decoration-none">Contáctanos</a></small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <aside class="text-center mt-5">
                <div class="mb-4">
                    <a href="https://www.linkedin.com/in/jossue-bastidas-667128205?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BM%2FJvAsE7TlySbkJ55DgUIg%3D%3D" 
                       class="btn btn-outline-secondary btn-sm">
                        <i class="bi bi-person-lines-fill"></i> Desarrolladores
                    </a>
                </div>
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.google.com/maps/d/embed?mid=1r5aik6CGM2FLfkW0Sdw2o5UlMHQytnQ&ehbc=2E312F" 
                            class="rounded shadow-sm" 
                            allowfullscreen></iframe>
                </div>
            </aside>
        </div>
        
        <footer class="mt-5 py-4 bg-light">
            <div class="container">
                <div class="d-flex justify-content-center gap-4">
                    <a href="https://www.facebook.com/jossue.bast/" class="text-decoration-none">
                        <i class="bi bi-facebook fs-3 text-primary"></i>
                    </a>
                    <a href="https://www.instagram.com/jossue.bast/" class="text-decoration-none">
                        <i class="bi bi-instagram fs-3 text-danger"></i>
                    </a>
                    <a href="https://www.tiktok.com/es/" class="text-decoration-none">
                        <i class="bi bi-tiktok fs-3"></i>
                    </a>
                </div>
            </div>
        </footer>
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>