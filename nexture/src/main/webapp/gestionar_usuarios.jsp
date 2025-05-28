<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.productos.seguridad.Usuario" import ="java.util.*"%>
<%
 //Verificar si el usuario es administrador
/*	Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");
	if(usuarioSesion == null || usuarioSesion.getPerfil() != 1) {
    response.sendRedirect("login.jsp?mensaje=Acceso+denegado");
    return;
}
*/
    // Procesar acciones
    String accion = request.getParameter("accion");
    if(accion != null) {
        switch(accion) {
            case "cambiarEstado":
                int idUsuario = Integer.parseInt(request.getParameter("id"));
                boolean nuevoEstado = request.getParameter("estado").equals("activar");
                Usuario.cambiarEstadoUsuario(idUsuario, nuevoEstado);
                break;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href= "css/Style.css" rel= "stylesheet" type= "text/css">
<title>Administrador</title>
<style>
    .custom-table {
        border-collapse: separate;
        border-spacing: 0;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    
    .custom-table thead th {
        background-color: #3a7bd5;
        color: white;
        font-weight: 500;
        border: none;
        padding: 12px 15px;
    }
    
    .custom-table tbody tr {
        transition: all 0.3s ease;
    }
    
    .custom-table tbody tr:hover {
        background-color: #f8f9fa;
        transform: translateY(-2px);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    
    .custom-table tbody td {
        padding: 12px 15px;
        vertical-align: middle;
        border-top: 1px solid #e9ecef;
    }
    
    .btn-action {
        border-radius: 20px;
        padding: 6px 12px;
        font-size: 0.85rem;
        font-weight: 500;
        transition: all 0.2s;
        margin: 2px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    
    .btn-action:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
    }
    
    .btn-action i {
        margin-right: 5px;
    }
    
    .badge {
        padding: 6px 10px;
        font-weight: 500;
        font-size: 0.8rem;
        border-radius: 12px;
    }
    
    .card {
        border: none;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
    }
    
    .card-header {
        border-radius: 12px 12px 0 0 !important;
        background: linear-gradient(135deg, #3a7bd5 0%, #00d2ff 100%);
    }
</style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
        <div class="agrupar">
            <div class="container-fluid mt-4">
                <div class="card">
                    <div class="card-header text-white d-flex justify-content-between align-items-center">
                        <h1 class="h4 mb-0"><i class="fas fa-users-cog me-2"></i>Gestión de Usuarios</h1>
                        <a href="registrarUsuario.jsp" class="btn btn-light btn-sm btn-action">
                            <i class="fas fa-plus-circle"></i> Nuevo Usuario
                        </a>
                    </div>
                    
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table custom-table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Cédula</th>
                                        <th>Correo</th>
                                        <th>Perfil</th>
                                        <th>Estado</th>
                                        <th class="text-center">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        List<Usuario> usuarios = Usuario.obtenerTodosUsuarios();
                                        for(Usuario usuario : usuarios) {
                                    %>
                                    <tr>
                                        <td><%= usuario.getId() %></td>
                                        <td><strong><%= usuario.getNombre() %></strong></td>
                                        <td><%= usuario.getCedula() %></td>
                                        <td><%= usuario.getCorreo() %></td>
                                        <td>
                                            <span class="badge 
                                                <% switch(usuario.getPerfil()) {
                                                    case 1: out.print("bg-danger"); break;
                                                    case 2: out.print("bg-success"); break;
                                                    case 3: out.print("bg-warning text-dark"); break;
                                                    default: out.print("bg-secondary");
                                                } %>">
                                                <% 
                                                    switch(usuario.getPerfil()) {
                                                        case 1: out.print("Admin"); break;
                                                        case 2: out.print("Cliente"); break;
                                                        case 3: out.print("Empleado"); break;
                                                        default: out.print("Desconocido");
                                                    }
                                                %>
                                            </span>
                                        </td>
                                        <td>
                                            <span class="badge <%= usuario.isActive() ? "bg-success" : "bg-secondary" %>">
                                                <%= usuario.isActive() ? "Activo" : "Inactivo" %>
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <div class="d-flex justify-content-center">
                                                <% if(usuario.isActive()) { %>
                                                    <a href="gestionar_usuarios.jsp?accion=cambiarEstado&id=<%= usuario.getId() %>&estado=bloquear" 
                                                       class="btn btn-danger btn-action text-white" title="Bloquear">
                                                        <i class="fas fa-lock"></i> Bloquear
                                                    </a>
                                                <% } else { %>
                                                    <a href="gestionar_usuarios.jsp?accion=cambiarEstado&id=<%= usuario.getId() %>&estado=activar" 
                                                       class="btn btn-success btn-action text-white" title="Activar">
                                                        <i class="fas fa-unlock"></i> Activar
                                                    </a>
                                                <% } %>
                                                <a href="editar_usuario.jsp?id=<%= usuario.getId() %>" 
                                                   class="btn btn-primary btn-action text-white" title="Editar">
                                                    <i class="fas fa-edit"></i> Editar
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="mt-4 text-center">
                            <a href="registrarUsuario.jsp" class="btn btn-secondary btn-action">
                                <i class="fas fa-arrow-left me-2"></i> Volver al Menú
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>