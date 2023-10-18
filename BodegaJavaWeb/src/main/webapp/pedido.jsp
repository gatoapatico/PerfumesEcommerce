<%@ page import="Entity.Carrito" %>
<%@ page import="Controller.ProductoController" %>
<%@ page import="Entity.CarritoItem" %>
<%@ page import="Entity.Producto" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Carrito carrito = (Carrito) request.getSession().getAttribute("carrito");
    ProductoController cProductos = new ProductoController();
    double precioTotal = 0;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedido</title>
        <link rel="stylesheet" href="styles.css">
        <!-- ICON CDN (BOOTSTRAP ICON) -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <%-- LIBRERÍA JQUERY PARA USO DE AJAX --%>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="_header.jsp" %>
        <main class="main-pedido" id="main-pedido">
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
            <h1>PROCESO DE PEDIDO</h1>
            <form action="PedidoController" method="POST">
                <input hidden="hidden" type="text" name="action" value="realizar-pedido">
                <input class="hidden" type="text" name="usuario-id" id="usuario-id" value="<%=usuario.getId()%>" readonly>
                <input class="hidden" type="text" id="usuario-password" value="<%=usuario.getPassword()%>" readonly>
                <div class="paneles">
                    <div class="usuario">
                        <div class="identificacion" id="identificacion">
                            <div class="titulo">
                                <div class="icono">
                                    <i class="bi bi-person-fill"></i>
                                </div>
                                <h1>Identificación</h1>
                            </div>
                            <div class="contenido1">
                                <p>Solicitamos únicamente la información esencial para la finalización de la compra</p>
                                <div class="ux" id="ux-identificacion">
                                    <div class="dato-input whole">
                                        <label for="correo">Correo*</label>
                                        <input type="email" name="usuario-correo" id="correo" value="<%=usuario.getCorreo()%>" readonly required>
                                        <b class="campo-fail hidden">*Es obligatorio este campo</b>
                                    </div>
                                    <div class="dato-input">
                                        <label for="nombre">Nombre*</label>
                                        <input type="text" name="usuario-nombre" id="nombre" value="<%=usuario.getNombre()%>" readonly required>
                                        <b class="campo-fail hidden">*Es obligatorio este campo</b>
                                    </div>
                                    <div class="dato-input">
                                        <label for="apellidos">Apellidos*</label>
                                        <input type="text" name="usuario-apellido" id="apellidos" value="<%=usuario.getApellido()%>" readonly required>
                                        <b class="campo-fail hidden">*Es obligatorio este campo</b>
                                    </div>
                                    <div class="dato-input">
                                        <label for="tipo-documento">Tipo del documento</label>
                                        <select name="usuario-documento-tipo" id="tipo-documento" required>
                                            <option selected value="1">dni</option>
                                            <option value="2">pasaporte</option>
                                        </select>
                                    </div>
                                    <div class="dato-input">
                                        <label for="documento">Documento</label>
                                        <input type="text" name="usuario-documento-numero" pattern="[0-9]{8,10}" id="documento" value="<%=(usuario.getDocumentoNumero() != null) ? usuario.getDocumentoNumero() : ""%>" required>
                                        <b class="campo-fail hidden">*Es obligatorio este campo</b>
                                    </div>
                                    <div class="dato-input">
                                        <label for="telefono">Telefono celular*</label>
                                        <input type="text" name="usuario-telefono" pattern="[0-9]{7,}" id="telefono" value="<%=(usuario.getTelefono() != null) ? usuario.getTelefono() : ""%>" required>
                                        <b class="campo-fail hidden">*Es obligatorio este campo</b>
                                    </div>
                                </div>
                                <button type="button" data-envio="envio">IR A MÉTODO DE ENTREGA</button>
                            </div>
                            <div class="contenido2 hidden">
                                <p class="correo"><span id="correo-resumen">afernandez@gmail.com</span><a href="UsuarioController?action=logout" class="btn-cerrar"> - no soy yo, cerrar sesión</a></p>
                                <p class="nombre-completo"><span id="nombre-resumen">Álvaro</span> <span id="apellidos-resumen">Fernández</span></p>
                                <p class="documento-telefono"><span id="documento-resumen">48527293</span> - <span id="telefono-resumen">943802609</span></p>
                            </div>
                        </div>

                        <div class="envio" id="envio">
                            <div class="titulo">
                                <div class="icono">
                                    <i class="bi bi-house-door-fill"></i>
                                </div>
                                <h1>Dirección de envío</h1>
                            </div>
                            <div class="contenido1 hidden">
                                <p>Indicanos tu modo de entrega:</p>
                                <b class="campo-fail hidden" id="campo-fail-metodos">*Es obligatorio este campo</b>
                                <div class="metodos" id="envio-metodos">
                                    <input class="hidden" type="text" name="metodo-envio" id="metodo-envio" value="">
                                    <div class="metodo" id="metodo-domicilio" data-metodo="domicilio">
                                        <img src="assets/img/pedido/img_delivery.png" alt="delivery" data-metodo="domicilio">
                                        <p data-metodo="domicilio">Despacho a domicilio</p>
                                    </div>
                                    <div class="metodo" id="metodo-tienda" data-metodo="tienda">
                                        <img src="assets/img/pedido/logo_tienda.png" alt="tienda" data-metodo="tienda">
                                        <p data-metodo="tienda">Recojo en tienda</p>
                                    </div>
                                </div>
                                <div class="ui-envio">
                                    <div class="contenido-domicilio hidden" id="contenido-domicilio">
                                        <p>
                                            Los despachos a domicilio solo son válidos para direcciones que
                                            se encuentran en la misma urbanización de la bodega MARISOL
                                        </p>
                                        <div class="dato-input whole">
                                            <label for="direccion-domicilio">Ingresar dirección de entrega a domicilio*</label>
                                            <input type="text" name="direccion-entrega" id="direccion-domicilio">
                                            <b class="campo-fail hidden" id="direccion-domicilio-fail">*Es obligatorio este campo</b>
                                        </div>
                                    </div>
                                    <div class="contenido-tienda hidden" id="contenido-tienda">
                                        <div class="direccion">
                                            <i class="bi bi-geo-alt-fill"></i>
                                            <div class="info">
                                                <p class="titulo">bodega MARISOL</p>
                                                <p>Calle García Rada 341</p>
                                                <p>Lima</p>
                                                <p>Lima, Lima</p>
                                                <button type="button" data-mapa="mapa">Ver más detalles</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="fecha" id="fecha">
                                        <button type="button" data-fecha="fecha">ELIJA UNA FECHA DE ENTREGA<i class="bi bi-calendar-week-fill" data-fecha="fecha"></i></button>
                                        <input type="date" name="fecha-entrega" class="input-fecha-entrega" id="input-fecha-entrega" data-inputfecha="inputfecha" required>
                                        <b class="campo-fail hidden" id="fecha-entrega-fail">*Debes elegir una fecha de entrega</b>
                                    </div>
                                    <div class="fecha-resumen hidden" id="fecha-resumen">
                                        <b>Fecha de entrega</b>
                                        <p><span id="fecha-formateada">Domingo, 27 de agosto del 2023</span> - <span class="btn-cambiar-fecha" data-cambiarfecha="cambiarfecha">Cambiar</span></p>
                                        <b>Horario de entrega</b>
                                        <select class="hora" name="hora-entrega" id="hora">
                                            <option value="09:00:00">De 09:00 AM a 10:00 AM - Gratis</option>
                                            <option value="10:00:00">De 10:00 AM a 11:00 AM - Gratis</option>
                                            <option value="11:00:00">De 11:00 AM a 12:00 PM - Gratis</option>
                                            <option value="12:00:00">De 12:00 PM a 13:00 PM - Gratis</option>
                                            <option value="13:00:00">De 13:00 PM a 14:00 PM - Gratis</option>
                                            <option value="14:00:00">De 14:00 PM a 15:00 PM - Gratis</option>
                                            <option value="15:00:00">De 15:00 PM a 16:00 PM - Gratis</option>
                                            <option value="16:00:00">De 16:00 PM a 17:00 PM - Gratis</option>
                                            <option value="17:00:00">De 17:00 PM a 18:00 PM - Gratis</option>
                                            <option value="18:00:00">De 18:00 PM a 19:00 PM - Gratis</option>
                                            <option value="19:00:00">De 19:00 PM a 20:00 PM - Gratis</option>
                                            <option value="20:00:00">De 20:00 PM a 21:00 PM - Gratis</option>
                                            <option value="21:00:00">De 21:00 PM a 22:00 PM - Gratis</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="recojo">
                                    <p>Responsable de recoger</p>
                                    <p class="datos">
                                        <i class="bi bi-person-fill"></i>
                                        <span><input type="text" name="responsable-documento" id="dni-responsable-actual" value="" readonly> - <input type="text" name="responsable-nombre" id="nombre-responsable-actual" value="" readonly> - </span>
                                        <span class="cambiar" data-abrircambioresponsable="abrircambioresponsable">CAMBIAR</span>
                                    </p>
                                </div>
                                <button type="button" class="btn-pago" data-pago="pago">IR A MÉTODO DE PAGO<i class="bi bi-arrow-right" data-pago="pago"></i></button>
                            </div>
                            <div class="contenido2 hidden">
                                <p class="modalidad" id="modalidad-resumen">RECOGER EN LA TIENDA</p>
                                <p class="direccion" id="direccion-resumen">bodega MARISOL</p>
                                <p class="subtitulo">Programado</p>
                                <p class="fecha"><span id="fecha-dia-resumen">Lunes, 4 de septiembre del 2023</span>, <span id="fecha-hora-resumen">de 19:00 y 20:00</span></p>
                                <button type="button" class="btn-cambiar" data-cambiarenvio="canbiarenvio">Cambiar opciones de entrega</button>
                            </div>
                        </div>

                        <div class="pago" id="pago">
                            <div class="titulo">
                                <div class="icono">
                                    <i class="bi bi-credit-card-2-back-fill"></i>
                                </div>
                                <h1>Método de pago</h1>
                            </div>
                            <div class="contenido1 hidden">
                                <div class="secciones">
                                    <div class="metodo">
                                        <p>Tipo de recibo</p>
                                        <div class="icono">
                                            <i class="bi bi-file-earmark-text-fill"></i>
                                        </div>
                                    </div>
                                    <div class="info">
                                        <div class="botones-comprobantes-tipo">
                                            <button type="button" class="btn-comprobante btn-activo" id="comprobante-boleta" data-comprobante="boleta">BOLETA</button>
                                            <button type="button" class="btn-comprobante btn-pasivo" id="comprobante-factura" data-comprobante="factura">FACTURA</button>
                                            <div class="dato-input">
                                                <input class="hidden" type="text" name="tipo-comprobante" id="tipo-comprobante" value="BOLETA" required>
                                                <b class="campo-fail hidden">*Es obligatorio este campo</b>
                                            </div>
                                            <div class="dato-input">
                                                <label for="numero">Número RUC</label>
                                                <input disabled type="text" pattern="[0-9]{11}" name="numero-ruc" id="numero-ruc" required>
                                                <b class="campo-fail hidden"></b>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="secciones">
                                    <div class="metodo">
                                        <p>Tarjeta de crédito</p>
                                        <div class="icono">
                                            <i class="bi bi-credit-card-2-back-fill"></i>
                                        </div>
                                    </div>
                                    <div class="info">
                                        <div class="dato-input">
                                            <label for="numero">Número</label>
                                            <input type="text" name="numero-tarjeta-pago" pattern="[0-9]{16}" id="numero" required>
                                            <b class="campo-fail hidden">*Es obligatorio este campo</b>
                                        </div>
                                        <div class="dato-input">
                                            <div class="tipo-tarjeta">
                                                <img src="assets/img/pedido/visa.png" alt="visa">
                                                <img src="assets/img/pedido/mastercard.png" alt="mastercard">
                                            </div>
                                            <p>Total - S/
                                                <input type="text" name="total-pago" id="precio-pago" value="20.00" readonly>
                                                <b class="campo-fail hidden">*Es obligatorio este campo</b>
                                            </p>
                                        </div>
                                        <div class="dato-input">
                                            <label for="nombre-tarjeta">Nombre y Apellido como figura en la tarjeta</label>
                                            <input type="text" id="nombre-tarjeta" required>
                                            <b class="campo-fail hidden">*Es obligatorio este campo</b>
                                        </div>
                                        <div class="dato-input">
                                            <p for="fecha-vencimiento">Fecha de Vencimiento</p>
                                            <div class="listas">
                                                <select name="mes" id="mes" required>
                                                    <option value="">MM</option>
                                                    <option value="01">01</option>
                                                    <option value="02">02</option>
                                                    <option value="03">03</option>
                                                    <option value="04">04</option>
                                                    <option value="05">05</option>
                                                    <option value="06">06</option>
                                                    <option value="07">07</option>
                                                    <option value="08">08</option>
                                                    <option value="09">09</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                </select>
                                                <select name="year" id="year">
                                                    <option value="">AA</option>
                                                    <option value="23">23</option>
                                                    <option value="24">24</option>
                                                    <option value="25">25</option>
                                                    <option value="26">26</option>
                                                    <option value="27">27</option>
                                                    <option value="28">28</option>
                                                    <option value="29">29</option>
                                                    <option value="30">30</option>
                                                    <option value="31">31</option>
                                                    <option value="32">32</option>
                                                    <option value="33">33</option>
                                                    <option value="34">34</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="dato-input">
                                            <label for="codigo-tarjeta">Código de seguridad</label>
                                            <input class="small" type="text" pattern="[0-9]{3,4}" id="codigo-tarjeta" required>
                                            <b class="campo-fail hidden">*Es obligatorio este campo</b>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="contenido2">
                                <p>Aún faltan llenar datos</p>
                            </div>
                        </div>
                    </div>
                    <div class="resumen">
                        <div class="titulo">
                            <div class="icono">
                                <i class="bi bi-file-earmark-text-fill"></i>
                            </div>
                            <h1>Resumen de la compra</h1>
                        </div>
                        <div class="productos">
                            <% if(carrito != null) { %>
                                <% for(CarritoItem item : carrito.obtenerItems()) { %>
                                    <% Producto producto = cProductos.obtenerProducto(item.getId()); %>
                                    <% double currentSubtotal =  producto.getPrecio() * item.getCantidad(); %>
                                    <% precioTotal += currentSubtotal; %>
                                    <div class="producto">
                                        <div class="imagen">
                                            <img src="assets/img/productos/<%=producto.getImagen()%>" alt="<%=producto.getDescripcion()%>">
                                        </div>
                                        <div class="info">
                                            <p class="nombre"><%=producto.getNombre()%></p>
                                            <p class="cantidad"><%=item.getCantidad()%></p>
                                            <p class="precio">S/<%=String.format("%.2f", producto.getPrecio() * item.getCantidad())%></p>
                                        </div>
                                    </div>
                                <% } %>
                            <% } %>
                        </div>
                        <div class="total-resumen">
                            <p>Subtotal<span>S/ <span id="subtotal-monto-pedido"><%=String.format("%.2f", precioTotal * 0.82)%></span></span></p>
                            <p>IGV (18%)<span>S/ <span id="igv-monto-pedido"><%=String.format("%.2f", precioTotal * 0.18)%></span></span></p>
                            <p>Costo de envío<span class="color">S/ <span id="costo-monto-pedido">0.00</span></span></p>
                            <p class="total">Total<span>S/ <span id="total-monto-pedido"><%=String.format("%.2f", precioTotal)%></span></span></p>
                        </div>

                        <button type="submit" id="btn-finalizar" class="btn-finalizar hidden" data-finalizar="finalizar"><i class="bi bi-cart-fill"></i>FINALIZAR PEDIDO</button>
                        <a href="carrito.jsp" class="btn-regresar"><i class="bi bi-arrow-left"></i>VOLVER AL CARRITO</a>
                    </div>
                </div>
            </form>
        </main>
        <div class="bg-black-wall hidden" id="bg-black-wall" data-black="black">

        </div>
        <div class="bg-black-wall hidden" id="bg-black-wall-finalizacion" data-compraexito="compraexito">

        </div>
        <div class="popup popup-star hidden" id="popup-star">
            <img src="assets/img/pedido/Star.png" alt="star">
            <h1>¡Muchas gracias!</h1>
            <p>tu pedido está siendo procesado</p>
        </div>
        <div class="popup popup-mapa hidden" id="popup-mapa">
            <img src="assets/img/pedido/mapa.png" alt="mapa-marisol">
        </div>
        <div class="popup popup-cambio-responsable hidden" id="popup-cambio-responsable">
            <h1>Cambio de responsable de recojo</h1>
            <input id="nombre-responsable-nuevo" type="text" placeholder="Nombre de responsable">
            <input id="dni-responsable-nuevo" type="text" placeholder="N° de documento">
            <button data-cambiarresponsable="cambiarresponsable">CAMBIAR RESPONSABLE</button>
        </div>

<%@include file="_footer.jsp" %>
