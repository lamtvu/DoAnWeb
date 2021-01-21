package models;

import beans.User;
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
        };
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
}
