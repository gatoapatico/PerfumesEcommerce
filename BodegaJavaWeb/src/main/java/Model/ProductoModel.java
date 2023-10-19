package Model;

import Config.db;
import Entity.Producto;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class ProductoModel {

    private Connection connection;

    public ProductoModel() {
        db con = new db();
        connection = con.Conexion();
    }

    public List<Producto> obtenerProductos() {
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT * FROM productos";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Producto producto = new Producto();
                producto.setId(resultSet.getInt("id"));
                producto.setNombre(resultSet.getString("nombre"));
                producto.setCategoria(resultSet.getString("categoria"));
                producto.setImagen(resultSet.getBytes("imagen"));
                producto.setDescripcion(resultSet.getString("descripcion"));
                producto.setProveedor(resultSet.getString("proveedor"));
                producto.setPrecio(resultSet.getDouble("precio"));
                producto.setStock(resultSet.getInt("stock"));
                productos.add(producto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productos;
    }

    public Producto obtenerProducto(int id) {
        String sql = "SELECT * FROM productos WHERE id = ? LIMIT 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, Integer.toString(id));
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Producto producto = new Producto();
                producto.setId(resultSet.getInt("id"));
                producto.setNombre(resultSet.getString("nombre"));
                producto.setCategoria(resultSet.getString("categoria"));
                producto.setImagen(resultSet.getBytes("imagen"));
                producto.setDescripcion(resultSet.getString("descripcion"));
                producto.setProveedor(resultSet.getString("proveedor"));
                producto.setPrecio(resultSet.getDouble("precio"));
                producto.setStock(resultSet.getInt("stock"));
                return producto;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean agregarProducto(String nombre, String categoria, byte[] imagen, String descripcion,
            String proveedor, double precio, int stock) {

        String sql = "INSERT INTO productos VALUES(null, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, categoria);
            statement.setBytes(3, imagen);
            statement.setString(4, descripcion);
            statement.setString(5, proveedor);
            statement.setDouble(6, precio);
            statement.setInt(7, stock);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean editarProducto(int id, String nombre, String categoria, byte[] imagen,
            String descripcion, String proveedor, double precio, int stock) {

        String sql = "UPDATE productos SET nombre = ?, categoria = ?, imagen = ?, descripcion = ?,"
                + "proveedor = ?, precio = ?, stock = ? WHERE id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, categoria);
            statement.setBytes(3, imagen);
            statement.setString(4, descripcion);
            statement.setString(5, proveedor);
            statement.setDouble(6, precio);
            statement.setInt(7, stock);
            statement.setInt(8, id);
            System.out.println(imagen);
            System.out.println(nombre);
            return statement.executeUpdate() > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarProducto(int id) {
        String sql = "DELETE FROM productos WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "SELECT imagen FROM productos WHERE id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    try (InputStream inputStream = rs.getBinaryStream(1); BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream); OutputStream outputStream = response.getOutputStream(); BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream)) {
                        int i;
                        while ((i = bufferedInputStream.read()) != -1) {
                            bufferedOutputStream.write(i);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
