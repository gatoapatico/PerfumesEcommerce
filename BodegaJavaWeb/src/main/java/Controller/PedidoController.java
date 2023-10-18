package Controller;

import Entity.*;
import Model.PedidoModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "PedidoController", value = "/PedidoController")
public class PedidoController extends HttpServlet {

    PedidoModel model = new PedidoModel();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String admin = (String) request.getParameter("admin");
        int pedidoId = Integer.parseInt((String)request.getParameter("pedidoid"));
        Pedido pedido = model.obtenerPedido(pedidoId);
        HttpSession session = request.getSession();
        session.setAttribute("pedido", pedido);

        if(admin != null) {
            request.getRequestDispatcher("admin/admin_pedidos_detalle.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("detallepedido.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Carrito carrito = (Carrito) request.getSession().getAttribute("carrito");
        ProductoController cProductos = new ProductoController();
        HttpSession session = request.getSession();

        String action = (String) request.getParameter("action");
        String estado = (request.getParameter("estado-pedido") != null) ? request.getParameter("estado-pedido") : "EN PROCESO";

        switch (action) {
            case "realizar-pedido":
                String fechaPedido = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
                int usuarioId = Integer.parseInt((String) request.getParameter("usuario-id"));
                int metodoEnvio = Integer.parseInt((String) request.getParameter("metodo-envio"));
                String direccionEntrega = (metodoEnvio == 1) ? "bodega Marisol, Calle García Rada 341" : (String) request.getParameter("direccion-entrega");
                String fechaEntrega = (String) request.getParameter("fecha-entrega");
                String horaEntrega = (String) request.getParameter("hora-entrega");
                String responsableDocumento = (String) request.getParameter("responsable-documento");
                String responsableNombre = (String) request.getParameter("responsable-nombre");
                String numeroTarjetaPago = (String) request.getParameter("numero-tarjeta-pago");
                double totalPago = Double.parseDouble((String) request.getParameter("total-pago"));
                String codigoUnico = UUID.randomUUID().toString().replace("-","").substring(0, 10);

                double subtotalPago = (metodoEnvio == 1) ? totalPago * 0.82 : (totalPago - 5.00) * 0.82;
                double envioPago = (metodoEnvio == 1) ? 0.00 : 5.00;
                double igvPago = (metodoEnvio == 1) ? totalPago * 0.18 : (totalPago - 5.00) * 0.18;

                String reciboTipo = (String) request.getParameter("tipo-comprobante");
                String ruc = (String) request.getParameter("numero-ruc");

                if(model.crearPedido(fechaPedido, usuarioId, metodoEnvio, direccionEntrega, fechaEntrega, horaEntrega,
                        responsableDocumento, responsableNombre, reciboTipo, ruc, numeroTarjetaPago, subtotalPago,
                        envioPago, igvPago, totalPago, codigoUnico, estado)) {

                    int idPedido = model.obtenerIdPedido(codigoUnico);

                    for(CarritoItem item : carrito.obtenerItems()) {
                        Producto producto = cProductos.obtenerProducto(item.getId());
                        int productoId = producto.getId();
                        int cantidad = item.getCantidad();
                        double productoPrecio = producto.getPrecio();
                        double subtotal = cantidad * productoPrecio;
                        model.crearDetallePedido(idPedido, productoId, cantidad, productoPrecio, subtotal);
                    }

                    request.getSession().removeAttribute("carrito");

                    Pedido pedido = new Pedido(idPedido, fechaPedido, usuarioId, metodoEnvio, direccionEntrega, fechaEntrega,
                            horaEntrega, responsableDocumento, responsableNombre, reciboTipo, ruc, numeroTarjetaPago,
                            subtotalPago, envioPago, igvPago, totalPago, codigoUnico, estado);

                    session.setAttribute("pedido", pedido);

                    request.getRequestDispatcher("success.jsp").forward(request, response);
                }
                else {
                    request.getRequestDispatcher("pedido.jsp").forward(request, response);
                }
                break;
            case "actualizar-estado":
                int pedidoId = Integer.parseInt(request.getParameter("pedido-id"));
                if(model.actualizarEstadoPedido(pedidoId, estado)){
                    Pedido pedido = (Pedido) request.getSession().getAttribute("pedido");
                    pedido.setEstado(estado);
                    session.setAttribute("pedido", pedido);
                    request.getRequestDispatcher("admin/admin_pedidos_detalle.jsp?pedidoid="+pedidoId).forward(request, response);
                }
                else {
                    request.getRequestDispatcher("admin/admin_pedidos_detalle.jsp?pedidoid="+pedidoId).forward(request, response);
                }
                break;
        }
    }

    public List<Pedido> obtenerPedidos(int usuarioId) {
        return model.obtenerPedidos(usuarioId);
    }

    public List<Pedido> obtenerPedidosAll() {
        return model.obtenerPedidosAll();
    }

    public List<DetallePedido> obtenerDetalles(int pedidoId) {
        return model.obtenerDetalles(pedidoId);
    }
}