/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import model.Category;
import model.Document;

/**
 *
 * @author admin
 */
public class Category_Document_DAO extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "Select * From Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"), rs.getString("description"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insert(Category c) {
        String sql = "Insert into Category(id, name, description) values(?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setString(2, c.getName());
            st.setString(3, c.getDescription());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql1 = "Delete from Document Where cid = ?";
        String sql = "Delete from Category Where id = ?";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            PreparedStatement st = connection.prepareStatement(sql);
            st1.setInt(1, id);
            st.setInt(1, id);
            st1.executeUpdate();
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Category c) {
        String sql = "Update Category Set name = ?, description = ? Where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getDescription());
            st.setInt(3, c.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM Category WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"), rs.getString("description"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public List<Document> getAllDocument() {
        List<Document> list = new ArrayList<>();
        String sql = "Select * From Document";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Document d = new Document();
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                d.setPath(rs.getString("path"));
                d.setUploadBy(rs.getString("uploadBy"));
                d.setUploadAt(rs.getTimestamp("uploadAt"));
                d.setCid(rs.getInt("cid"));
                list.add(d);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Document> getDocumentByCid(int cid) {
        List<Document> list = new ArrayList<>();
        String sql = "Select * From Document Where 1 = 1";
        if (cid != 0) {
            sql += " and cid = " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Document d = new Document();
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                d.setPath(rs.getString("path"));
                d.setUploadBy(rs.getString("uploadBy"));
                d.setUploadAt(rs.getTimestamp("uploadAt"));
                d.setCid(rs.getInt("cid"));
                list.add(d);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public int getCidByDocument(String id) {
        String sql = "Select cid From Document Where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                return rs.getInt("cid");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void insertDocument(Document d) {
        String sql = "Insert into Document(id, name, path, uploadBy, cid) Values(?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getId());
            st.setString(2, d.getName());
            st.setString(3, d.getPath());
            st.setString(4, d.getUploadBy());
            st.setInt(5, d.getCid());
            st.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteDocument(String id) {
        String sql = "Delete from Document Where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateDocument(Document d) {
        String sql = "Update Document Set name = ?, path = ? Where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getName());
            st.setString(2, d.getPath());
            st.setString(3, d.getId());
            st.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
    }

    public Document getDocumentById(String id) {
        String sql = "SELECT * FROM Document WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Document d = new Document();
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                d.setPath(rs.getString("path"));
                d.setUploadBy(rs.getString("uploadBy"));
                d.setUploadAt(rs.getTimestamp("uploadAt"));
                d.setCid(rs.getInt("cid"));
                return d;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Document> search(int cid, Date fromDate, Date toDate) {
        List<Document> list = new ArrayList<>();
        String sql = "Select * From Document Where 1 = 1 ";
        if(fromDate != null) {
            sql += " and uploadAt >= '" + fromDate + "'";
        }
        if(toDate != null) {
            sql += " and uploadAt <= '" + toDate + "'";
        }
        if(cid != 0) {
            sql += " and cid = " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Document d = new Document();
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                d.setPath(rs.getString("path"));
                d.setUploadBy(rs.getString("uploadBy"));
                d.setUploadAt(rs.getTimestamp("uploadAt"));
                d.setCid(rs.getInt("cid"));
                list.add(d);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static void main(String[] args) {
        Category_Document_DAO cd = new Category_Document_DAO();
        Document d = cd.getDocumentById("123123");
        
        System.out.println(d.getUploadBy());
    }
}
