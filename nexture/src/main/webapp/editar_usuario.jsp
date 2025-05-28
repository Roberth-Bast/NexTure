<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.productos.seguridad.*" import ="java.util.*"%>
<% 
    // Obtener usuario a editar
    int idUsuario = Integer.parseInt(request.getParameter("id"));
    Usuario usuarioEditar = null;
    List<Usuario> usuarios = Usuario.obtenerTodosUsuarios();
    
    for(Usuario u : usuarios) {
        if(u.getId() == idUsuario) {
            usuarioEditar = u;
            break;
        }
    }
    
    if(usuarioEditar == null) {
        response.sendRedirect("usuarios.jsp?mensaje=Usuario+no+encontrado");
        return;
    }
    
    // Procesar actualización
    if(request.getParameter("actualizar") != null) {
        usuarioEditar.setNombre(request.getParameter("nombre"));
        usuarioEditar.setCedula(request.getParameter("cedula"));
        usuarioEditar.setCorreo(request.getParameter("correo"));
        usuarioEditar.setPerfil(Integer.parseInt(request.getParameter("perfil")));
        usuarioEditar.setEstadoCivil(Integer.parseInt(request.getParameter("estadoCivil")));
        
        if(Usuario.actualizarUsuario(usuarioEditar)) {
            response.sendRedirect("gestionar_usuarios.jsp?mensaje=Usuario+actualizado");
            return;
        } else {
            out.print("<div class='alert alert-danger'>Error al actualizar usuario</div>");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
<link href="css/admin-styles.css" rel="stylesheet">
<title>Editar Usuario - Nexture</title>
</head>
<body class="admin-page">
    <main class="admin-container">
        <header class="admin-header">
            <div class="logo-container">
                <a href="index.jsp"><img src="images/Nexture_logo.png" alt="Nexture Logo" class="logo"></a>
            </div>
            <h1 class="brand-title">Nexture</h1>
            <h2 class="brand-subtitle">Moda casual de segunda</h2>
        </header>
        
        <nav class="admin-nav">
            <a href="index.jsp" class="nav-link"><i class="bi bi-house-door"></i> Home</a>
            <a href="consulta.jsp" class="nav-link"><i class="bi bi-search"></i> Ver Productos</a>
            <a href="categoría.jsp" class="nav-link"><i class="bi bi-tags"></i> Buscar Por Categoría</a>
        </nav>
        
        <div class="admin-content">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6">
                        <div class="edit-user-card">
                            <div class="card-header">
                                <h1><i class="bi bi-person-gear"></i> Editar Usuario</h1>
                            </div>
                            
                            <div class="card-body">
                                <form method="post" class="user-edit-form">
                                    <input type="hidden" name="actualizar" value="true">
                                    
                                    <div class="form-group">
                                        <label for="nombre" class="form-label">Nombre:</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" 
                                               value="<%= usuarioEditar.getNombre() %>" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="cedula" class="form-label">Cédula:</label>
                                        <input type="text" class="form-control" id="cedula" name="cedula" 
                                               value="<%= usuarioEditar.getCedula() %>" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="correo" class="form-label">Correo:</label>
                                        <input type="email" class="form-control" id="correo" name="correo" 
                                               value="<%= usuarioEditar.getCorreo() %>" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="perfil" class="form-label">Perfil:</label>
                                        <select class="form-select" id="perfil" name="perfil">
                                            <option value="1" <%= usuarioEditar.getPerfil() == 1 ? "selected" : "" %>>Administrador</option>
                                            <option value="2" <%= usuarioEditar.getPerfil() == 2 ? "selected" : "" %>>Cliente</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="estadoCivil" class="form-label">Estado Civil:</label>
                                        <select class="form-select" id="estadoCivil" name="estadoCivil" required>
                                            <option value="1" <%= usuarioEditar.getEstadoCivil() == 1 ? "selected" : "" %>>Soltero/a</option>
                                            <option value="2" <%= usuarioEditar.getEstadoCivil() == 2 ? "selected" : "" %>>Casado/a</option>
                                            <option value="3" <%= usuarioEditar.getEstadoCivil() == 3 ? "selected" : "" %>>Divorciado/a</option>
                                            <option value="4" <%= usuarioEditar.getEstadoCivil() == 4 ? "selected" : "" %>>Viudo/a</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-actions">
                                        <button type="submit" class="btn btn-save">
                                            <i class="bi bi-save"></i> Guardar Cambios
                                        </button>
                                        <a href="gestionar_usuarios.jsp" class="btn btn-cancel">
                                            <i class="bi bi-x-circle"></i> Cancelar
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>