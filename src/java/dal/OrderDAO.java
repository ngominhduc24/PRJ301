/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Orders;

/**
 *
 * @author ASUS PC
 */
public class OrderDAO {
    public void insertOrder(Orders order) {
        String sql = "INSERT INTO Orders VALUES(?,?,?,?,?)"; // (orderID, accountID, orderDate, address, totalPrice)
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ps.setInt(1, order.getOrderID());
            ps.setInt(2, order.getAccountID());
            ps.setDate(3, order.getOrderDate());
            ps.setString(4, order.getAddress());
            ps.setDouble(5, order.getTotalPrice());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

}
