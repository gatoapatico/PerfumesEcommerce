<%@ page import="Entity.Usuario" %>
<%@ page import="Controller.UsuarioController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UsuarioController cUsuario = new UsuarioController();
    Usuario usuario = cUsuario.obtenerUsuario(Integer.parseInt(request.getParameter("usuarioid")));
%>
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
                <div class="col-md-12 rounded p-3" style="background: rgba(255,255,255, 0.85);backdrop-filter: blur(5px)">
                    <h2 class="text-center mb-3">Modificando Registro</h2>
                    <form action="/BodegaJavaWeb/UsuarioController" method="POST" autocomplete="off">
                        <input hidden="hidden" type="text" name="action" value="editar-admin">
                        <div class="mb-3 row">
                            <label for="txtId" class="col-sm-2 col-form-label">ID</label>
                            <div class="col-sm-10">
                                <input type="text" name="id" readonly class="form-control-plaintext" id="txtId" value="<%=usuario.getId()%>">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="txtNames" class="col-sm-2 col-form-label">Nombre</label>
                            <div class="col-sm-10">
                                <input type="text" name="nombre" class="form-control" id="txtNames" value="<%=usuario.getNombre()%>">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="txtApellido" class="col-sm-2 col-form-label">Apellido</label>
                            <div class="col-sm-10">
                                <input type="text" name="apellido" class="form-control" id="txtApellido" value="<%=usuario.getApellido()%>">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="txtEmail" class="col-sm-2 col-form-label">Correo</label>
                            <div class="col-sm-10">
                                <input type="email" name="correo" required class="form-control" id="txtEmail" value="<%=usuario.getCorreo()%>">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="txtDocumento" class="col-sm-2 col-form-label">Documento</label>
                            <div class="col-sm-10">
                                <input type="text" name="documento" pattern="[0-9]{8}" class="form-control" id="txtDocumento" value="<%=(usuario.getDocumentoNumero() != null) ? usuario.getDocumentoNumero() : ""%>">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="txtTelefono" class="col-sm-2 col-form-label">Telefono</label>
                            <div class="col-sm-10">
                                <input type="text" name="telefono" pattern="[0-9]{3,}" class="form-control" id="txtTelefono" value="<%=(usuario.getTelefono() != null) ? usuario.getTelefono() : ""%>">
                            </div>
                        </div>
                        <div>
                            <input type="submit" class="btn btn-success mt-3" value="Actualizar">
                            <a class="btn btn-secondary ms-2 mt-3" href="/BodegaJavaWeb/admin/admin_usuarios.jsp">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
