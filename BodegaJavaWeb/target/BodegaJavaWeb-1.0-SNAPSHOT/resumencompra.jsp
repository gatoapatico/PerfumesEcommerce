<%@ page import="Entity.Pedido" %>
<%@ page import="java.util.List" %>
<%@ page import="Entity.DetallePedido" %>
<%@ page import="Controller.PedidoController" %>
<%@ page import="Controller.ProductoController" %>
<%@ page import="Entity.Producto" %>
<%@ page import="Config.DateFormats" %>
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
        <title>Boleta Resumen</title>
        <link rel="stylesheet" href="styles.css">
        <!-- ICON CDN (BOOTSTRAP ICON) -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>
    <body>
        <%@include file="_header.jsp" %>
        <main class="main-resumen">
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
            <h1>PEDIDO CONFIRMADO</h1>
            <div class="paneles" id="paneles">
                <div class="panel panel1">
                    <b class="txt-confirmacion">¡Hemos confirmado tu pedido con éxito!</b>
                    <p class="txt-envio-email">Puedes descargar tu comprobante de pago <button data-crearpdf="crearpdf">DESCARGAR COMPROBANTE</button></p>
                </div>
                <div class="contenedor-boleta" id="contenedor-boleta">
                    <div class="panel panel2">
                        <div class="comprobante-encabezado">
                            <div class="info-encabezado">
                                <p class="encabezado-titulo">BODEGA MARISOL - COMPROBANTE DE PAGO</p>
                                <p class="tarjeta-pedido">Pedido Confirmado: <span class="tarjeta-pedido-codigo" id="comprobante-codigo-unico"><%=pedido.getCodigoUnico()%></span> | <span class="tarjeta-pedido-fecha"><%=DateFormats.formatoFechaTexto(pedido.getFecha())%></span></p>
                            </div>
                            <div class="codigo-barras">
                                <img src="assets/img/codigo-barras.png" alt="codigo de barras">
                            </div>
                        </div>
                        <div class="tarjetas">
                            <div class="tarjeta datos-personales">
                                <b>DATOS PERSONALES</b>
                                <p>NOMBRE: <span class="tarjeta-nombre"><%=usuario.getNombre() + " " + usuario.getApellido()%></span></p>
                                <p>DNI: <span class="tarjeta-dni"><%=usuario.getDocumentoNumero()%></span></p>
                                <p>CORREO: <span class="tarjeta-correo"><%=usuario.getCorreo()%></span></p>
                                <p>TELÉFONO: <span class="tarjeta-telefono"><%=usuario.getTelefono()%></span></p>
                            </div>
                            <div class="tarjeta medio-pago">
                                <b>MEDIO DE PAGO</b>
                                <p>PEDIDO: <span class="bold"><%=pedido.getCodigoUnico()%></span></p>
                                <p class="no-bold">Pago con tarjeta de Crédito (Visa)</p>
                                <p class="no-bold">S/ <span><%=String.format("%.2f", pedido.getTotalPago())%></span></p>
                            </div>
                            <div class="tarjeta info-resumen">
                                <b>RESUMEN</b>
<%--                                <p class="no-bold">Subtotal <span>S/ <span><%=(pedido.getMetodoEnvio() == 1) ? String.format("%.2f", pedido.getTotalPago()) : String.format("%.2f", pedido.getTotalPago() - 5)%></span></span></p>--%>
                                <p class="no-bold">Subtotal <span>S/ <span><%=String.format("%.2f", pedido.getSubTotalPago())%></span></span></p>
                                <p class="no-bold">IGV (18%) <span>S/ <span><%=String.format("%.2f", pedido.getIgvPago())%></span></span></p>
                                <p class="no-bold">Envío <span>S/ <span><%=String.format("%.2f", pedido.getEnvioPago())%></span></span></p>
                                <p class="no-bold tarjeta-total">Total <span>S/ <span><%=String.format("%.2f", pedido.getTotalPago())%></span></span></p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel3">
                        <div class="info-pedido">
                            <p>PEDIDO: <span><%=pedido.getCodigoUnico()%></span></p>
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
                <a href="ProductoController?action=load" class="btn-seguir-comprando"><i class="bi bi-arrow-left"></i>SEGUIR COMPRANDO<i class="bi bi-cart-fill"></i></a>
            </div>
        </main>
<script type="text/javascript" src="jspdf.min.js"></script>
<script type="text/javascript" src="html2canvas.min.js"></script>
<%@include file="_footer.jsp" %>
