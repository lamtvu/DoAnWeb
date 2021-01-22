package beans;

public class Category {
    int id,parentCat;
    String name;

    public Category(int id, int parentCat, String name) {
        this.id = id;
        this.parentCat = parentCat;
        this.name = name;
    }

    public Category() {
    }

    public int getId() {
        return id;
    }

    public int getParentCat() {
        return parentCat;
    }

    public String getName() {
        return name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setParentCat(int parentCat) {
        this.parentCat = parentCat;
    }

    public void setName(String name) {
        this.name = name;
    }
}
