document.addEventListener('click', function(e){
    if(e.target.dataset.black){
        cerrarPopups();
    }
    else if(e.target.dataset.login){
        document.getElementById('bg-black-wall').classList.toggle('hidden');
        document.getElementById('popup-login').classList.toggle('hidden');
    }
    else if(e.target.dataset.registrate){
        document.getElementById('popup-login').classList.toggle('hidden');
        document.getElementById('popup-registrate').classList.toggle('hidden');
    }
    else if(e.target.dataset.buscarproducto) {

        const productoBuscado = document.getElementById('producto-buscado').value;
        console.log(productoBuscado);
        window.location.href = `productos.jsp?buscar=${productoBuscado}`;


    }
    else if(e.target.dataset.agregar){

        const idProducto = e.target.dataset.productoid;

        $.ajax({
            url: 'CarritoController',
            type: 'POST',
            data: { action: "agregar", id: idProducto },
            success: function() {
                const nombre = e.target.parentNode.querySelector('.nombre').textContent;
                const precio = e.target.parentNode.querySelector('.precio').textContent;

                const newEl = document.createElement('div');
                newEl.classList.add('popup-agregar-producto');
                newEl.innerHTML = `
                    <p>
                        <i class="bi bi-cart-check-fill"></i>
                        Se agrego <span>${nombre}</span><br>(<span>${precio}</span>) al carrito de compras!
                    </p>
                `;
                document.getElementById('fixed').append(newEl);

                setTimeout(function(){
                    newEl.remove();
                }, 3000);

            },
            error: function() {
                console.log("No se agregó nada al carrito!");
            }
        });

    }
    else if(e.target.dataset.categoria){
        const categoria = e.target.dataset.categoria;
        const productos = document.getElementsByClassName('producto');

        for(let i = 0; i < productos.length; i++){
            if(productos[i].querySelector('#categoria').textContent === categoria){
                productos[i].classList.remove('hidden');
            }
            else {
                productos[i].classList.add('hidden');
            }
        }
    }
    else if(e.target.dataset.sub){
        const quantityValue = e.target.parentNode.querySelector('.num').textContent;
        if(quantityValue > 1){
            $.ajax({
                url: 'CarritoController',
                type: 'POST',
                data: { action: "sub", id: e.target.dataset.id },
                success: function() {
                    const quantityValue = e.target.parentNode.querySelector('.num').textContent;
                    const quantityNewValue = parseInt(quantityValue) - 1;
                    const price = parseFloat(e.target.parentNode.parentNode.parentNode.querySelector('.unidad').querySelector('span').textContent);

                    e.target.parentNode.querySelector('.num').textContent = quantityNewValue;
                    e.target.parentNode.parentNode.parentNode.querySelector('.subtotal').querySelector('span').textContent = (quantityNewValue * price).toFixed(2);

                    calcularTotal();
                },
                error: function() {
                    console.log("Sucedió un error!");
                }
            });
        }
    }
    else if(e.target.dataset.add){
        $.ajax({
            url: 'CarritoController',
            type: 'POST',
            data: { action: "add", id: e.target.dataset.id },
            success: function () {
                const quantityValue = e.target.parentNode.querySelector('.num').textContent;
                const quantityNewValue = parseInt(quantityValue) + 1;
                const price = parseFloat(e.target.parentNode.parentNode.parentNode.querySelector('.unidad').querySelector('span').textContent);

                e.target.parentNode.querySelector('.num').textContent = quantityNewValue;
                e.target.parentNode.parentNode.parentNode.querySelector('.subtotal').querySelector('span').textContent = (quantityNewValue * price).toFixed(2);

                calcularTotal();

            },
            error: function () {
                console.log("Sucedió un error!");
            }
        });
    }
    else if(e.target.dataset.remove){
        $.ajax({
            url: 'CarritoController',
            type: 'POST',
            data: { action: "remove", id: e.target.dataset.id },
            success: function() {
                e.target.parentNode.parentNode.parentNode.remove();
                calcularTotal();
            },
            error: function() {
                console.log("Sucedió un error!");
            }
        });
    }
    else if(e.target.dataset.envio) {
        const datos = document.getElementById('ux-identificacion');
        const inputs = datos.querySelectorAll('input');
        let cont = 0;

        const id = document.getElementById('usuario-id').value;
        const password = document.getElementById('usuario-password').value;
        const correo = inputs.item(0).value;
        const nombre = inputs.item(1).value;
        const apellidos = inputs.item(2).value;
        const documento = inputs.item(3).value;
        const telefono = inputs.item(4).value;

        inputs.forEach(input => {
            if(input.value === ''){
                input.parentNode.querySelector('b').classList.remove('hidden');
            }
            else {
                input.parentNode.querySelector('b').classList.add('hidden');
                cont++;
            }
        });

        if(cont == inputs.length){
            document.getElementById('correo-resumen').textContent = correo;
            document.getElementById('nombre-resumen').textContent = nombre;
            document.getElementById('apellidos-resumen').textContent = apellidos;
            document.getElementById('documento-resumen').textContent = documento;
            document.getElementById('telefono-resumen').textContent = telefono;

            document.getElementById('dni-responsable-actual').value = document.getElementById('documento').value;
            document.getElementById('nombre-responsable-actual').value =
                document.getElementById('nombre').value + " " + document.getElementById('apellidos').value;

            document.getElementById('identificacion').querySelector('.contenido1').classList.add('hidden');
            document.getElementById('identificacion').querySelector('.contenido2').classList.remove('hidden');

            document.getElementById('envio').querySelector('.contenido1').classList.remove('hidden');

            //ACTUALIZACIÓN DE DOCUMENTO Y/O TELEFONO DE USUARIO
            $.ajax({
                url: 'UsuarioController',
                type: 'POST',
                data: { action:"editar-datos-identificacion", id: id, correo: correo, documento: documento, telefono: telefono, password: password},
                success: function(response) {
                    switch (response) {
                        case "success":
                            break;
                        case "fail":
                            console.log("Hubo un error en la actualización de datos!");
                            break;
                    }
                },
                error: function() {
                    console.log("Hubo un error en el Ajax de actualización de datos!");
                }
            });
        }
    }
    else if(e.target.dataset.metodo){
        const metodo = e.target.dataset.metodo;
        switch(metodo){
            case "domicilio":
                document.getElementById('metodo-domicilio').classList.add('metodo-activo');
                document.getElementById('metodo-tienda').classList.remove('metodo-activo');
                document.getElementById('contenido-domicilio').classList.remove('hidden');
                document.getElementById('contenido-tienda').classList.add('hidden');
                document.getElementById('costo-monto-pedido').textContent = '5.00';
                document.getElementById('metodo-envio').value = 2;
                calcultarTotalPedido();
                break;
            case "tienda":
                document.getElementById('metodo-tienda').classList.add('metodo-activo');
                document.getElementById('metodo-domicilio').classList.remove('metodo-activo');
                document.getElementById('contenido-tienda').classList.remove('hidden');
                document.getElementById('contenido-domicilio').classList.add('hidden');
                document.getElementById('costo-monto-pedido').textContent = '0.00';
                document.getElementById('metodo-envio').value = 1;
                calcultarTotalPedido();
                break;
        }
    }
    else if(e.target.dataset.mapa){
        document.getElementById('bg-black-wall').classList.remove('hidden');
        document.getElementById('popup-mapa').classList.remove('hidden');
    }
    else if(e.target.dataset.fecha) {
        document.getElementById('input-fecha-entrega').focus();
    }
    else if(e.target.dataset.inputfecha) {
        e.target.addEventListener('change', function(){
            seteoHorarioMinimo();
            document.getElementById('fecha-formateada').textContent = calcularFechaEntrega(e.target);
            document.getElementById('fecha').classList.add('hidden');
            document.getElementById('fecha-resumen').classList.remove('hidden');
        });
    }
    else if(e.target.dataset.cambiarfecha) {
        document.getElementById('fecha').classList.remove('hidden');
        document.getElementById('fecha-resumen').classList.add('hidden');
        document.getElementById('input-fecha-entrega').focus();
    }
    else if(e.target.dataset.abrircambioresponsable) {
        document.getElementById('bg-black-wall').classList.remove('hidden');
        document.getElementById('popup-cambio-responsable').classList.remove('hidden');
    }
    else if(e.target.dataset.cambiarresponsable) {
        const nuevoNombre = document.getElementById('nombre-responsable-nuevo').value;
        const nuevoDNI = document.getElementById('dni-responsable-nuevo').value;
        document.getElementById('dni-responsable-actual').value = nuevoDNI;
        document.getElementById('nombre-responsable-actual').value = nuevoNombre;
        cerrarPopups();
    }
    else if(e.target.dataset.pago) {
        const metodos = [...document.getElementById('envio-metodos').querySelectorAll('.metodo')];
        let currentMetodo = '';
        let isMetodoActivo = false;
        let contadorCampos = 0;

        metodos.forEach(metodo => {
            if(metodo.classList.contains('metodo-activo')) {
                currentMetodo = metodo.id;
                isMetodoActivo = true;
                contadorCampos++;
            }
        });

        if(isMetodoActivo) {
            document.getElementById('campo-fail-metodos').classList.add('hidden');

            switch(currentMetodo) {
                case 'metodo-domicilio':
                    const direccion = document.getElementById('direccion-domicilio').value;
                    if(direccion === '') {
                        document.getElementById('direccion-domicilio-fail').classList.remove('hidden');
                    }
                    else {
                        document.getElementById('direccion-domicilio-fail').classList.add('hidden');
                        document.getElementById('modalidad-resumen').textContent = 'ENTREGA A DOMICILIO'
                        document.getElementById('direccion-resumen').textContent = direccion;
                        contadorCampos++;
                    }
                    break;
                case 'metodo-tienda':
                    document.getElementById('modalidad-resumen').textContent = 'RECOJO EN TIENDA'
                    document.getElementById('direccion-resumen').textContent = 'bodega MARISOL - Calle García Rada 341';
                    contadorCampos++;
                    break;
            }
        }
        else {
            document.getElementById('campo-fail-metodos').classList.remove('hidden');
        }

        const date = document.getElementById('input-fecha-entrega').value;

        if(date === '') {
            document.getElementById('fecha-entrega-fail').classList.remove('hidden');
        }
        else {
            document.getElementById('fecha-entrega-fail').classList.add('hidden');
            document.getElementById('fecha-dia-resumen').textContent = calcularFechaEntrega(document.getElementById('input-fecha-entrega'));
            document.getElementById('fecha-hora-resumen').textContent = document.getElementById('hora').value;
            contadorCampos++;
        }

        if(contadorCampos === 3) {
            document.getElementById('precio-pago').value = document.getElementById('total-monto-pedido').textContent;

            document.getElementById('envio').querySelector('.contenido1').classList.add('hidden');
            document.getElementById('envio').querySelector('.contenido2').classList.remove('hidden');
            document.getElementById('pago').querySelector('.contenido1').classList.remove('hidden');
            document.getElementById('pago').querySelector('.contenido2').classList.add('hidden');
            document.getElementById('btn-finalizar').classList.remove('hidden');
        }
    }
    else if(e.target.dataset.cambiarenvio) {
        document.getElementById('envio').querySelector('.contenido1').classList.remove('hidden');
        document.getElementById('envio').querySelector('.contenido2').classList.add('hidden');
        document.getElementById('pago').querySelector('.contenido1').classList.add('hidden');
        document.getElementById('pago').querySelector('.contenido2').classList.remove('hidden');
        document.getElementById('btn-finalizar').classList.add('hidden');
    }
    else if(e.target.dataset.comprobante) {
        const btnBoleta = document.getElementById('comprobante-boleta');
        const btnFactura = document.getElementById('comprobante-factura');

        switch(e.target.dataset.comprobante) {
            case "boleta":
                btnBoleta.classList.add('btn-activo');
                btnBoleta.classList.remove('btn-pasivo');
                btnFactura.classList.remove('btn-activo');
                btnFactura.classList.add('btn-pasivo');
                document.getElementById('numero-ruc').disabled = true;
                document.getElementById('numero-ruc').value = '';
                document.getElementById('tipo-comprobante').value = 'BOLETA';
                break;
            case "factura":
                btnFactura.classList.add('btn-activo');
                btnFactura.classList.remove('btn-pasivo');
                btnBoleta.classList.remove('btn-activo');
                btnBoleta.classList.add('btn-pasivo');
                document.getElementById('numero-ruc').disabled = false;
                document.getElementById('tipo-comprobante').value = 'FACTURA';
                break;
        }
    }
    else if(e.target.dataset.finalizar){
        const inputs = document.getElementById('pago').querySelectorAll('input');

        [...inputs].forEach(input => {
            console.log(input);
            if(input.value === ''){
                input.parentNode.querySelector('b').classList.remove('hidden');
            }
            else {
                input.parentNode.querySelector('b').classList.add('hidden');
            }
        });
    }
    else if(e.target.dataset.compraexito) {
        cerrarPopups();
        window.location.href = "resumencompra.jsp";
    }
    else if(e.target.dataset.abrireditardatos) {
        document.getElementById('bg-black-wall').classList.remove('hidden');
        document.getElementById('popup-editar-datos').classList.remove('hidden');
    }
    else if(e.target.dataset.editardatos) {
        const idUsuario = document.getElementById('id-editar-datos').value;
        const correo = document.getElementById('correo-editar-datos').value;
        const documento = document.getElementById('documento-editar-datos').value;
        const telefono = document.getElementById('telefono-editar-datos').value;
        const password = document.getElementById('password-editar-datos').value;

        if(password !== '') {
            $.ajax({
                url: 'UsuarioController',
                type: 'POST',
                data: { action:"editar-datos", id: idUsuario, correo: correo, documento: documento, telefono: telefono, password: password},
                success: function(response) {
                    switch (response) {
                        case "success":
                            e.target.parentNode.querySelector('.password-fail').classList.add('hidden');
                            window.location.href = "perfil.jsp";
                            break;
                        case "fail":
                            e.target.parentNode.querySelector('.password-editar-datos').focus();
                            e.target.parentNode.querySelector('.password-fail').classList.remove('hidden');
                            break;
                    }
                },
                error: function() {
                    console.log("Hubo un error!");
                }
            });
        }
        else {
            e.target.parentNode.querySelector('.password-editar-datos').focus();
            e.target.parentNode.querySelector('.ad-editar-datos').classList.add('spot');
        }
    }
    else if(e.target.dataset.crearpdf) {
        html2canvas(document.querySelector("#contenedor-boleta")).then(canvas => {
            var img = canvas.toDataURL("image/png");
            var doc = new jspdf();
            //doc.addImage(img,'PNG',-63,15,335,210);
            doc.addImage(img,'PNG',19,13,175,145);
            doc.save(`marisolComprobante_${document.getElementById('comprobante-codigo-unico').textContent}.pdf`);
        });
    }
    else if(e.target.dataset.crearpdfdetalle) {
        html2canvas(document.querySelector("#paneles")).then(canvas => {
            var img = canvas.toDataURL("image/png");
            var doc = new jspdf();
            //doc.addImage(img,'PNG',-63,15,335,210);
            doc.addImage(img,'PNG',-32,13,275,115);
            doc.save(`marisolComprobante_${document.getElementById('comprobante-codigo-unico').textContent}.pdf`);
        });
    }
});



