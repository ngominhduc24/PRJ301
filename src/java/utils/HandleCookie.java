/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dal.ProductDAO;
import java.util.ArrayList;
import java.util.List;

import model.OrderDetail;
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

    public static List<OrderDetail> CookieToOrderDetail(String cookie, int orderID) {
        String[] listProductString = cookie.split("/");
        List<OrderDetail> OrderDetails = new ArrayList<>();
        for (String productString : listProductString) {
            String[] item = productString.split(":");
            try {
                int productID = Integer.parseInt(item[0]);
                int quantity = Integer.parseInt(item[1]);
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderID(orderID);
                orderDetail.setProductID(productID);
                orderDetail.setQuantity(quantity);
                OrderDetails.add(orderDetail);

            } catch (Exception e) {
                return null;
            }
        }
        return OrderDetails;
    }

}
