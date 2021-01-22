package beans;

public class Watchlist {
    int id, userID, courseID;

    public Watchlist() {
    }

    public int getId() {
        return id;
    }

    public Watchlist(int id, int userID, int courseID) {
        this.id = id;
        this.userID = userID;
        this.courseID = courseID;
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
