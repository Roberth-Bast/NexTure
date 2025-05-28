// ItemCarrito.java
package com.productos.negocio;

public class ItemCarrito {
    private Product producto;
    private int cantidad;
    
    public ItemCarrito(Product producto, int cantidad) {
        this.producto = producto;
        this.cantidad = cantidad;
    }
    
    // Getters y Setters
    public Product getProducto() { return producto; }
    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }
}