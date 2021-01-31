package models;
import beans.Chapter;
import beans.Course;
import org.sql2o.Connection;
import utils.DBUtils;

import java.util.List;
import java.util.Map;
import java.util.Optional;


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
        String sql = "INSERT INTO chapter (name, courseID, publiOrPrivate,updateDate) VALUES (:name,:courseid,:publiorprivate,:updateDate)";
        try(Connection conn = DBUtils.getConnection())
        {
            conn.createQuery(sql).addParameter("name",chapter.getName())
                    .addParameter("publiorprivate",chapter.getPubliOrPrivate())
                    .addParameter("courseid",chapter.getCourseID())
                    .addParameter("updateDate",chapter.getUpdateDate())
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
    public static Optional<Chapter> findByID(int id) {
        String sql = "select * from chapter where id = :id";
        try (Connection con = DBUtils.getConnection()) {
            List<Chapter> list = con.createQuery(sql)
                    .addParameter("id", id)
                    .executeAndFetch(Chapter.class);
            if (list.size() == 0) {
                return Optional.empty();
            }
            return Optional.ofNullable(list.get(0));
        }
    }
    public static void Update(int id,Chapter chapter){
        String sql ="UPDATE chapter SET  name = :name, courseID = :courseid, publiOrPrivate = :publiorprivate, updateDate = :updatedate WHERE id = :id ";

        try (Connection  conn = DBUtils.getConnection()){
            conn.createQuery(sql)
                    .addParameter("name",chapter.getName())
                    .addParameter("publiorprivate",chapter.getPubliOrPrivate())
                    .addParameter("updateDate",chapter.getUpdateDate())
                    .addParameter("id",chapter.getId())
                    .executeUpdate();
        }

    }
}
