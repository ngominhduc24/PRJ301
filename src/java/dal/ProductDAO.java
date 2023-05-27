/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Product;

/**
 *
 * @author ASUS PC
 */
public class ProductDAO {
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product ";
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getInt("Price"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImage(rs.getString("Image"));
                product.setDescription(rs.getString("Description"));
                list.add(product);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Product getProductByID(String id) {
        String sql = "SELECT * FROM Product WHERE ProductID = ?";
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setName(rs.getString("Name"));
                product.setPrice(rs.getInt("Price"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImage(rs.getString("Image"));
                product.setDescription(rs.getString("Description"));
                return product;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (NumberFormatException ex) {
            System.out.println(ex);
        }
        return null;
    }
}
