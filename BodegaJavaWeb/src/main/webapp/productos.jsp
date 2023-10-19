<%@ page import="Entity.Producto" %>
<%@ page import="java.util.List" %>
<%@ page import="Controller.ProductoController" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<c:set var="cProducto" value="<%= new Controller.ProductoController() %>" />
<c:set var="productos" value="${cProducto.obtenerProductos()}" />

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Productos</title>
    <link rel="stylesheet" href="styles.css">
    <!-- ICON CDN (BOOTSTRAP ICON) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <!-- LIBRERÍA JQUERY PARA USO DE AJAX -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>
    <%@include file="_header.jsp" %>
    <c:if test="${not empty param.buscar}">
        <p class="hidden" id="producto-buscado-id">${param.buscar}</p>
    </c:if>
    <main class="main-productos" id="main-productos">
        <%@include file="_nav.jsp" %>
        <h1>PRODUCTOS</h1>
        <div class="catalogo">
            <c:forEach items="${productos}" var="producto">
                <div class="producto">
                    <div class="imagen">
                        <img src="ImgController?id=${producto.id}" alt="${producto.descripcion}">
                    </div>
                    <p class="hidden" id="categoria">${producto.categoria}</p>
                    <p class="nombre" id="nombre-producto">${producto.nombre}</p>
                    <p class="marca" id="marca-producto">${producto.proveedor}</p>
                    <p class="precio">S/<fmt:formatNumber value="${producto.precio}" type="currency" currencyCode="PEN" /></p>
                    <c:choose>
                        <c:when test="${not empty usuario}">
                            <button class="btn-agregar" data-agregar="agregar" data-productoid="${producto.id}">AGREGAR</button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn-agregar" data-login="login">AGREGAR</button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
        </div>
    </main>
    <div class="fixed" id="fixed">
        <!-- AQUÍ VAN LOS POPUPS CUANDO SE AGREGA UN PRODUCTO AL CARRITO -->
        <c:choose>
            <c:when test="${not empty param.login}">
                <div class="popup-login-fail">
                    <p>El usuario ingresado <span>no existe!</span></p>
                </div>
            </c:when>
            <c:when test="${not empty param.register}">
                <div class="popup-login-fail">
                    <p>El correo ingresado ya no está disponible</p>
                </div>
            </c:when>
        </c:choose>
    </div>
    <div class="bg-black-wall hidden" id="bg-black-wall" data-black="black"></div>
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
