<%@ page import="Entity.Pedido" %>
<%@ page import="Controller.PedidoController" %>
<%@ page import="Controller.ProductoController" %>
<%@ page import="Entity.DetallePedido" %>
<%@ page import="java.util.List" %>
<%@ page import="Entity.Producto" %>
<%@ page import="Controller.UsuarioController" %>
<%@ page import="Entity.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Pedido pedido = (Pedido) request.getSession().getAttribute("pedido");
    PedidoController cPedido = new PedidoController();
    ProductoController cProducto = new ProductoController();
    List<DetallePedido> detallesPedido = cPedido.obtenerDetalles(pedido.getId());
    UsuarioController cUsuario = new UsuarioController();
    Usuario usuario = cUsuario.obtenerUsuario(pedido.getUsuarioId());

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
            <a href="/BodegaJavaWeb/admin/admin_pedidos.jsp" class="btn btn-primary mt-1 mb-3">Regresar a la tabla de pedidos</a>
            <div class="row rounded bg-light mb-3">
                <form action="/BodegaJavaWeb/PedidoController" method="POST" class="p-4">
                    <input hidden="hidden" type="text" name="action" value="actualizar-estado">
                    <input hidden="hidden" type="text" name="pedido-id" value="<%=pedido.getId()%>">
                    <div class="mb-3">
                        <label for="estadoPedido" class="form-label">Estado de Pedido</label>
                        <select class="form-select" id="estadoPedido" name="estado-pedido" aria-describedby="emailHelp">
                            <% String[] estados = {"EN PROCESO", "LISTO PARA RECOGER", "ENTREGADO"}; %>
                            <% for(String estado : estados) { %>
                                <% String selected = (pedido.getEstado().equals(estado)) ? "selected" : "";%>
                                <option <%=selected%> value="<%=estado%>"><%=estado%></option>
                            <% } %>
                        </select>
                        <div id="emailHelp" class="form-text">Actualiza el estado del pedido</div>
                    </div>
                    <button type="submit" class="btn btn-success">ACTUALIZAR ESTADO DEL PEDIDO</button>
                </form>
            </div>

            <div class="row">


                <h3 class="text-light text-center mb-4">Detalle de Pedido</h3>
                <div class="col-md-12 me-4">
                    <div class="row rounded bg-light" style="box-shadow: -10px 10px 10px rgba(255,255,255,0.5)">
                        <div class="infoProducto p-4" style="display: grid; grid-template-columns: 50% 50%;">
                            <div>
                                <div class="mb-3 me-4">
                                    <label for="txtId" class="form-label">Id:</label>
                                    <input type="text" id="txtId" disabled value="<%=pedido.getId()%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtCodigoUnico" class="form-label">Código Único:</label>
                                    <input type="text" id="txtCodigoUnico" disabled value="<%=pedido.getCodigoUnico()%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtFecha" class="form-label">Fecha:</label>
                                    <input type="text" id="txtFecha" disabled value="<%=pedido.getFecha().split(" ")[0]%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtHora" class="form-label">Hora:</label>
                                    <input type="text" id="txtHora" disabled value="<%=pedido.getFecha().split(" ")[1]%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtUsuario" class="form-label">Usuario correo:</label>
                                    <input type="text" id="txtUsuario" disabled value="<%=usuario.getCorreo()%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtMetodoEnvio" class="form-label">Metodo de Envio:</label>
                                    <input type="text" id="txtMetodoEnvio" disabled value="<%=(pedido.getMetodoEnvio() == 1) ? "Recojo en bodega MARISOL" : "Entrega a domicilio"%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtDireccion" class="form-label">Dirección de Entrega:</label>
                                    <input type="text" id="txtDireccion" disabled value="<%=pedido.getDireccionEntrega()%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtFechaEntrega" class="form-label">Fecha de Entrega:</label>
                                    <input type="text" id="txtFechaEntrega" disabled value="<%=pedido.getFechaEntrega()%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtHoraEntrega" class="form-label">Hora de Entrega:</label>
                                    <input type="text" id="txtHoraEntrega" disabled value="<%=pedido.getHoraEntrega()%>" class="form-control" >
                                </div>
                            </div>
                            <div>
                                <div class="mb-3 me-4">
                                    <label for="txtResponsableDNI" class="form-label">Responsable de Recojo DNI:</label>
                                    <input type="text" id="txtResponsableDNI" disabled value="<%=pedido.getResponsableDni()%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtResponsableNombre" class="form-label">Responsable de Recojo Nombre:</label>
                                    <input type="text" id="txtResponsableNombre" disabled value="<%=pedido.getResponsableNombre()%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtReciboTipo" class="form-label">Recibo Tipo:</label>
                                    <input type="text" id="txtReciboTipo" disabled value="<%=pedido.getReciboTipo()%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtRUC" class="form-label">RUC:</label>
                                    <input type="text" id="txtRUC" disabled value="<%=(pedido.getRuc() != null) ? pedido.getRuc() : ""%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtNumeroTarjetaPago" class="form-label">Número de Tarjeta de Pago:</label>
                                    <input type="text" id="txtNumeroTarjetaPago" disabled value="<%=pedido.getNumeroTarjetaPago()%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtSubtotal" class="form-label">Precio Subtotal:</label>
                                    <input type="text" id="txtSubtotal" disabled value="<%=String.format("%.2f",pedido.getSubTotalPago())%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtEnvio" class="form-label">Precio Envio:</label>
                                    <input type="text" id="txtEnvio" disabled value="<%=String.format("%.2f",pedido.getEnvioPago())%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtIGV" class="form-label">Precio IGV:</label>
                                    <input type="text" id="txtIGV" disabled value="<%=String.format("%.2f",pedido.getIgvPago())%>" class="form-control" >
                                </div>
                                <div class="mb-3 me-4">
                                    <label for="txtTotal" class="form-label">Precio Total:</label>
                                    <input type="text" id="txtTotal" disabled value="<%=String.format("%.2f",pedido.getTotalPago())%>" class="form-control" >
                                </div>

                            </div>

                        </div>

                        <div class="p-4">
                            <h2>Productos Comprados</h2>
                            <table class="table container-fluid mt-2 table-striped">
                                <thead class="table-warning">
                                    <tr>
                                        <th scope="col">Producto</th>
                                        <th scope="col">Descripcion</th>
                                        <th scope="col">Precio</th>
                                        <th scope="col">Cantidad</th>
                                        <th scope="col">Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(DetallePedido detalle : detallesPedido) { %>
                                    <% Producto producto = cProducto.obtenerProducto(detalle.getProductoId()); %>
                                        <tr>
                                            <td>
                                                <img width="50" src="/BodegaJavaWeb/assets/img/productos/<%=producto.getImagen()%>" alt="<%=producto.getDescripcion()%>">
                                            </td>
                                            <td><%=producto.getDescripcion()%></td>
                                            <td>S/ <%=String.format("%.2f", detalle.getPrecio())%></td>
                                            <td><%=detalle.getCantidad()%></td>
                                            <td>S/ <%=String.format("%.2f", detalle.getSubtotal())%></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    </body>
</html>
