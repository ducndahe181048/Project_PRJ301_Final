/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class AccountDAO extends DBContext {
    
    public List<Account> getAll() {
        List<Account> list = new ArrayList<>();
        try {
            String strSelect = "select * from Account";
            PreparedStatement st = connection.prepareStatement(strSelect);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getString("username"), rs.getString("password"), rs.getString("displayname"), rs.getString("email"), rs.getTimestamp("createAt"));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Account check(String username, String password) {
        String sql = "Select * From Account Where username = ? And password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                Account a = new Account(rs.getString("username"), rs.getString("password"), rs.getString("displayname"), rs.getString("email"), rs.getTimestamp("createAt"));
                return a;
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Account getAccountByUsername(String username) {
        String sql = "SELECT * FROM Account WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getString("username"), rs.getString("password"), rs.getString("displayname"), rs.getString("email"), rs.getTimestamp("createAt"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void createAccount(Account a) {
        String sql = "Insert into Account(username, password, displayname, email) values(?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setString(3, a.getDisplayname());
            st.setString(4, a.getEmail());
            st.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
    }
    
}
