package Model;

import Config.db;
import Entity.DetallePedido;
import Entity.Pedido;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PedidoModel {

    private Connection connection;

    public PedidoModel() {
        db con = new db();
        connection = con.Conexion();
    }

    public boolean crearPedido(String fechaPedido, int usuarioId, int metodoEnvio, String direccionEntrega,
                            String fechaEntrega, String horaEntrega, String responsableDocumento, String responsableNombre,
                            String reciboTipo, String ruc, String numeroTarjetaPago, double subtotalPago,
                               double envioPago, double igvPago, double totalPago, String codigoUnico, String estado) {

        String sql = "INSERT INTO pedido VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fechaPedido);
            statement.setInt(2, usuarioId);
            statement.setInt(3, metodoEnvio);
            statement.setString(4, direccionEntrega);
            statement.setString(5, fechaEntrega);
            statement.setString(6, horaEntrega);
            statement.setString(7, responsableDocumento);
            statement.setString(8, responsableNombre);
            statement.setString(9, reciboTipo);
            statement.setString(10, ruc);
            statement.setString(11, numeroTarjetaPago);
            statement.setDouble(12, subtotalPago);
            statement.setDouble(13, envioPago);
            statement.setDouble(14, igvPago);
            statement.setDouble(15, totalPago);
            statement.setString(16, codigoUnico);
            statement.setString(17, estado);
            return statement.executeUpdate() > 0;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Pedido obtenerPedido(int pedidoId) {
        String sql = "SELECT * FROM pedido WHERE id = ? LIMIT 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, pedidoId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Pedido pedido = new Pedido();
                pedido.setId(resultSet.getInt("id"));
                pedido.setFecha(resultSet.getString("fecha_pedido"));
                pedido.setUsuarioId(resultSet.getInt("usuario_id"));
                pedido.setMetodoEnvio(resultSet.getInt("metodoenvio_id"));
                pedido.setDireccionEntrega(resultSet.getString("direccion_entrega"));
                pedido.setFechaEntrega(resultSet.getString("fecha_entrega"));
                pedido.setHoraEntrega(resultSet.getString("hora_entrega"));
                pedido.setResponsableDni(resultSet.getString("responsable_dni"));
                pedido.setResponsableNombre(resultSet.getString("responsable_nombre"));
                pedido.setReciboTipo(resultSet.getString("recibo_tipo"));
                pedido.setRuc(resultSet.getString("ruc"));
                pedido.setNumeroTarjetaPago(resultSet.getString("numero_tarjeta_pago"));
                pedido.setSubTotalPago(resultSet.getDouble("subtotal_pago"));
                pedido.setEnvioPago(resultSet.getDouble("envio_pago"));
                pedido.setIgvPago(resultSet.getDouble("igv_pago"));
                pedido.setTotalPago(resultSet.getDouble("total_pago"));
                pedido.setCodigoUnico(resultSet.getString("codigo_recojo"));
                pedido.setEstado(resultSet.getString("estado"));
                return pedido;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Pedido> obtenerPedidos(int usuarioId) {
        List<Pedido> pedidos = new ArrayList<>();
        String sql = "SELECT * FROM pedido WHERE usuario_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, usuarioId);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()) {
                Pedido pedido = new Pedido();
                pedido.setId(resultSet.getInt("id"));
                pedido.setFecha(resultSet.getString("fecha_pedido"));
                pedido.setUsuarioId(resultSet.getInt("usuario_id"));
                pedido.setMetodoEnvio(resultSet.getInt("metodoenvio_id"));
                pedido.setDireccionEntrega(resultSet.getString("direccion_entrega"));
                pedido.setFechaEntrega(resultSet.getString("fecha_entrega"));
                pedido.setHoraEntrega(resultSet.getString("hora_entrega"));
                pedido.setResponsableDni(resultSet.getString("responsable_dni"));
                pedido.setResponsableNombre(resultSet.getString("responsable_nombre"));
                pedido.setReciboTipo(resultSet.getString("recibo_tipo"));
                pedido.setRuc(resultSet.getString("ruc"));
                pedido.setNumeroTarjetaPago(resultSet.getString("numero_tarjeta_pago"));
                pedido.setSubTotalPago(resultSet.getDouble("subtotal_pago"));
                pedido.setEnvioPago(resultSet.getDouble("envio_pago"));
                pedido.setIgvPago(resultSet.getDouble("igv_pago"));
                pedido.setTotalPago(resultSet.getDouble("total_pago"));
                pedido.setCodigoUnico(resultSet.getString("codigo_recojo"));
                pedido.setEstado(resultSet.getString("estado"));
                pedidos.add(pedido);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return pedidos;
    }

    public List<Pedido> obtenerPedidosAll() {
        List<Pedido> pedidos = new ArrayList<>();
        String sql = "SELECT * FROM pedido";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()) {
                Pedido pedido = new Pedido();
                pedido.setId(resultSet.getInt("id"));
                pedido.setFecha(resultSet.getString("fecha_pedido"));
                pedido.setUsuarioId(resultSet.getInt("usuario_id"));
                pedido.setMetodoEnvio(resultSet.getInt("metodoenvio_id"));
                pedido.setDireccionEntrega(resultSet.getString("direccion_entrega"));
                pedido.setFechaEntrega(resultSet.getString("fecha_entrega"));
                pedido.setHoraEntrega(resultSet.getString("hora_entrega"));
                pedido.setResponsableDni(resultSet.getString("responsable_dni"));
                pedido.setResponsableNombre(resultSet.getString("responsable_nombre"));
                pedido.setReciboTipo(resultSet.getString("recibo_tipo"));
                pedido.setRuc(resultSet.getString("ruc"));
                pedido.setNumeroTarjetaPago(resultSet.getString("numero_tarjeta_pago"));
                pedido.setSubTotalPago(resultSet.getDouble("subtotal_pago"));
                pedido.setEnvioPago(resultSet.getDouble("envio_pago"));
                pedido.setIgvPago(resultSet.getDouble("igv_pago"));
                pedido.setTotalPago(resultSet.getDouble("total_pago"));
                pedido.setCodigoUnico(resultSet.getString("codigo_recojo"));
                pedido.setEstado(resultSet.getString("estado"));
                pedidos.add(pedido);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return pedidos;
    }

    public boolean crearDetallePedido(int pedidoId, int productoId, int cantidad, double precio, double subtotal) {
        String sql = "INSERT INTO detallepedido VALUES (null, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, pedidoId);
            statement.setInt(2, productoId);
            statement.setInt(3, cantidad);
            statement.setDouble(4, precio);
            statement.setDouble(5, subtotal);
            if(statement.executeUpdate() > 0) {
                String sqlDisminuir = "UPDATE productos SET stock = stock - ? WHERE id = ?";
                PreparedStatement disminuirStatement = connection.prepareStatement(sqlDisminuir);
                disminuirStatement.setInt(1, cantidad);
                disminuirStatement.setInt(2, productoId);
                return disminuirStatement.executeUpdate() > 0;
            }
            else {
                return false;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<DetallePedido> obtenerDetalles(int pedidoId) {
        List<DetallePedido> detalles = new ArrayList<>();
        String sql = "SELECT * FROM detallepedido WHERE pedido_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, pedidoId);
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()) {
                DetallePedido detalle = new DetallePedido();
                detalle.setId(resultSet.getInt("id"));
                detalle.setPedidoId(resultSet.getInt("pedido_id"));
                detalle.setProductoId(resultSet.getInt("producto_id"));
                detalle.setCantidad(resultSet.getInt("cantidad"));
                detalle.setPrecio(resultSet.getDouble("precio"));
                detalle.setSubtotal(resultSet.getDouble("subtotal"));
                detalles.add(detalle);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return detalles;
    }

    public int obtenerIdPedido(String codigoUnico) {
        String sql = "SELECT * FROM pedido WHERE codigo_recojo = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, codigoUnico);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getInt("id");
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean actualizarEstadoPedido(int idPedido,String estado) {
        String sql = "UPDATE pedido SET estado = ? WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, estado);
            statement.setInt(2, idPedido);
            return statement.executeUpdate() > 0;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
