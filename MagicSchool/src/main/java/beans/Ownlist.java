package beans;

public class Ownlist {
    int id,userID,courseID;

    public Ownlist() {
    }

    public Ownlist(int id, int userID, int courseID) {
        this.id = id;
        this.userID = userID;
        this.courseID = courseID;
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
