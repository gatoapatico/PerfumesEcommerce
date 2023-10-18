
<%@page import="Entity.Producto"%>
<%@page import="java.util.List"%>
<%@ page import="Controller.ProductoController" %>
<%
    ProductoController cProducto = new ProductoController();
    List<Producto> productos = cProducto.obtenerProductos();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link rel="stylesheet" href="styles.css">
        <!-- ICON CDN (BOOTSTRAP ICON) -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <%-- LIBRERÍA JQUERY PARA USO DE AJAX --%>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="_header.jsp" %>
        <% if(request.getParameter("buscar") != null) { %>
            <p class="hidden" id="producto-buscado-id"><%=request.getParameter("buscar")%></p>
        <% } %>
        <main class="main-productos" id="main-productos">
            <nav class="categorias">
                <button data-categoria="CARNES, AVES Y PESCADOS">CARNES, AVES Y PESCADOS</button>
                <button data-categoria="CONGELADOS">CONGELADOS</button>
                <button data-categoria="LACTEOS">LACTEOS</button>
                <button data-categoria="FRUTAS Y VERDURAS">FRUTAS Y VERDURAS</button>
                <button data-categoria="PANADERIA Y PASTELERIA">PANADERIA Y PASTELERIA</button>
                <button data-categoria="BEBIDAS">BEBIDAS</button>
                <button data-categoria="CUIDADO PERSONAL">CUIDADO PERSONAL</button>
                <button data-categoria="LIMPIEZA">LIMPIEZA</button>
            </nav>
            <h1>PRODUCTOS</h1>
            <div class="catalogo">
                <% for(Producto producto : productos) {%>
                    <div class="producto">
                        <div class="imagen">
                            <img src="assets/img/productos/<%=producto.getImagen()%>" alt="<%=producto.getDescripcion()%>">
                        </div>
                        <p class="hidden" id="categoria"><%=producto.getCategoria()%></p>
                        <p class="nombre" id="nombre-producto"><%=producto.getNombre()%></p>
                        <p class="marca" id="marca-producto"><%=producto.getProveedor()%></p>
                        <p class="precio">S/<%=String.format("%.2f", producto.getPrecio())%></p>
                        <%if(usuario != null) {%>
                            <button class="btn-agregar" data-agregar="agregar" data-productoid="<%=producto.getId()%>">AGREGAR</button>
                        <% } else{ %>
                            <button class="btn-agregar" data-login="login">AGREGAR</button>
                        <% } %>
                    </div>
                <% } %>
            </div>
        </main>
        <div class="fixed" id="fixed">
            <!-- AQUÍ VAN LOS POPUPS CUANDO SE AGREGA UN PRODUCTO AL CARRITO -->
            <% if(request.getParameter("login") != null) { %>
                <div class="popup-login-fail">
                    <p>El usuario ingresado <span>no existe!</span></p>
                </div>
            <% } else if(request.getParameter("register") != null) { %>
                <div class="popup-login-fail">
                    <p>El correo ingresado ya no está disponible</p>
                </div>
            <% } %>
            
        </div>
        <div class="bg-black-wall hidden" id="bg-black-wall" data-black="black">

        </div>
        <div class="popup popup-login hidden" id="popup-login">
            <form action="UsuarioController" class="form" method="POST">
                <input hidden type="text" name="action" value="login">
                <h1>INICIO DE SESIÓN</h1>
                <input type="email" placeholder="Correo" name="correo" required>
                <input type="password" placeholder="Contraseña" name="password" required>
                <button type="submit">INGRESAR</button>
                <p>¿No tienes cuenta? <span data-registrate="registrate">Regístrate</span></p>
            </form>
        </div>
        <div class="popup popup-registrate hidden" id="popup-registrate">
            <form action="UsuarioController" class="form" method="POST">
                <input hidden type="text" name="action" value="register">
                <h1>REGISTRO</h1>
                <input type="text" placeholder="Ingrese su nombre" name="nombre" required>
                <input type="text" placeholder="Ingrese apellido" name="apellido" required>
                <input type="email" placeholder="Ingrese correo" name="correo" required>
                <input type="password" placeholder="Ingrese contraseña" name="password" required>
                <button>REGISTRATE</button>
            </form>
        </div>

            
<%@include file="_footer.jsp" %>