function calcularTotal() {
    const productos = document.getElementsByClassName('producto');
    let totalPrecio = 0;
    for(let i = 0; i < productos.length; i++){
        totalPrecio += parseFloat(productos.item(i).querySelector('.subtotal').querySelector('span').textContent);
    }
    document.getElementById('subtotal').textContent = `S/${totalPrecio.toFixed(2)}`;
    document.getElementById('total').textContent = `S/${totalPrecio.toFixed(2)}`;
}

function calcultarTotalPedido() {
    const subtotal = parseFloat(document.getElementById('subtotal-monto-pedido').textContent);
    const igv = parseFloat(document.getElementById('igv-monto-pedido').textContent);
    const envio = parseFloat(document.getElementById('costo-monto-pedido').textContent);
    document.getElementById('total-monto-pedido').textContent = `${(subtotal + igv + envio).toFixed(2)}`;
}

function seteoFechaMinima() {
    document.getElementById('input-fecha-entrega').min = new Date().toISOString().split('T')[0];
}

function seteoHorarioMinimo() {
    const date = new Date();
    const day = String(date.getDate()).padStart(2,'0');
    const month = String(date.getUTCMonth() + 1).padStart(2, '0');
    const year = date.getUTCFullYear();

    const fechaActual = `${year}-${month}-${day}`;
    const inputFecha = document.getElementById('input-fecha-entrega').value;

    const selectHorarios = document.getElementById('hora');
    const horarioActual = new Date().toLocaleTimeString('es-PE', {hour12: false});


    console.log(fechaActual);
    console.log(inputFecha);

    if(fechaActual === inputFecha) {
        for(let i = 0; i < selectHorarios.options.length; i++) {
            const option = selectHorarios.options[i];
            if(option.value < horarioActual) {
                option.disabled = true;
            }
            else {
                option.selected = true;
                return;
            }
        }
    }
    else {
        for(let i = 0; i < selectHorarios.options.length; i++) {
            const option = selectHorarios.options[i];
            option.disabled = false;
            if(i == 0) { option.selected = true; }
        }
    }
}

