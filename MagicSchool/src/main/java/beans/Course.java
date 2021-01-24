package beans;

import java.util.Date;

public class Course {
    int id, teacherID, price, catID;
    String coursename, TinyDes, FullDes,information,complete;
    Date updateDate;

    public Course() {
    }


    public Course(int id, int teacherID, int price, int catID, String coursename,String complete, String tinyDes, String fullDes, Date updateDate, String information) {
        this.id = id;

        this.teacherID = teacherID;
        this.price = price;
        this.catID = catID;
        this.coursename = coursename;
        TinyDes = tinyDes;
        FullDes = fullDes;
        this.updateDate = updateDate;
        this.information = information;
        this.complete=complete;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComplete() {
        return complete;
    }

    public void setComplete(String complete) {
        this.complete = complete;
    }

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCatID() {
        return catID;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    public String getTinyDes() {
        return TinyDes;
    }

    public void setTinyDes(String tinyDes) {
        TinyDes = tinyDes;
    }

    public String getFullDes() {
        return FullDes;
    }

    public void setFullDes(String fullDes) {
        FullDes = fullDes;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

}
