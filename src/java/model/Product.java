/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS PC
 */
public class Product {
    // create table Product (
    // ProductID int not null primary key,
    // Name varchar(50) not null,
    // Price int not null,
    // Description varchar(50) not null,
    // Image varchar(50) not null,
    // CategoryID int not null,
    // foreign key (CategoryID) references Category(CategoryID)
    // );
    private int productID;
    private String name;
    private int price;
    private String description;
    private String image;
    private int categoryID;

    public Product() {
    }

    public Product(int productID, String name, int price, String description, String image, int categoryID) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.description = description;
        this.image = image;
        this.categoryID = categoryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", name=" + name + ", price=" + price + ", description=" + description + ", image=" + image + ", categoryID=" + categoryID + '}';
    }
}
