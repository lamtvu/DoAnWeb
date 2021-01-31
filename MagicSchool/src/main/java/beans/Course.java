package beans;

import java.util.Date;

public class Course {
    int id, teacherID, price, catID;
    String complete,coursename, TinyDes, FullDes,enable;
    Date updateDate;

    public Course() {
    }

    public Course(int id, int teacherID, int price, int catID, String complete, String coursename, String tinyDes, String fullDes, String enable, Date updateDate) {
        this.id = id;
        this.teacherID = teacherID;
        this.price = price;
        this.catID = catID;
        this.complete = complete;
        this.coursename = coursename;
        TinyDes = tinyDes;
        FullDes = fullDes;
        this.enable = enable;
        this.updateDate = updateDate;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    public String getEnable() {
        return enable;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public void setComplete(String complete) {
        this.complete = complete;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    public void setTinyDes(String tinyDes) {
        TinyDes = tinyDes;
    }

    public void setFullDes(String fullDes) {
        FullDes = fullDes;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public int getId() {
        return id;
    }

    public int getTeacherID() {
        return teacherID;
    }

    public int getPrice() {
        return price;
    }

    public int getCatID() {
        return catID;
    }

    public String getComplete() {
        return complete;
    }

    public String getCoursename() {
        return coursename;
    }

    public String getTinyDes() {
        return TinyDes;
    }

    public String getFullDes() {
        return FullDes;
    }

    public Date getUpdateDate() {
        return updateDate;
    }
}