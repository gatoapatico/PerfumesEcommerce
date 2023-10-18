package Entity;

import java.io.Serializable;

public class Producto implements Serializable  {
  private int id;
  private String nombre;
  private String categoria;
  private String imagen;
  private String descripcion;
  private String proveedor;
  private double precio;
  private int stock;

  public Producto() {
  }

  public Producto(int id, String nombre, String categoria, String imagen, String descripcion, String proveedor, double precio, int stock) {
    this.id = id;
    this.nombre = nombre;
    this.categoria = categoria;
    this.imagen = imagen;
    this.descripcion = descripcion;
    this.proveedor = proveedor;
    this.precio = precio;
    this.stock = stock;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getNombre() {
    return nombre;
  }

  public void setNombre(String nombre) {
    this.nombre = nombre;
  }

  public String getCategoria() {
    return categoria;
  }

  public void setCategoria(String categoria) {
    this.categoria = categoria;
  }

  public String getImagen() {
    return imagen;
  }

  public void setImagen(String imagen) {
    this.imagen = imagen;
  }

  public String getDescripcion() {
    return descripcion;
  }

  public void setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  public String getProveedor() {
    return proveedor;
  }

  public void setProveedor(String proveedor) {
    this.proveedor = proveedor;
  }

  public double getPrecio() {
    return precio;
  }

  public void setPrecio(double precio) {
    this.precio = precio;
  }

  public int getStock() {
    return stock;
  }

  public void setStock(int stock) {
    this.stock = stock;
  }
   
   
}