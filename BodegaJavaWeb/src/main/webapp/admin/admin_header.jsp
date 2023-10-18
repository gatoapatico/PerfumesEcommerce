<nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
    <div class="container-md">
        <a class="navbar-brand" href="/BodegaJavaWeb/admin/admin_home.jsp">
            <img src="/BodegaJavaWeb/assets/img/Marisol_Logo.png" alt="Logo" width="200"
                 class="d-inline-block align-text-top" style="background:white; padding: 1px; filter: invert(100%); background-color: transparent;">
        </a>
        <span style="color: white; font-size: 1.5rem;">| Modo Administrador</span>>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <i class="bi bi-person-circle"></i>&nbsp; Usuarios
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item"
                               href="/BodegaJavaWeb/admin/admin_usuarios.jsp">Visualizar
                            Usuarios</a></li>
                        <li><a class="dropdown-item"
                               href="/BodegaJavaWeb/admin/admin_usuarios_agregar.jsp">Agregar
                            Usuarios</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <i class="bi bi-basket"></i>&nbsp; Productos
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item"
                               href="/BodegaJavaWeb/admin/admin_productos.jsp">Visualizar
                            Productos</a></li>
                        <li><a class="dropdown-item"
                               href="/BodegaJavaWeb/admin/admin_productos_agregar.jsp">Agregar
                            Productos</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <i class="bi bi-ticket"></i>&nbsp; Pedidos
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item"
                               href="/BodegaJavaWeb/admin/admin_pedidos.jsp">Visualizar Pedidos</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <a class="navbar-brand" href="/BodegaJavaWeb">
            <i class="bi bi-arrow-bar-left"></i> Regresar al Sitio Web
        </a>
    </div>
</nav>
