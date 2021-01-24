package models;

import beans.Category;
import beans.Course;
import beans.Evaluate;
import beans.User;
import org.sql2o.Connection;
import utils.DBUtils;

import java.util.List;
import java.util.Optional;

public class CourseModel {

//    Lấy 10 khóa học mới nhất
    public static List<Course> get10NewCourse(){
        final String sql = "SELECT * FROM course ORDER BY course.id DESC";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(Course.class);
        }
    }




    public static List<Course> getAll(){
        final String sql = "select * from course";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(Course.class);
        }
    }
    public static  List<User> getTeach(){
        final String sql = "select users.name,users.id from course,users where course.teacherID = users.id";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(User.class);
        }
    }
    public static  List<Evaluate> getPoint(){
        final String sql ="select evaluate.courseID, AVG(evaluate.point) as point from evaluate,course where evaluate.courseID = course.id GROUP BY evaluate.courseID";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(Evaluate.class);
        }
    }

    public  static  List<Category> getField(){
        final String sql ="select * from category";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(Category.class);
        }
    }



    public static Optional<Course> findByID(int courseid) {
        String sql = "select * from course where id = :id";
        try (Connection con = DBUtils.getConnection()) {
            List<Course> list = con.createQuery(sql)
                    .addParameter("id", courseid)
                    .executeAndFetch(Course.class);
            if (list.size() == 0) {
                return Optional.empty();
            }
            return Optional.ofNullable(list.get(0));
        }
    }
    public static List<Course> findByCatID(int CatID){
        String sql = "select* from course where catID=:catID";
        try(Connection conn = DBUtils.getConnection())
        {
            return conn.createQuery(sql).addParameter("catID",CatID).executeAndFetch(Course.class);
        }
    }

}
