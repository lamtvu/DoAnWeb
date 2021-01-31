package beans;

import java.util.Date;

public class Watchlist {
    int id, userID, courseID;
    Date date;

    public Watchlist() {
    }

    public int getId() {
        return id;
    }

    public Watchlist(int id, int userID, int courseID, Date date) {
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
