<%@ page import="Entity.Carrito" %>
<%@ page import="Entity.CarritoItem" %>
<%@ page import="Controller.ProductoController" %>
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
        <title>Carrito</title>
        <link rel="stylesheet" href="styles.css">
        <!-- ICON CDN (BOOTSTRAP ICON) -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <%-- LIBRERÍA JQUERY PARA USO DE AJAX --%>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="_header.jsp" %>
        <main class="main-carrito">
            <nav class="categorias">
                <a href="ProductoController">CARNES, AVES Y PESCADOS</a>
                <a href="ProductoController">CONGELADOS</a>
                <a href="ProductoController">LACTEOS</a>
                <a href="ProductoController">FRUTAS Y VERDURAS</a>
                <a href="ProductoController">PANADERIA Y PASTELERIA</a>
                <a href="ProductoController">BEBIDAS</a>
                <a href="ProductoController">CUIDADO PERSONAL</a>
                <a href="ProductoController">LIMPIEZA</a>
            </nav>
            <h1>TU CARRITO</h1>
            <div class="paneles">
                <div class="productos">
                    <p class="mensaje-carrito-vacio <%=(carrito != null) ? "hidden" : ""%>">Aún no agregaste ningún producto al carrito!</p>
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
                                    <p class="marca"><%=producto.getProveedor()%></p>
                                    <div class="precio">
                                        <p class="unidad">S/<span><%=String.format("%.2f", producto.getPrecio())%></span></p>
                                        <div class="acumulado">
                                            <p class="subtitulo">subtotal:</p>
                                            <p class="subtotal">S/<span><%=String.format("%.2f", currentSubtotal)%></span></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="ux">
                                    <button class="btn-remove"><i class="bi bi-trash3-fill" data-remove="remove" data-id="<%=producto.getId()%>"></i></button>
                                    <div class="quantity">
                                        <button class="btn-sub" data-sub="sub" data-id="<%=producto.getId()%>">-</button>
                                        <p class="num"><%=item.getCantidad()%></p>
                                        <button class="btn-add" data-add="add" data-id="<%=producto.getId()%>">+</button>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    <% } %>
                </div>
                <div class="resumen <%=(carrito != null) ? "" : "hidden"%>">
                    <div class="info">
                        <p class="titulo">Resumen de Compra</p>
                        <p class="subtotal">Subtotal<span id="subtotal">S/<%=String.format("%.2f", precioTotal)%></span></p>
                        <p class="total">Total<span id="total">S/<%=String.format("%.2f", precioTotal)%></span></p>
                    </div>
                    <div class="ux">
                        <a href="pedido.jsp">IR A PAGAR<i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </main>

<%@include file="_footer.jsp" %>
