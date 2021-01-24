package models;

import beans.Category;
import org.sql2o.Connection;
import utils.DBUtils;

import java.util.List;
import java.util.Map;

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
}
