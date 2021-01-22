package beans;

public class Cart {
    int id,userID,courseID;

    public Cart() {
    }

    public Cart(int id, int userID, int courseID) {
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
