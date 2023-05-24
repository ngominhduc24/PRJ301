/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import model.Account;

/**
 *
 * @author ASUS PC
 */
public class AccountDAO {
    public Account checkAccount(String email, String password) {
        String sql = "SELECT * FROM Account WHERE email = ? AND password = ?";
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccountID(rs.getInt("accountID"));
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                account.setName(rs.getString("name"));
                account.setPhone(rs.getString("phone"));
                account.setAddress(rs.getString("address"));
                account.setRole(rs.getInt("role"));
                return account;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
}
