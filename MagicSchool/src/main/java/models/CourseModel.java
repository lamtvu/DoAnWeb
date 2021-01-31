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
        String sql="SELECT course.id,course.coursename,course.TinyDes,course.FullDes,course.price,course.updateDate,users.`name` as userName,category.`name`as catName,COUNT(evaluate.userID) as num,ROUND(AVG(evaluate.point),1)as point from course left JOIN evaluate ON course.id = evaluate.courseID,users,category WHERE users.id = course.teacherID and course.enable != 'false' and course.catID = category.id GROUP BY course.id ORDER BY DATE(course.updateDate) DESC Limit 10";
        try(Connection conn = DBUtils.getConnection())
        {
            return conn.createQuery(sql).executeAndFetchTable().asList();
        }
    }

    public  static  List<Map<String,Object>> GetFetureCourse(){
        String sql="SELECT course.id,course.coursename,course.TinyDes,course.FullDes,course.price,course.updateDate,users.`name` as userName,category.`name`as catName,COUNT(evaluate.userID) as num,ROUND(AVG(evaluate.point),2)as point from course left JOIN evaluate ON course.id = evaluate.courseID,users,category WHERE users.id = course.teacherID and course.enable != 'false' and course.catID = category.id GROUP BY course.id ORDER BY (course.price) DESC Limit 10";
        try(Connection conn = DBUtils.getConnection())
        {
            return conn.createQuery(sql).executeAndFetchTable().asList();
        }
    }




    public static List<Map<String, Object>> GetByID(int id){
        String sql="SELECT course.id,course.complete,users.information as informationd,course.coursename,course.TinyDes,course.FullDes,course.price,course.updateDate,users.`name` as userName,category.`name`as catName,COUNT(evaluate.userID) as num,ROUND(AVG(evaluate.point),1)as point FROM users,category,course left JOIN evaluate on course.id = evaluate.courseID WHERE users.id = course.teacherID AND course.catID = category.id AND course.id =:id GROUP BY course.id";
        try(Connection conn = DBUtils.getConnection()){
            return conn.createQuery(sql)
                    .addParameter("id",id)
                    .executeAndFetchTable().asList();

        }

    }

    public static List<Map<String,Object>> GetByCat(int id,int limit, int offset){
        //String sql="SELECT course.id,course.coursename,course.TinyDes,course.FullDes,course.price,course.updateDate,users.`name` as userName,category.`name`as catName,COUNT(evaluate.userID) as num,ROUND(AVG(evaluate.point),1)as point FROM users,course,category,evaluate WHERE users.id = course.teacherID AND course.catID = category.id AND evaluate.courseID = course.id AND category.id=:id GROUP BY course.id";
        String sql="SELECT course.id,course.coursename,course.TinyDes,course.FullDes,course.price,course.updateDate,course.catID as catID,users.`name` as userName,category.`name`as catName,COUNT(evaluate.userID) as num,ROUND(AVG(evaluate.point),1)as point from course left JOIN evaluate ON course.id = evaluate.courseID,users,category WHERE  users.id = course.teacherID and course.catID = category.id and category.id=:id and course.enable!='false' GROUP BY course.id limit :limit offset :offset ";
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
    public static List<Course> findByMainCatID(int catID)
    {
        String sql ="SELECT course.id, course.coursename, course.TinyDes, course.FullDes, course.catID, course.teacherID, course.price, course.updateDate, course.complete, course.enable FROM category c1 INNER JOIN category c2 ON c1.id = c2.parentCat,course WHERE c2.id = course.catID AND c1.id = :id";
        try(Connection conn = DBUtils.getConnection())
        {
            return conn.createQuery(sql).addParameter("id",catID).executeAndFetch(Course.class);
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


    public static void delete(int id){
        String sql1 = "Delete from course where id=:id";
        String sql2 = "DELETE FROM ownlist WHERE courseID = :id ";
        String sql3 = "DELETE FROM watchlist WHERE courseID = :id ";
        String sql4 = "DELETE FROM evaluate WHERE courseID = :id";
        try (Connection conn = DBUtils.getConnection())
        {
            conn.createQuery(sql1).addParameter("id",id).executeUpdate();
            conn.createQuery(sql2).addParameter("id",id).executeUpdate();
            conn.createQuery(sql3).addParameter("id",id).executeUpdate();
            conn.createQuery(sql4).addParameter("id",id).executeUpdate();
        }
    }
    public static void add(Course course){
        String sql = "INSERT INTO course (coursename, TinyDes, FullDes, catID, teacherID, price, updateDate, complete,enable) VALUES (:coursename,:tinydes,:fulldes,:catid,:teacherid,:price,:updatedate,:complete,:enable)";
        try (Connection conn = DBUtils.getConnection()){
            conn.createQuery(sql)
                    .addParameter("coursename",course.getCoursename())
                    .addParameter("tinydes",course.getTinyDes())
                    .addParameter("fulldes",course.getFullDes())
                    .addParameter("catid",course.getCatID())
                    .addParameter("teacherid",course.getTeacherID())
                    .addParameter("price",course.getPrice())
                    .addParameter("updatedate",course.getUpdateDate())
                    .addParameter("complete",course.getComplete())
                    .addParameter("enable",course.getEnable())
                    .executeUpdate();
        }
    }
    public static List<Map<String,Object>> getMaxID()
    {
        String sql = "select MAX(id) as maxid FROM course";
        try(Connection conn = DBUtils.getConnection()){
            return conn.createQuery(sql).executeAndFetchTable().asList();
        }
    }
    public static Boolean IsHas(int userid,int courseid){
        String sql = "select* from ownlist where userID=:userid and courseID=:courseid";
        try(Connection conn = DBUtils.getConnection()){
            List<Map<String,Object>> list = conn.createQuery(sql).addParameter("userid",userid)
                                                                    .addParameter("courseid",courseid).executeAndFetchTable().asList();
            if(list.size()==0)
                return false;
            else
                return true;
        }
    }

//    GROUP BY course.id
    //Serach by name course
public static List<Map<String,Object>> GetNameCourse(String name,int limit, int offset){
    String sql="SELECT course.id,course.coursename as coursename,course.TinyDes,course.FullDes,course.price as price,course.updateDate,course.catID as catID,users.`name` as userName,category.`name`as catName,COUNT(evaluate.userID) as num,ROUND(AVG(evaluate.point),1)as point from course left JOIN evaluate ON course.id = evaluate.courseID,users,category WHERE  users.id = course.teacherID and course.catID = category.id and course.enable != 'false' and course.coursename like" + "'%"+name+"%'" +" GROUP BY course.coursename limit :limit offset :offset";
//        String sql="select * from course where course.coursename like" + "'%"+name+"%'";
    try(Connection conn = DBUtils.getConnection()){
        return conn.createQuery(sql)
//                    .addParameter("name",name)
                .addParameter("limit",limit)
                .addParameter("offset",offset)
                .executeAndFetchTable().asList();

    }
}

    public static int countByName(String name) {
        String sql = "select count(*) from course where course.coursename like" + "'%"+name+"%'";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .executeScalar(Integer.class);
        }
    }

    public static boolean IsOnWatchList(int userid,int courseid)
    {
        String sql = "select* from watchlist  where userID=:userid and courseID=:courseid";
        try(Connection conn = DBUtils.getConnection()){
            List<Map<String,Object>> list = conn.createQuery(sql).addParameter("userid",userid)
                    .addParameter("courseid",courseid).executeAndFetchTable().asList();
            if(list.size()==0)
                return false;
            else
                return true;
        }

    }
    public static void Update(int id,Course course)
    {
        String sql = "UPDATE course SET  coursename = :coursename, TinyDes = :tinydes, FullDes = :fulldes, catID = :catid, teacherID = :teacherid, price = :price, updateDate = :updatedate, complete = :complete, enable = :enable WHERE id = :id ";

        try(Connection conn = DBUtils.getConnection()){
            conn.createQuery(sql)
                    .addParameter("coursename",course.getCoursename())
                    .addParameter("tinydes",course.getTinyDes())
                    .addParameter("catid",course.getCatID())
                    .addParameter("price",course.getPrice())
                    .addParameter("updatedate",course.getUpdateDate())
                    .addParameter("teacherid",course.getTeacherID())
                    .addParameter("complete",course.getComplete())
                    .addParameter("fulldes",course.getFullDes())
                    .addParameter("enable",course.getEnable())
                    .addParameter("id",id)
                    .executeUpdate();
        }
    }

    public static List<Course> SearchByTeacherAndSubCat(String teachername, int catid)
    {
        if(catid != 0 ){
            String sql = "SELECT course.id, course.coursename, course.TinyDes, course.FullDes, course.catID, course.teacherID, course.price, course.updateDate, course.complete, course.enable FROM category,course,users WHERE category.id=course.catID and course.teacherID = users.id and users.username like '%"+teachername+"%' and course.catID = :catid";
            try(Connection conn = DBUtils.getConnection()){
                return conn.createQuery(sql).addParameter("catid",catid).executeAndFetch(Course.class);
            }
        }
        else{
            String sql = "SELECT course.id, course.coursename, course.TinyDes, course.FullDes, course.catID, course.teacherID, course.price, course.updateDate, course.complete, course.enable FROM category,course,users WHERE category.id=course.catID and course.teacherID = users.id and users.username like '%"+teachername+"%'";
            try(Connection conn = DBUtils.getConnection()){
                return conn.createQuery(sql).executeAndFetch(Course.class);
            }
        }
    }
    public static List<Course> SearchByTeacherAndCat(String teachername,int catid)
    {
        String sql = "SELECT course.id, course.coursename, course.TinyDes, course.FullDes, course.catID, course.teacherID, course.price, course.updateDate, course.complete, course.enable FROM category c1 INNER JOIN category c2 ON c1.id = c2.parentCat,course,users WHERE c2.id = course.catID AND users.id = course.teacherID AND c1.id = :catid and users.username like '%"+teachername+"%'";
        try(Connection conn = DBUtils.getConnection()){
            return conn.createQuery(sql).addParameter("catid",catid).executeAndFetch(Course.class);
        }
    }
}