function calcularFechaEntrega(element) {

    const selectedDate = element.value;
    const date = new Date(selectedDate + "T00:00:00Z");

    const day = date.getUTCDate();
    const month = new Intl.DateTimeFormat('es', { month: 'long'}).format(date);
    const year = date.getUTCFullYear();

    const daysOfWeek = ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];
    const dayOfWeek = daysOfWeek[date.getUTCDay()];
    const formattedDate = `${dayOfWeek}, ${day} de ${month} del ${year}`;

    return formattedDate;
}

function cerrarPopups() {
    (document.getElementById('bg-black-wall')) ? document.getElementById('bg-black-wall').classList.add('hidden') : '';
    (document.getElementById('bg-black-wall-finalizacion')) ? document.getElementById('bg-black-wall-finalizacion').classList.add('hidden') : '';

    [...document.getElementsByClassName('popup')].forEach(popup => {
        popup.classList.add('hidden');
    });
}

if(document.getElementById('main-pedido')){
    seteoFechaMinima();

    window.addEventListener("beforeunload", function(event) {
        const mensaje = "¿Seguro que deseas abandonar esta página? Todos los datos no guardados se perderán.";
        event.returnValue = mensaje;
        return mensaje;
    });
}

if(document.getElementById('main-productos')) {
    const productoBuscado = document.getElementById('producto-buscado-id').textContent;
    filtrarPorBusqueda(productoBuscado);

}

function filtrarPorBusqueda(producto) {
    const productoBuscado = producto.toLowerCase();
    const productos = document.getElementsByClassName('producto');

    for(let i = 0; i < productos.length; i++){
        if(productos[i].querySelector('#categoria').textContent.toLowerCase().includes(productoBuscado) ||
            productos[i].querySelector('#nombre-producto').textContent.toLowerCase().includes(productoBuscado) ||
            productos[i].querySelector('#marca-producto').textContent.toLowerCase().includes(productoBuscado)){
            productos[i].classList.remove('hidden');
        }
        else {
            productos[i].classList.add('hidden');
        }
    }
}
