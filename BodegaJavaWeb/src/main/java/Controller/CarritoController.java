package Controller;

import Entity.Carrito;
import Entity.CarritoItem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CarritoController", value = "/CarritoController")
public class CarritoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = (String) request.getParameter("action");
        int idProducto = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        Carrito carrito = (Carrito) session.getAttribute("carrito");

        switch(action){
            case "agregar":
                if(carrito == null) {
                    carrito = new Carrito();
                    session.setAttribute("carrito", carrito);
                }
                carrito.agregar(new CarritoItem(idProducto));
                break;
            case "add":
                carrito.add(idProducto);
                break;
            case "sub":
                carrito.sub(idProducto);
                break;
            case "remove":
                carrito.remove(idProducto);
                break;
        }
    }
}