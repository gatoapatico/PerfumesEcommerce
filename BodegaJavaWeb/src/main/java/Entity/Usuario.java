package Entity;

public class Usuario {
    private int id;
    private String usuarioTipo;
    private String nombre;
    private String apellido;
    private String correo;
    private String password;
    private int documentoTipo;
    private String documentoNumero;
    private String telefono;

    public Usuario() {
    }

    public Usuario(int id, String usuarioTipo, String nombre, String apellido, String correo, String password, int documentoTipo, String documentoNumero, String telefono) {
        this.id = id;
        this.usuarioTipo = usuarioTipo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.password = password;
        this.documentoTipo = documentoTipo;
        this.documentoNumero = documentoNumero;
        this.telefono = telefono;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuarioTipo() {
        return usuarioTipo;
    }

    public void setUsuarioTipo(String usuarioTipo) {
        this.usuarioTipo = usuarioTipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getDocumentoTipo() {
        return documentoTipo;
    }

    public void setDocumentoTipo(int documentoTipo) {
        this.documentoTipo = documentoTipo;
    }

    public String getDocumentoNumero() {
        return documentoNumero;
    }

    public void setDocumentoNumero(String documentoNumero) {
        this.documentoNumero = documentoNumero;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
