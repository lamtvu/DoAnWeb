package models;

import at.favre.lib.crypto.bcrypt.BCrypt;
import beans.*;
import org.sql2o.Connection;
import utils.DBUtils;

import java.util.Optional;
import java.util.List;

public class UserModel {
    public static void Add(User user){
        String sql = "insert into users(username,password,name,email,office) values(:username,:password,:name,:email,:office)";
        try(Connection conn = DBUtils.getConnection())
        {
            conn.createQuery(sql)
                    .addParameter("username",user.getUsername())
                    .addParameter("password",user.getPassword())
                    .addParameter("name",user.getName())
                    .addParameter("email",user.getEmail())
                    .addParameter("office",user.getOffice())
                    .executeUpdate();
        }
    }
    public static Optional<User> FindByID(int ID){
        String sql = "select* from users where id = :id";
        try(Connection conn = DBUtils.getConnection()){
            List<User> list = conn.createQuery(sql).addParameter("id",ID).executeAndFetch(User.class);
            if(list.size()==0){
                return Optional.empty();
            }
            else{
                return Optional.ofNullable(list.get(0));
            }

        }
    }
    public static Optional<User> FindByUserName(String username){
        String sql = "select* from users where username = :username";
        try(Connection conn = DBUtils.getConnection()){
            List<User> list = conn.createQuery(sql).addParameter("username",username).executeAndFetch(User.class);
            if(list.size()==0){
                return Optional.empty();
            }
            else{
                return Optional.ofNullable(list.get(0));
            }

        }
    }
    public static Optional<User> FindByEmail(String email){
        String sql = "select* from users where email = :email";
        try(Connection conn = DBUtils.getConnection()){
            List<User> list = conn.createQuery(sql).addParameter("email",email).executeAndFetch(User.class);
            if(list.size()==0){
                return Optional.empty();
            }
            else{
                return Optional.ofNullable(list.get(0));
            }

        }
    }

    public static List<Course> FindCourseByUserID(int id){
        String sql = "select course.id,course.TinyDes,course.price,course.evaluateID,course.coursename from course,users,cart WHERE course.id = cart.courseID AND cart.userID = users.id AND users.id =:id";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("id", id)
                    .executeAndFetch(Course.class);
        }

    }

    public static List<Course> FindWatchListByUserID(int id){
        String sql = "SELECT course.id,course.coursename,course.TinyDes,course.price FROM watchlist,course,users WHERE watchlist.courseID = course.id AND users.id = watchlist.userID AND watchlist.userID =:id";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("id", id)
                    .executeAndFetch(Course.class);
        }

    }

    public static void add(Watchlist wl){
        final String sql="INSERT INTO watchlist (userID, courseID) VALUES (:userID,:courseID)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("userID", wl.getUserID())
                    .addParameter("courseID",wl.getCourseID())
                    .executeUpdate();
        }
    }


    public static void addCourse(Cart c){
        final String sql="INSERT INTO cart (userID, courseID) VALUES (:userID,:courseID)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("userID", c.getUserID())
                    .addParameter("courseID",c.getCourseID())
                    .executeUpdate();
        }

    }

    public static void delete(Watchlist wld){
        final String sql="DELETE FROM watchlist WHERE userID =:userid and courseID =:courseid ";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("userid", wld.getUserID())
                    .addParameter("courseid",wld.getCourseID())
                    .executeUpdate();
        }
    }
    public static List<User> getAllUsersByOffice(String office){
        String sql = "select* from users where office = :office";
        try(Connection conn = DBUtils.getConnection()) {
            return conn.createQuery(sql).addParameter("office", office).executeAndFetch(User.class);
        }
    }
    public static void delete(int ID){
        String sql = "Delete FROM users where id=:id";
        String sql2  = "Delete From ownlist where userID=:id";
        String sql3 = "Delete From evaluate where userID=:id";
//        CourseModel.deleteByUserID(ID);
        try (Connection conn = DBUtils.getConnection()){
            conn.createQuery(sql).addParameter("id",ID).executeUpdate();
            conn.createQuery(sql2).addParameter("id",ID).executeUpdate();
            conn.createQuery(sql3).addParameter("id",ID).executeUpdate();
        }
    }
    public static void UpdateEmail(int id,String Email){
        String sql = "Update users set email=:email where id=:id";
        try(Connection conn = DBUtils.getConnection()){
            conn.createQuery(sql).addParameter("id",id).addParameter("email",Email).executeUpdate();
        }
    }
    public static void UpdateName(int id,String name){
        String sql = "Update users set name=:name where id=:id";
        try(Connection conn = DBUtils.getConnection()){
            conn.createQuery(sql).addParameter("id",id).addParameter("name",name).executeUpdate();
        }
    }
    public static void UpdatePassword(int id,String password){
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, password.toCharArray());
        String sql = "Update users set password=:password where id=:id";
        try(Connection conn = DBUtils.getConnection()){
            conn.createQuery(sql).addParameter("id",id).addParameter("password",bcryptHashString).executeUpdate();
        }
    }







}
