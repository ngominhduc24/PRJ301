/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS PC
 */
public class OrderDetail {
    private int orderID;
    private int productID;
    private int quantity;
    private Product product;

    public OrderDetail() {
    }

    public OrderDetail(int orderID, int productID, int quantity) {
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public model.Product getProduct() {
        return product;
    }

    public void setProduct(model.Product product) {
        this.product = product;
    }

    public int getTotalPrice() {
        return product.getPrice() * quantity;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "orderID=" + orderID + ", productID=" + productID + ", quantity=" + quantity + '}';
    }
}
