package beans;

public class Evaluate {
    int userID,courseID,point;

    public Evaluate() {
    }

    public Evaluate(int userID, int courseID, int point) {
        this.userID = userID;
        this.courseID = courseID;
        this.point = point;
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
