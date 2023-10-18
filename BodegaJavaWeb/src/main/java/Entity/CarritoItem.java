package Entity;

public class CarritoItem {

    private int id;
    private int cantidad;

    public CarritoItem(int id) {
        this.id = id;
        this.cantidad = 1;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
