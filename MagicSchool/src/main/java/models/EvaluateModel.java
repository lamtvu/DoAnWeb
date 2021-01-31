package models;

import org.sql2o.Connection;
import utils.DBUtils;

import java.util.Date;
import java.util.Map;
import java.util.List;

public class EvaluateModel {
    public static List<Map<String,Object>> getByCourseID(int id){
        String sql = "SELECT evaluate.userID,evaluate.courseID, users.name as username, evaluate.point, evaluate.feedback FROM evaluate,users WHERE evaluate.userID = users.id and evaluate.courseID = :id";
        try(Connection conn = DBUtils.getConnection()){
            return conn.createQuery(sql).addParameter("id",id).executeAndFetchTable().asList();
        }
    }

    public static List<Map<String,Object>> getByCourseID(int id, int limit,int offset){
        String sql = "SELECT evaluate.userID,evaluate.courseID, users.name as username, evaluate.point, evaluate.feedback FROM evaluate,users WHERE evaluate.userID = users.id and evaluate.courseID = :id limit :limit offset :offset ";
        try(Connection conn = DBUtils.getConnection()){
            return conn.createQuery(sql).addParameter("id",id).addParameter("limit",limit).addParameter("offset",offset).executeAndFetchTable().asList();
        }
    }

    public static List<Map<String,Object>> getByCourseIDAndUserID(int courseID,int userID){
        String sql = "SELECT evaluate.userID,evaluate.courseID,users.name as username, evaluate.point, evaluate.feedback FROM evaluate,users WHERE evaluate.userID = users.id and evaluate.courseID = :courseID and evaluate.userID = :userID";
        try(Connection conn = DBUtils.getConnection()){
            return conn.createQuery(sql).addParameter("courseID",courseID).addParameter("userID",userID).executeAndFetchTable().asList();
        }
    }
    public static void add(int userID, int courseID, int point, String feedback, Date date){
        String sql = "INSERT INTO evaluate (userID, courseID, point, feedback,date) VALUES (:userid,:courseid,:point,:feedback,:date)";
        try(Connection conn = DBUtils.getConnection())
        {
            conn.createQuery(sql)
                    .addParameter("userid",userID)
                    .addParameter("courseid",courseID)
                    .addParameter("point",point)
                    .addParameter("feedback",feedback)
                    .addParameter("date",date)
                    .executeUpdate();
        }
    }
    public static void Update(int userID,int courseID,int point,String feedback){
        String sql = "UPDATE evaluate SET  point = :point, feedback = :feedback WHERE userID = :userid  AND courseID = :courseid";
        try(Connection conn = DBUtils.getConnection())
        {
            conn.createQuery(sql)
                    .addParameter("userid",userID)
                    .addParameter("courseid",courseID)
                    .addParameter("point",point)
                    .addParameter("feedback",feedback)
                    .executeUpdate();
        }
    }

}
