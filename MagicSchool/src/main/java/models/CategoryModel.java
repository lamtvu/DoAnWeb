package models;

import beans.Category;
import beans.Course;
import org.sql2o.Connection;
import utils.DBUtils;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public class CategoryModel {
    public static List<Category> getAll(){
        String sql = "select * from category ";
        try(Connection conn = DBUtils.getConnection()){
             return  conn.createQuery(sql).executeAndFetch(Category.class);
        }
    }
    public static void add(Category category){
        String sql = "insert into category(name,parentCat) values(:name,:parentCat)";
        try(Connection conn = DBUtils.getConnection()){
              conn.createQuery(sql)
                    .addParameter("name",category.getName())
                    .addParameter("parentCat",category.getParentCat())
                    .executeUpdate();
        }
    }
    public static void delete(int id){
        String sql= " DELETE FROM category WHERE id = :id or parentCat = :id";

        try(Connection conn = DBUtils.getConnection())
        {
            conn.createQuery(sql)
                    .addParameter("id",id)
                    .executeUpdate();
        }
    }
    public static void updateName(int id,String newName){
        String sql = "UPDATE category SET  name = :name WHERE id = :id ";
        try(Connection conn = DBUtils.getConnection()){
            conn.createQuery(sql)
                    .addParameter("id",id)
                    .addParameter("name",newName)
                    .executeUpdate();
        }
    }
    public static Optional<Category> findByID(int id) {
        String sql = "select * from category where id = :id";
        try (Connection con = DBUtils.getConnection()) {
            List<Category> list = con.createQuery(sql)
                    .addParameter("id", id)
                    .executeAndFetch(Category.class);
            if (list.size() == 0) {
                return Optional.empty();
            }
            return Optional.ofNullable(list.get(0));
        }
    }
    public static List<Map<String,Object>> GetTopCat(){
        String sql = "SELECT category.id, category.`name`,COUNT(*) num FROM course,users,category,ownlist WHERE users.id = course.teacherID and course.catID = category.id and ownlist.courseID = course.id  and datediff(now(),ownlist.`date`) <=7 GROUP BY catID  ORDER BY num DESC Limit 5";
        try (Connection conn = DBUtils.getConnection())
        {
            return conn.createQuery(sql).executeAndFetchTable().asList();
        }
    }
}
