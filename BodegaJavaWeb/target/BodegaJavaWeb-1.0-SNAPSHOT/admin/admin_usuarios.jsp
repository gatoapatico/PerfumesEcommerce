<%@ page import="Controller.UsuarioController" %>
<%@ page import="Entity.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UsuarioController cUsuario = new UsuarioController();
    List<Usuario> usuarios = cUsuario.obtenerUsuarios();
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
                    <h2 class="text-center">Tabla de Usuarios</h2>
                    <div class="pb-3">
                        <a href="/BodegaJavaWeb/admin/admin_usuarios_agregar.jsp" class="btn btn-primary">Agregar nuevo usuario</a>
                    </div>

                    <table class="table container-fluid mt-2 table-striped">
                        <thead class="table-warning">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Documento</th>
                                <th scope="col">Teléfono</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Usuario usuario : usuarios) { %>
                                <tr>
                                    <td><%=usuario.getId()%></td>
                                    <td><%=usuario.getUsuarioTipo()%></td>
                                    <td><%=usuario.getNombre()%></td>
                                    <td><%=usuario.getApellido()%></td>
                                    <td><%=usuario.getCorreo()%></td>
                                    <td><%=(usuario.getDocumentoNumero() != null) ? usuario.getDocumentoNumero() : ""%></td>
                                    <td><%=(usuario.getTelefono() != null) ? usuario.getTelefono() : ""%></td>
                                    <td>
                                        <a href="/BodegaJavaWeb/admin/admin_usuarios_editar.jsp?usuarioid=<%=usuario.getId()%>" class="btn btn-success" style="margin-top: -3px; margin-bottom: -3px">Editar</a>
                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop<%=usuario.getId()%>">
                                            Eliminar
                                        </button>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <% for(Usuario usuario : usuarios) { %>
            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop<%=usuario.getId()%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Advertencia!</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ¿Seguro que deseas eliminar el usuario <%=usuario.getCorreo()%> ? Los datos eliminados no podrán recuperarse.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <a href="/BodegaJavaWeb/UsuarioController?action=delete&usuarioid=<%=usuario.getId()%>" type="button" class="btn btn-danger">Eliminar usuario</a>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
