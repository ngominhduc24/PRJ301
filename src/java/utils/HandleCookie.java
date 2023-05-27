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
        String[] listProductID = cookie.split("/");
        List<Product> listProduct = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();
        for (String productID : listProductID) {
            // check if productID is valid or not
            if (productID.equals("-1"))
                continue;
            Product product = productDAO.getProductByID(productID);

            // count quantity of each product
            int quantity = 0;
            for (int i = 0; i < listProductID.length; i++) {
                if (listProductID[i].equals(productID)) {
                    quantity++;
                    listProductID[i] = "-1";
                }
            }
            product.setQuantity(quantity);

            // add product to list
            if (product != null)
                listProduct.add(product);
        }
        return listProduct;
    }

}
