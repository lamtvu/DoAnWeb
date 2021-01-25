package models;
import beans.Chapter;
import org.sql2o.Connection;
import utils.DBUtils;

import java.util.List;
import java.util.Map;


public class ChapterModel {
    public static List<Chapter> getAll()
    {
        String sql = "select* from chapter";
        try(Connection conn = DBUtils.getConnection())
        {
            return conn.createQuery(sql).executeAndFetch(Chapter.class);
        }
    }
    public static void add(Chapter chapter)
    {
        String sql = "INSERT INTO chapter (name, courseID, publiOrPrivate) VALUES (:name,:courseid,:publiorprivate)";
        try(Connection conn = DBUtils.getConnection())
        {
            conn.createQuery(sql).addParameter("name",chapter.getName())
                    .addParameter("publiorprivate",chapter.getPubliOrPrivate())
                    .addParameter("courseid",chapter.getCourseID())
                    .executeUpdate();
        }
    }
    public static List<Map<String,Object>> getMaxID()
    {
        String sql = "select MAX(id) as maxid FROM chapter";
        try(Connection conn = DBUtils.getConnection()){
            return conn.createQuery(sql).executeAndFetchTable().asList();
        }
    }
    public static void delete(int id)
    {
        String sql ="DELETE FROM chapter WHERE id = :id";
        try(Connection conn = DBUtils.getConnection()){
            conn.createQuery(sql).addParameter("id",id).executeUpdate();
        }
    }
    public static List<Chapter> byCourseID(int id)
    {
        String sql = "select* from chapter where courseID=:id";
        try(Connection conn = DBUtils.getConnection())
        {
            return conn.createQuery(sql).addParameter("id",id).executeAndFetch(Chapter.class);
        }
    }
}
