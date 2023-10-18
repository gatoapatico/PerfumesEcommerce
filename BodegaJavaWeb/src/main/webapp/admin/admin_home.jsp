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
            <br>
            <br>
            <h2 class="text-light text-center">¿Qué desea hacer?</h2>
            <br>
            <div class="row justify-content-center text-center align-items-center g-2">
                <div class="col p-3 text-bg-dark" style="border-top-left-radius: 1rem; border-bottom-left-radius: 1rem;">
                    <h5>Administrar Usuarios</h5>
                    <hr>
                    <small class="text-justify">Gestiona de manera efectiva los datos de tus clientes y administradores en la bodega MARISOL</small>
                    <br>
                    <a href="/BodegaJavaWeb/admin/admin_usuarios.jsp" class="btn btn-primary mt-3">Revisar Tabla de Usuarios</a> <br>
                    <a href="/BodegaJavaWeb/admin/admin_usuarios_agregar.jsp" class="btn btn-success m-3">Agregar nuevo usuario</a>
                </div>
                <div class="col p-3 text-light" style="background: #614BC3">
                    <h5>Administrar Productos</h5>
                    <hr>
                    <small class="text-justify">Verifica el inventario de tus productos y agrega nuevos al catálogo de la bodega MARISOL</small>
                    <br>
                    <a href="/BodegaJavaWeb/admin/admin_productos.jsp" class="btn btn-primary mt-3">Revisar Tabla de Productos</a> <br>
                    <a href="/BodegaJavaWeb/admin/admin_productos_agregar.jsp" class="btn btn-success m-3">Agregar nuevo Producto</a>
                </div>
                <div class="col text-bg-danger p-3" style="border-top-right-radius: 1rem; border-bottom-right-radius: 1rem;">
                    <h5>Administrar Pedidos</h5>
                    <hr>
                    <small class="text-justify">Confirma el estado de un pedido y permítele a tus clientes hacer seguimiento de sus compras</small>
                    <br>
                    <a href="/BodegaJavaWeb/admin/admin_pedidos.jsp" class="btn btn-primary" style="margin-top: 2.70rem; margin-bottom: 2.70rem">Revisar Tabla de Pedidos</a>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>

    </body>
</html>
