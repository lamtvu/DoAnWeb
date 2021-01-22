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
}
