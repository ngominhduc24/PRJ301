/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dal.ProductDAO;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author ASUS PC
 */
public class HandleCookie {

    public static List<Product> CookieToProduct(String cookie) {
        String[] listProductString = cookie.split("/");
        List<Product> listProduct = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        for (String productString : listProductString) {
            String[] item = productString.split(":");
            String productID = item[0];
            int quantity = Integer.parseInt(item[1]);
            Product product = productDAO.getProductByID(productID);
            product.setQuantity(quantity);
            listProduct.add(product);
        }
        return listProduct;
    }

}
