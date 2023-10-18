
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfumes Web</title>
    <link rel="stylesheet" href="styles.css">
    <!-- ICON CDN (BOOTSTRAP ICON) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


    <link rel="stylesheet" href="index.css">
    <%--<link rel="stylesheet" href="/AV1_Proyecto/ViewCliente/styles.css">
    <link rel="stylesheet" href="/AV1_Proyecto/ViewCliente/IniciarSesion/CitaEstilo.css">
    <link rel="stylesheet" href="/AV1_Proyecto/ViewCliente/IniciarSesion/modalG.css">
    <!-- ICON CDN (BOOTSTRAP ICON) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="index.css">
    <script src="https://kit.fontawesome.com/cefc19ce63.js" crossorigin="anonymous"></script>--%>
</head>
<body>
    <%@include file="_header.jsp" %>

    <div class="go-z-back">
        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="assets/img/perfumes/bn_1.png" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="assets/img/perfumes/bn21.png" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="assets/img/perfumes/bn3.png" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <!-- CARD -->
    <h2 class="section-title">Tus Tarjetas</h2>
    <div class="bodys" >

        <div class="card" onmouseover="changeImage(this)" onmouseout="resetImage(this)">
            <img src="assets/img/perfumes/perfume1.jpg" alt="Imagen 1">
            <h3>Card 1</h3>
        </div>

        <div class="card" onmouseover="changeImage(this)" onmouseout="resetImage(this)">
            <img src="assets/img/perfumes/perfume1.jpg" alt="Imagen 2">
            <h3>Card 2</h3>
        </div>
        <div class="card" onmouseover="changeImage(this)" onmouseout="resetImage(this)">
            <img src="assets/img/perfumes/perfume1.jpg" alt="Imagen 2">
            <h3>Card 2</h3>
        </div>
        <div class="card" onmouseover="changeImage(this)" onmouseout="resetImage(this)">
            <img src="assets/img/perfumes/perfume1.jpg" alt="Imagen 2">
            <h3>Card 2</h3>
        </div>
        <div class="card" onmouseover="changeImage(this)" onmouseout="resetImage(this)">
            <img src="assets/img/perfumes/perfume1.jpg" alt="Imagen 2">
            <h3>Card 2</h3>
        </div>
    </div>

    <!-- IMAGEN ESTATICA -->
    <div id="carouselExampleFade" class="carousel slide carousel-fade go-z-back" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="assets/img/perfumes/estatic.png" alt="First slide">
            </div>
        </div>
    </div>
    </div>


    <!-- SLIDER -->

    <header class="head">
        <h1 class="top">Top Hottest Product</h1>
        <p>
            <span>&#139;</span>
            <span>&#155;</span>
        </p>
    </header>
    <section class="slider">
        <div class="product">


            <picture>

                <img src="assets/img/perfumes/perfume6.jpg">
            </picture>
            <div class="details">
                <p>
                    <b>hola</b>

                </p>
                <samp>S/.200</samp>
            </div>
            <div class="button">
                <p class="star">
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                </p>
                <a >ver detalles</a>
            </div>
        </div>


        <div class="product">


            <picture>

                <img src="assets/img/perfumes/perfume6.jpg">
            </picture>
            <div class="details">
                <p>
                    <b>hola</b>

                </p>
                <samp>S/.200</samp>
            </div>
            <div class="button">
                <p class="star">
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                </p>
                <a >ver detalles</a>
            </div>
        </div>
        <div class="product">


            <picture>

                <img src="assets/img/perfumes/perfume6.jpg">
            </picture>
            <div class="details">
                <p>
                    <b>hola</b>

                </p>
                <samp>S/.200</samp>
            </div>
            <div class="button">
                <p class="star">
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                </p>
                <a >ver detalles</a>
            </div>
        </div>
        <div class="product">


            <picture>

                <img src="assets/img/perfumes/perfume6.jpg">
            </picture>
            <div class="details">
                <p>
                    <b>hola</b>

                </p>
                <samp>S/.200</samp>
            </div>
            <div class="button">
                <p class="star">
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                </p>
                <a >ver detalles</a>
            </div>
        </div>
        <div class="product">


            <picture>

                <img src="assets/img/perfumes/perfume6.jpg">
            </picture>
            <div class="details">
                <p>
                    <b>hola</b>

                </p>
                <samp>S/.200</samp>
            </div>
            <div class="button">
                <p class="star">
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                </p>
                <a >ver detalles</a>
            </div>
        </div>
        <div class="product">


            <picture>

                <img src="assets/img/perfumes/perfume6.jpg">
            </picture>
            <div class="details">
                <p>
                    <b>hola</b>

                </p>
                <samp>S/.200</samp>
            </div>
            <div class="button">
                <p class="star">
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                </p>
                <a >ver detalles</a>
            </div>
        </div>
        <div class="product">


            <picture>

                <img src="assets/img/perfumes/perfume6.jpg">
            </picture>
            <div class="details">
                <p>
                    <b>hola</b>

                </p>
                <samp>S/.200</samp>
            </div>
            <div class="button">
                <p class="star">
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                </p>
                <a >ver detalles</a>
            </div>
        </div>
        <div class="product">


            <picture>

                <img src="assets/img/perfumes/perfume6.jpg">
            </picture>
            <div class="details">
                <p>
                    <b>hola</b>

                </p>
                <samp>S/.200</samp>
            </div>
            <div class="button">
                <p class="star">
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                    <strong>&star;</strong>
                </p>
                <a >ver detalles</a>
            </div>
        </div>

    </section>


    <!-- IMAGEN ESTATICA -->
    <div id="carouselExampleFade" class="carousel slide carousel-fade go-z-back" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="assets/img/perfumes/estatic.png" alt="First slide">
            </div>
        </div>
    </div>


    <footer>
        <div class="footer-content">
            <div class="footer-logo">
                <img src="assets/img/perfumes/perfume-logo.png" alt="Logo de la empresa">
            </div>
            <div class="footer-links">
                <ul>
                    <li><a href="#">Inicio</a></li>
                    <li><a href="#">Acerca de Nosotros</a></li>
                    <li><a href="#">Servicios</a></li>
                    <li><a href="#">Contacto</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-social">
            <a href="#"><i class="bi bi-facebook"></i></a>
            <a href="#"><i class="bi bi-twitter"></i></a>
            <a href="#"><i class="bi bi-instagram"></i></a>
        </div>
        <p>&copy; 2023 Perfume. Todos los derechos reservados.</p>
    </footer>


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
        <form action="" class="form">
            <h1>REGISTRO</h1>
            <input type="text" placeholder="Ingrese su nombre" required>
            <input type="text" placeholder="Ingrese apellido" required>
            <input type="email" placeholder="Ingrese correo" required>
            <input type="password" placeholder="Ingrese contraseña" required>
            <button>REGISTRATE</button>
        </form>
    </div>

    <script src="index.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>
</html>
