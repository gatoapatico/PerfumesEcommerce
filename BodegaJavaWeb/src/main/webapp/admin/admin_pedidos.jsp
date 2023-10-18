<%@ page import="Controller.PedidoController" %>
<%@ page import="Entity.Pedido" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PedidoController cPedidos = new PedidoController();
    List<Pedido> pedidos = cPedidos.obtenerPedidosAll();
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
                    <h2 class="text-center">Tabla de Pedidos</h2>

                    <table class="table container-fluid mt-2 table-striped">
                        <thead class="table-warning">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Hora</th>
                                <th scope="col">Codigo</th>
                                <th scope="col">Pago Total</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Pedido pedido : pedidos) { %>
                                <tr>
                                    <td><%=pedido.getId()%></td>
                                    <td><%=pedido.getFecha().split(" ")[0]%></td>
                                    <td><%=pedido.getFecha().split(" ")[1]%></td>
                                    <td><%=pedido.getCodigoUnico()%></td>
                                    <td>S/ <%=String.format("%.2f", pedido.getTotalPago())%></td>
                                    <td><%=pedido.getEstado()%></td>
                                    <td>
                                        <a href="/BodegaJavaWeb/PedidoController?admin=true&pedidoid=<%=pedido.getId()%>" class="btn btn-primary" style="margin-top: -3px; margin-bottom: -3px">Ver detalle</a>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
