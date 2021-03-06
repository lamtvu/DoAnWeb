package beans;

public class User {
    int id;
    String username,password,name,email,office,enable,information;


    public User() {
    }

    public User(int id, String username, String password, String name, String email, String office, String enable, String information) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.office = office;
        this.enable = enable;
        this.information = information;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getEnable() {
        return enable;
    }

    public String getInformation() {
        return information;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOffice() {
        return office;
    }

    public void setOffice(String office) {
        this.office = office;
    }
}
