package com.productos.seguridad;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.productos.datos.Conexion;

public class Usuario {
	private String nombre;
	private int id;
	private Integer perfil;
	private int estadoCivil;
	private String correo;
	private String clave;
	private String cedula;
	private String claveActual;
	
	public String getClaveActual() {
		return claveActual;
	}

	public void setClaveActual(String claveActual) {
		this.claveActual = claveActual;
	}

	public void setPerfil(Integer perfil) {
		this.perfil = perfil;
	}

	public Usuario() {
		// TODO Auto-generated method stub

	}
	
	public Usuario(Integer perfil, int estadoCivil,  String nombre, String cedula, String correo, String clave) {
		super();
		this.nombre = nombre;
		this.perfil = perfil;
		this.estadoCivil = estadoCivil;
		this.correo = correo;
		this.clave = clave;
		this.cedula = cedula;
	}
	
	
	public String getCedula() {
		return cedula;
	}

	public void setCedula(String cedula) {
		this.cedula = cedula;
	}

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPerfil() {
		return perfil;
	}
	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}
	public int getEstadoCivil() {
		return estadoCivil;
	}
	public void setEstadoCivil(int estadoCivil) {
		this.estadoCivil = estadoCivil;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}

	public boolean verificarUsuario(String ncorreo, String nclave)
	{
	boolean respuesta=false;
	String sentencia= "Select * from tb_usuario where correo_us='"+ncorreo+
	"' and clave_us='"+nclave+"';";
	//System.out.print(sentencia);
	try
	{
	ResultSet rs;
	Conexion clsCon=new Conexion();
	rs=clsCon.Consulta(sentencia);
	if(rs.next())
	{
	respuesta=true;
	this.setCorreo(ncorreo);
	this.setClave(nclave);
	this.setPerfil(rs.getInt(2));
	this.setNombre(rs.getString(4));
	}
	else
	{
	respuesta=false;
	rs.close();
	}
	}
	catch(Exception ex)
	{
	System.out.println( ex.getMessage());
	}
	return respuesta;
	}
	
	
	
	public String ingresarCliente()
	{
	String result="";
	Conexion con=new Conexion();
	PreparedStatement pr=null;
	String sql="INSERT INTO tb_usuario (id_per, id_est, nombre_us,"
	+ "cedula_us,correo_us,clave_us) "
	+ "VALUES(?,?,?,?,?,?)";
	try{
	pr=con.getConexion().prepareStatement(sql);
	pr.setInt(1,2);
	pr.setInt(2, this.getEstadoCivil());
	pr.setString(3, this.getNombre());
	pr.setString(4, this.getCedula());
	pr.setString(5, this.getCorreo());
	pr.setString(6, this.getClave());
	if(pr.executeUpdate()==1)
	{
	result="Insercion correcta";
	}
	else
	{
	result="Error en insercion";
	}
	}
	catch(Exception ex)
	{
	result=ex.getMessage();
	System.out.print(result);
	}
	finally{
		try
		{
		 pr.close();
		 con.getConexion().close();
		}
		catch(Exception ex)
		{
		 System.out.print(ex.getMessage());
		}
		}
		return result;
	}
	
	public String ingresarEmpleado()
	{
	String result="";
	Conexion con=new Conexion();
	PreparedStatement pr=null;
	String sql="INSERT INTO tb_usuario (id_per, id_est, nombre_us,"
	+ "cedula_us,correo_us,clave_us) "
	+ "VALUES(?,?,?,?,?,?)";
	try{
	pr=con.getConexion().prepareStatement(sql);
	pr.setInt(1,2);
	pr.setInt(2, this.getEstadoCivil());
	pr.setString(3, this.getNombre());
	pr.setString(4, this.getCedula());
	pr.setString(5, this.getCorreo());
	pr.setString(6, this.getClave());
	if(pr.executeUpdate()==1)
	{
	result="Insercion correcta";
	}
	else
	{
	result="Error en insercion";
	}
	}
	catch(Exception ex)
	{
	result=ex.getMessage();
	System.out.print(result);
	}
	finally{
		try
		{
		 pr.close();
		 con.getConexion().close();
		}
		catch(Exception ex)
		{
		 System.out.print(ex.getMessage());
		}
		}
		return result;
	}
	
	public static boolean verificarFortalezaClave(String clave) {
        if (clave == null) return false;
        
        // Expresión regular para validar: 8 caracteres, al menos 1 mayúscula, 1 número y 1 carácter especial
        String regex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        return clave.matches(regex);
    }

    // Verifica si la clave no está vacía y tiene longitud mínima de 6 caracteres
    public static boolean verificarClaveValida(String clave) {
        return clave != null && clave.length() >= 6;
    }

    // 
    public static boolean clavesCoinciden(String clave, String repetirClave) {
        if (clave == null || repetirClave == null) return false;
        return clave.equals(repetirClave);
    }

    public static boolean cambiarClave(String nuevaClave, String confirmacionClave) {
        if (!verificarFortalezaClave(nuevaClave)) return false;
        if (!clavesCoinciden(nuevaClave, confirmacionClave)) return false;
        //claveActual = nuevaClave; // Actualizar la clave almacenada
        return true;
    }
	
	
	

}
