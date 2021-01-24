package models;

import beans.Course;
import org.sql2o.Connection;
import utils.DBUtils;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public class CourseModel {
    public static List<Course> getAll(){
        final String sql = "select * from course";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(Course.class);
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

public  static  List<Map<String,Object>> GetNewCourse(){
        String sql="SELECT course.id,course.coursename,course.TinyDes,course.FullDes,course.price,course.updateDate,users.`name` as userName,category.`name`as catName,COUNT(evaluate.userID) as num,ROUND(AVG(evaluate.point),1)as point from course left JOIN evaluate ON course.id = evaluate.courseID,users,category WHERE users.id = course.teacherID and course.catID = category.id GROUP BY course.id ORDER BY DATE(course.updateDate) DESC Limit 10";
        try(Connection conn = DBUtils.getConnection())
        {
            return conn.createQuery(sql).executeAndFetchTable().asList();
        }
    }




    public static List<Map<String, Object>> GetByID(int id){
        String sql="SELECT course.id,course.coursename,course.TinyDes,course.FullDes,course.price,course.updateDate,users.`name` as userName,category.`name`as catName,COUNT(evaluate.userID) as num,ROUND(AVG(evaluate.point),1)as point FROM users,course,category,evaluate WHERE users.id = course.teacherID AND course.catID = category.id AND evaluate.courseID = course.id AND course.id=:id GROUP BY course.id";
        try(Connection conn = DBUtils.getConnection()){
            return conn.createQuery(sql)
                    .addParameter("id",id)
                    .executeAndFetchTable().asList();

        }

    }

    public static List<Map<String,Object>> GetByCat(int id,int limit, int offset){
        //String sql="SELECT course.id,course.coursename,course.TinyDes,course.FullDes,course.price,course.updateDate,users.`name` as userName,category.`name`as catName,COUNT(evaluate.userID) as num,ROUND(AVG(evaluate.point),1)as point FROM users,course,category,evaluate WHERE users.id = course.teacherID AND course.catID = category.id AND evaluate.courseID = course.id AND category.id=:id GROUP BY course.id";
        String sql="SELECT course.id,course.coursename,course.TinyDes,course.FullDes,course.price,course.updateDate,course.catID as catID,users.`name` as userName,category.`name`as catName,COUNT(evaluate.userID) as num,ROUND(AVG(evaluate.point),1)as point from course left JOIN evaluate ON course.id = evaluate.courseID,users,category WHERE  users.id = course.teacherID and course.catID = category.id and category.id=:id GROUP BY course.id limit :limit offset :offset ";
        try(Connection conn = DBUtils.getConnection()){
            return conn.createQuery(sql)
                    .addParameter("id",id)
                    .addParameter("limit",limit)
                    .addParameter("offset",offset)
                    .executeAndFetchTable().asList();

        }
    }


    public static List<Course> findByCatID(int CatID){
        String sql = "select* from course where catID=:catID";
        try(Connection conn = DBUtils.getConnection())
        {
            return conn.createQuery(sql).addParameter("catID",CatID).executeAndFetch(Course.class);
        }
    }

//Phan trang
    public static int countByCatID(int id) {
        String sql = "select count(*) from course where catID = :id";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("id", id)
                    .executeScalar(Integer.class);
        }
    }

    public static List<Course>pageByCatID(int catID, int limit, int offset) {
        String sql = "select * from course where catID = :catID limit :limit offset :offset";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("catID", catID)
                    .addParameter("limit", limit)
                    .addParameter("offset", offset)
                    .executeAndFetch(Course.class);
        }
    }



//    GROUP BY course.id
}
