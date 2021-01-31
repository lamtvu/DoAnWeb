package beans;

import java.util.Date;

public class Ownlist {
    int id,userID,courseID;
    Date date;

    public Ownlist() {
    }

    public Ownlist(int id, int userID, int courseID, Date date) {
        this.id = id;
        this.userID = userID;
        this.courseID = courseID;
        this.date = date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }
}
