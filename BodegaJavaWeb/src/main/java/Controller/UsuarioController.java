package Controller;

import Config.Encryptor;
import Entity.Usuario;
import Model.UsuarioModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})
public class UsuarioController extends HttpServlet {

    UsuarioModel model = new UsuarioModel();
    Encryptor encryptor = new Encryptor();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = (String)request.getParameter("action");
        String usuarioId = request.getParameter("usuarioid");
        
        switch(action){
            case "logout":
                request.getSession().removeAttribute("usuario");
                request.getSession().removeAttribute("carrito");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "delete":
                if(model.eliminarUsuario(Integer.parseInt(usuarioId))) {
                    request.getRequestDispatcher("admin/admin_usuarios.jsp").forward(request, response);
                }
                else {
                    request.getRequestDispatcher("admin/admin_usuarios.jsp").forward(request, response);
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");

        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String usuarioTipo = (request.getParameter("usuario-tipo") != null) ? (request.getParameter("usuario-tipo")) : "CLIENTE";
        String correo = request.getParameter("correo");
        String pass = request.getParameter("password");
        String passEncode = "";
        String documento = request.getParameter("documento");
        String telefono = request.getParameter("telefono");

        try {
            if(pass != null){
                passEncode = encryptor.encryptString(pass);
            }
        }
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        HttpSession misesion = request.getSession();

        switch(action){
            case "login":
                Usuario usuario = model.login(correo, passEncode);

                if(usuario.getCorreo() != null){
                    misesion.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                }
                else {
                    request.getRequestDispatcher("productos.jsp?login=fail").forward(request, response);
                }
                break;
            case "register":
                if(model.registrar(usuarioTipo, nombre, apellido, correo, passEncode, 1, documento, telefono)){
                    Usuario usuarioRegister = model.login(correo, passEncode);
                    misesion.setAttribute("usuario", usuarioRegister);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                }
                else{
                    request.getRequestDispatcher("productos.jsp?register=fail").forward(request, response);
                }
                break;
            case "editar-datos":
                response.setContentType("text/plain");
                if (model.passValidation(Integer.parseInt(id), passEncode)) {
                    response.getWriter().write("success");
                    if(model.editarDatosPerfil(Integer.parseInt(id), documento, telefono, passEncode)) {
                        Usuario usuarioEditar = model.login(correo, passEncode);
                        misesion.setAttribute("usuario", usuarioEditar);
                    }
                }
                else {
                    response.getWriter().write("fail");
                }
                break;
            case "editar-datos-identificacion":
                response.setContentType("text/plain");
                if (model.passValidation(Integer.parseInt(id), pass)) {
                    response.getWriter().write("success");
                    if(model.editarDatosPerfil(Integer.parseInt(id), documento, telefono, pass)) {
                        Usuario usuarioEditar = model.login(correo, pass);
                        misesion.setAttribute("usuario", usuarioEditar);
                    }
                }
                else {
                    response.getWriter().write("fail");
                }
                break;
            case "register-admin":
                if(model.registrar(usuarioTipo, nombre, apellido, correo, passEncode, 1, documento, telefono)){
                    request.getRequestDispatcher("admin/admin_usuarios.jsp").forward(request, response);
                }
                else{
                    request.getRequestDispatcher("admin/admin_usuarios_agregar.jsp?invalid=true").forward(request, response);
                }
                break;
            case "editar-admin":
                if(model.editarUsuario(Integer.parseInt(id), nombre, apellido, correo, documento, telefono)){
                    request.getRequestDispatcher("admin/admin_usuarios.jsp").forward(request, response);
                }
                else{
                    request.getRequestDispatcher("admin/admin_usuarios_editar.jsp?usuarioid="+id).forward(request, response);
                }
                break;
        }
    }

    public Usuario obtenerUsuario(int id) {
        return model.obtenerUsuario(id);
    }

    public List<Usuario> obtenerUsuarios() {
        return model.obtenerUsuarios();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
