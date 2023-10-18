<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Administrador</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <style>
            body {
                background-image: url('https://cloudappi-web.s3.eu-west-1.amazonaws.com/wp-content/uploads/2022/02/02090502/imagenes-blog.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <%@include file="admin_header.jsp" %>
        <div class="container">
            <br>
            <div class="row">
                <h3 class="text-light mb-4">Agregar nuevo usuario</h3>
                <div class="col-md-4 me-4">
                    <div class="row rounded bg-light" style="box-shadow: -10px 10px 10px rgba(255,255,255,0.5)">
                        <form class="p-4" action="/BodegaJavaWeb/UsuarioController" method="POST" autocomplete="off">
                            <input hidden="hidden" type="text" name="action" value="register-admin">
                            <div class="infoUser" style="display: grid; grid-template-columns: 50% 50%;">
                                <div class="mb-3 me-2">
                                    <label for="txtNombre" class="form-label">Nombre</label>
                                    <input type="text" name="nombre" required class="form-control border-secondary-subtle" id="txtNombre">
                                </div>
                                <div class="mb-3 ms-2">
                                    <label for="txtApellido" class="form-label">Apellido</label>
                                    <input type="text" name="apellido" required class="form-control border-secondary-subtle" id="txtApellido">
                                </div>
                                <div class="mb-3 me-2">
                                    <label for="txtDocumento" class="form-label">Documento</label>
                                    <input type="text" name="documento" pattern="[0-9]{8}" required class="form-control border-secondary-subtle" id="txtDocumento">
                                </div>
                                <div class="mb-3 ms-2">
                                    <label for="txtTelefono" class="form-label">Teléfono</label>
                                    <input type="text" name="telefono" required class="form-control border-secondary-subtle" id="txtTelefono">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="usuario-tipo" class="form-label">Tipo de Usuario:</label>
                                <select class="form-select" aria-label="Default select example" name="usuario-tipo" id="usuario-tipo">
                                    <option value="ADMINISTRADOR">ADMINISTRADOR</option>
                                    <option value="CLIENTE">CLIENTE</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="txtEmail" class="form-label">Correo:</label>
                                <input type="email" name="correo" required class="form-control border-secondary-subtle" id="txtEmail">
                            </div>
                            <div class="mb-3">
                                <label for="txtPassword" class="form-label">Contraseña:</label>
                                <input type="password" name="password" required class="form-control border-secondary-subtle" id="txtPassword">
                            </div>
                            <button type="submit" class="btn btn-primary mt-1">Guardar</button>
                            <a href="/BodegaJavaWeb/admin/admin_usuarios.jsp" class="btn btn-secondary mt-1">Cancelar</a>
                            <% if(request.getParameter("invalid") != null) { %>
                                <div style="color: white; background-color:red; border-radius:10px; margin:10px; text-align:center">El correo ingresado ya está Registrado!</div>
                            <% } %>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
