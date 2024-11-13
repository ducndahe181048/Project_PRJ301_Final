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
public class Document {

    private String id;
    private String name;
    private String path;
    private String uploadBy;
    private Timestamp uploadAt;
    private int cid;

    public Document() {
    }
    
    //Contructor for adding document
    public Document(String id, String name, String path, String uploadBy, int cid) {
        this.id = id;
        this.name = name;
        this.path = path;
        this.uploadBy = uploadBy;
        this.cid = cid;
    }
    
    //Contructor for updating document
    public Document(String id, String name, String path) {
        this.id = id;
        this.name = name;
        this.path = path;
    }

    public Document(String id, String name, String path, String uploadBy, Timestamp uploadAt, int cid) {
        this.id = id;
        this.name = name;
        this.path = path;
        this.uploadBy = uploadBy;
        this.uploadAt = uploadAt;
        this.cid = cid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getUploadBy() {
        return uploadBy;
    }

    public void setUploadBy(String uploadBy) {
        this.uploadBy = uploadBy;
    }

    public Timestamp getUploadAt() {
        return uploadAt;
    }

    public void setUploadAt(Timestamp uploadAt) {
        this.uploadAt = uploadAt;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

}
