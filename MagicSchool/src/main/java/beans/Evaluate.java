package beans;

import java.util.Date;

public class Evaluate {
    int userID,courseID,point;
    Date date;

    public Evaluate() {
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public Evaluate(int userID, int courseID, int point, Date date) {
        this.userID = userID;
        this.courseID = courseID;
        this.point = point;
        this.date = date;
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

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
}
