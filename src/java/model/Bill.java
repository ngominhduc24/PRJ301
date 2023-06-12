/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author ASUS PC
 */
public class Bill extends ArrayList<Product> {

    public Bill(int initialCapacity) {
        super(initialCapacity);
    }

    public Bill() {
        super();
    }

    public Bill(List<Product> products) {
        super();
        this.addAll(products);
    }

    public Bill(Collection<? extends Product> c) {
        super(c);
    }

    public int getTotalPrice() {
        int total = 0;
        for (Product product : this) {
            total += product.getPrice();
        }
        return total;
    }

    public int getTotalQuantity() {
        int total = 0;
        for (Product product : this) {
            total += product.getQuantity();
        }
        return total;
    }

    public void addProduct(Product product) {
        for (Product p : this) {
            if (p.getProductID() == product.getProductID()) {
                p.setQuantity(p.getQuantity() + product.getQuantity());
                return;
            }
        }
        this.add(product);
    }

    public void removeProduct(int id) {
        for (Product p : this) {
            if (p.getProductID() == id) {
                this.remove(p);
                return;
            }
        }
    }

    public List<Product> getProducts() {
        return this;
    }

}
