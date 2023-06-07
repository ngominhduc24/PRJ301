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

import model.Orders;

/**
 *
 * @author ASUS PC
 */
public class OrderDAO {

    public int insertOrder(Orders order) {
        String sql = "INSERT INTO Orders VALUES(?,?,?,?,?)"; // (accountID, orderDate, address, totalPrice,
                                                             // status)
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ps.setInt(1, order.getAccountID());
            ps.setDate(2, order.getOrderDate());
            ps.setString(3, order.getAddress());
            ps.setInt(4, order.getTotalPrice());
            ps.setInt(5, order.getStatus());
            ps.executeUpdate();
            // i want return orderID
            String sql2 = "SELECT MAX(orderID) AS orderID FROM Orders";
            PreparedStatement ps2 = DbContext.getConnection().prepareStatement(sql2);
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                return rs.getInt("orderID");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return -1;
    }

    public List<Integer> getAllOrderIDByAccountID(int accountID) {
        String sql = "SELECT orderID FROM Orders WHERE accountID = ?";
        List<Integer> listOrderID = new ArrayList<>();
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ps.setInt(1, accountID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listOrderID.add(rs.getInt("orderID"));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listOrderID;
    }

}
