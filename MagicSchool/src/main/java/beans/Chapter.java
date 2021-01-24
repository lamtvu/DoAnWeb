package beans;

public class Chapter {
    int id,courseID;
    String name,publiOrPrivate ;

    public Chapter() {
    }

    public Chapter(int id, int courseID, String name, String publiOrPrivate) {
        this.id = id;
        this.courseID = courseID;
        this.name = name;
        this.publiOrPrivate = publiOrPrivate;
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
