package Entity;

import java.util.ArrayList;
import java.util.List;

public class Carrito {

    private List<CarritoItem> items;

    public Carrito() {
        this.items = new ArrayList<>();
    }

    public List<CarritoItem> obtenerItems() {
        return items;
    }

    public int contieneItem(int idItem) {
        for(int i = 0; i < items.size(); i++){
            if(items.get(i).getId() == idItem){
                return i;
            }
        }
        return -1;
    }

    public void agregar(CarritoItem item) {
        int currentIndex = contieneItem(item.getId());
        if(currentIndex >= 0){
            int currentCantidad = items.get(currentIndex).getCantidad();
            items.get(currentIndex).setCantidad(currentCantidad + 1);
        }
        else {
            items.add(item);
        }
    }

    public void add(int idProducto) {
        for(CarritoItem item : items) {
            if(item.getId() == idProducto){
                item.setCantidad(item.getCantidad() + 1);
            }
        }
    }

    public void sub(int idProducto) {
        for(CarritoItem item : items) {
            if(item.getId() == idProducto){
                item.setCantidad(item.getCantidad() - 1);
            }
        }
    }

    public void remove(int idProducto) {
        for(int i = 0; i < items.size(); i++) {
            if(items.get(i).getId() == idProducto){
                items.remove(i);
            }
        }
    }
}
