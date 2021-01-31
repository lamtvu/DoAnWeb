package beans;

import java.util.Date;

public class Chapter {
    int id,courseID;
    String name,publiOrPrivate ;
    Date updateDate;

    public Chapter(int id, int courseID, String name, String publiOrPrivate, Date updateDate) {
        this.id = id;
        this.courseID = courseID;
        this.name = name;
        this.publiOrPrivate = publiOrPrivate;
        this.updateDate = updateDate;
    }

    public Chapter() {
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPubliOrPrivate(String publiOrPrivate) {
        this.publiOrPrivate = publiOrPrivate;
    }

    public int getId() {
        return id;
    }

    public int getCourseID() {
        return courseID;
    }

    public String getName() {
        return name;
    }

    public String getPubliOrPrivate() {
        return publiOrPrivate;
    }
}
