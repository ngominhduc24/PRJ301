/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    public Account getAccountByEmail(String email) {
        String sql = "SELECT * FROM Account WHERE email = ?";
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccountID(rs.getInt("accountID"));
                account.setEmail(rs.getString("email"));
                account.setName(rs.getString("name"));
                account.setPhone(rs.getString("phone"));
                account.setAddress(rs.getString("address"));
                return account;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public int getIdByEmail(String email) {
        String sql = "SELECT accountID FROM Account WHERE email = ?";
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("accountID");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    public Account createAccount(Account account) {
        String sql = "INSERT INTO Account(email, password, name, phone, address, role) VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = DbContext.getConnection().prepareStatement(sql);
            ps.setString(1, account.getEmail());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getName());
            ps.setString(4, account.getPhone());
            ps.setString(5, account.getAddress());
            ps.setInt(6, account.getRole());
            ps.executeUpdate();
            return account;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
}
