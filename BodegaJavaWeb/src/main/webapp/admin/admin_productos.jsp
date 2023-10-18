<%@ page import="Controller.ProductoController" %>
<%@ page import="Entity.Producto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ProductoController cProducto = new ProductoController();
    List<Producto> productos = cProducto.obtenerProductos();
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
                    <h2 class="text-center">Tabla de Productos</h2>
                    <div class="pb-3">
                        <a href="/BodegaJavaWeb/admin/admin_productos_agregar.jsp" class="btn btn-primary">Agregar nuevo producto</a>
                    </div>

                    <table class="table container-fluid mt-2 table-striped">
                        <thead class="table-warning">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Categoria</th>
                                <th scope="col">Imagen</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Proveedor</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Stock</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Producto producto : productos) { %>
                                <tr>
                                    <td><%=producto.getId()%></td>
                                    <td><%=producto.getNombre()%></td>
                                    <td><%=producto.getCategoria()%></td>
                                    <td>
                                        <img width="50" src="/BodegaJavaWeb/assets/img/productos/<%=producto.getImagen()%>" alt="<%=producto.getDescripcion()%>">
                                    </td>
                                    <td><%=producto.getDescripcion()%></td>
                                    <td><%=producto.getProveedor()%></td>
                                    <td>S/ <%=String.format("%.2f", producto.getPrecio())%></td>
                                    <td><%=producto.getStock()%></td>
                                    <td>
                                        <a href="/BodegaJavaWeb/admin/admin_productos_editar.jsp?productoid=<%=producto.getId()%>" class="btn btn-success mb-1" style="margin-top: -3px; margin-bottom: -3px">Editar</a>
                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop<%=producto.getId()%>">
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
        <% for(Producto producto : productos) { %>
            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop<%=producto.getId()%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Advertencia!</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ¿Seguro que deseas eliminar el producto <%=producto.getNombre()%>? Los datos eliminados no podrán recuperarse.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <a href="/BodegaJavaWeb/ProductoController?action=delete&productoid=<%=producto.getId()%>&imagenruta=<%=producto.getImagen()%>" type="button" class="btn btn-danger">Eliminar producto</a>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
