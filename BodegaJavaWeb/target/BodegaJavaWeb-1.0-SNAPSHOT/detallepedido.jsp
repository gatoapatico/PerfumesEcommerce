<%@ page import="Entity.Pedido" %>
<%@ page import="Controller.PedidoController" %>
<%@ page import="Controller.ProductoController" %>
<%@ page import="Entity.DetallePedido" %>
<%@ page import="java.util.List" %>
<%@ page import="Config.DateFormats" %>
<%@ page import="Entity.Producto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Pedido pedido = (Pedido) request.getSession().getAttribute("pedido");
    PedidoController cPedido = new PedidoController();
    ProductoController cProducto = new ProductoController();
    List<DetallePedido> detallesPedido = cPedido.obtenerDetalles(pedido.getId());

%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detalle Pedido</title>
        <link rel="stylesheet" href="styles.css">
        <!-- ICON CDN (BOOTSTRAP ICON) -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>
    <body>
        <%@include file="_header.jsp" %>
        <main class="main-detalle-pedido">
            <nav class="categorias">
                <a href="">CARNES, AVES Y PESCADOS</a>
                <a href="">CONGELADOS</a>
                <a href="">LACTEOS</a>
                <a href="">FRUTAS Y VERDURAS</a>
                <a href="">PANADERIA Y PASTELERIA</a>
                <a href="">BEBIDAS</a>
                <a href="">CUIDADO PERSONAL</a>
                <a href="">LIMPIEZA</a>
            </nav>
            <h1>DETALLE PEDIDO</h1>
            <div class="paneles" id="paneles">
                <div class="panel panel1">
                    <div class="info">
                        <p class="comprobante-titulo">BODEGA MARISOL - COMPROBANTE DE PAGO</p>
                        <p class="tarjeta-pedido">Código de pedido: <span class="bold" id="comprobante-codigo-unico"><%=pedido.getCodigoUnico()%></span></p>
                        <p class="tarjeta-pedido">Medio de Pago: <span class="bold">Visa</span></p>
                        <p class="tarjeta-pedido">Pago total: <span>S/ <span class="bold"><%=String.format("%.2f", pedido.getTotalPago())%></span></span></p>
                    </div>
                    <div class="codigo-barras">
                        <img src="assets/img/codigo-barras.png" alt="codigo de barras">
                    </div>
                </div>
                <div class="panel panel2">
                    <div class="info-pedido">
                        <p>MÉTODO DE ENTREGA: <span><%=(pedido.getMetodoEnvio() == 1) ? "Retiro en bodega MARISOL" : "Entrega a domicilio"%></span></p>
                        <p>FECHA: <span><%=DateFormats.formatoFechaDiaTexto(pedido.getFechaEntrega())%></span></p>
                        <p>HORA: <span><%="Entre las " + DateFormats.formatoHora(pedido.getHoraEntrega()) + " y las " + DateFormats.sumarHora(pedido.getHoraEntrega())%></span></p>
                        <p>DIRECCIÓN: <span><%=pedido.getDireccionEntrega()%></span></p>
                    </div>
                    <table class="tabla-productos">
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th class="big-space"></th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(DetallePedido detalle : detallesPedido) {%>
                                <% Producto producto = cProducto.obtenerProducto(detalle.getProductoId()); %>
                                <tr>
                                    <td><img src="assets/img/productos/<%=producto.getImagen()%>" alt="<%=producto.getDescripcion()%>"></td>
                                    <td><%=producto.getNombre()%></td>
                                    <td class="tabla-precio">S/ <%=String.format("%.2f", detalle.getPrecio())%></td>
                                    <td class="tabla-cantidad"><div class="cuadro-cantidad"><%=detalle.getCantidad()%></div></td>
                                    <td class="tabla-precio">S/ <%=String.format("%.2f", detalle.getSubtotal())%></td>
                                </tr>
                            <% } %>
                            <% if(pedido.getMetodoEnvio() == 2) {%>
                                <tr class="fila-comision">
                                    <td colspan="4">Comision de envio a domicilio</td>
                                    <td class="tabla-precio">S/ 5.00</td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            <button class="btn-descargar-comprobante" data-crearpdfdetalle="crearpdfdetalle">DESCARGAR COMPROBANTE</button>
            <a href="perfil.jsp" class="btn-volver-perfil"><i class="bi bi-arrow-left"></i>VOLVER AL PERFIL</a>
        </main>
<script type="text/javascript" src="jspdf.min.js"></script>
<script type="text/javascript" src="html2canvas.min.js"></script>
<%@include file="_footer.jsp" %>
