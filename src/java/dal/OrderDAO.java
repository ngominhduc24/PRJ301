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

    public List<Orders> getAllOrder() {
        String sql = "SELECT * FROM Orders";
        List<Orders> listOrder = new ArrayList<>();
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Orders order = new Orders();
                order.setOrderID(rs.getInt("orderID"));
                order.setAccountID(rs.getInt("accountID"));
                order.setOrderDate(rs.getDate("orderDate"));
                order.setAddress(rs.getString("address"));
                order.setTotalPrice(rs.getInt("totalPrice"));
                order.setStatus(rs.getInt("status"));
                listOrder.add(order);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listOrder;
    }

    public Orders getOrderById(int orderID) {
        String sql = "SELECT * FROM Orders WHERE orderID = ?";
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Orders order = new Orders();
                order.setOrderID(rs.getInt("orderID"));
                order.setAccountID(rs.getInt("accountID"));
                order.setOrderDate(rs.getDate("orderDate"));
                order.setAddress(rs.getString("address"));
                order.setTotalPrice(rs.getInt("totalPrice"));
                order.setStatus(rs.getInt("status"));
                return order;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

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

    public List<Orders> getListOrderByAccountID(int accountID) {
        // get list order by accountID and order by orderDate ascending
        String sql = "SELECT * FROM Orders WHERE accountID = ? ORDER BY orderDate DESC";
        List<Orders> listOrder = new ArrayList<>();
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ps.setInt(1, accountID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Orders order = new Orders();
                order.setOrderID(rs.getInt("orderID"));
                order.setAccountID(rs.getInt("accountID"));
                order.setOrderDate(rs.getDate("orderDate"));
                order.setAddress(rs.getString("address"));
                order.setTotalPrice(rs.getInt("totalPrice"));
                order.setStatus(rs.getInt("status"));
                listOrder.add(order);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return listOrder;
    }

    public boolean updateOrderStatus(int orderID, int status) {
        String sql = "UPDATE Orders SET status = ? WHERE orderID = ?";
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, orderID);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public boolean updateOrder(Orders order) {
        // update address and orderDate and totalPrice
        String sql = "UPDATE Orders SET address = ?, orderDate = ?, totalPrice = ? WHERE orderID = ?";
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ps.setString(1, order.getAddress());
            ps.setDate(2, order.getOrderDate());
            ps.setInt(3, order.getTotalPrice());
            ps.setInt(4, order.getOrderID());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public boolean deleteOrder(int orderID) {
        String sql = "DELETE FROM Orders WHERE orderID = ?";
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ps.setInt(1, orderID);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

}