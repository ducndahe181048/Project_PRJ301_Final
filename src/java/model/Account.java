/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class Account {
    private String username;
    private String password;
    private String displayname;
    private String email;
    private Timestamp createAt;

    public Account() {
    }
    
    public Account(String username, String password, String displayname, String email) {
        this.username = username;
        this.password = password;
        this.displayname = displayname;
        this.email = email;
    }

    public Account(String username, String password, String displayname, String email, Timestamp createAt) {
        this.username = username;
        this.password = password;
        this.displayname = displayname;
        this.email = email;
        this.createAt = createAt;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayname() {
        return displayname;
    }

    public void setDisplayname(String displayname) {
        this.displayname = displayname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

}
