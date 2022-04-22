package handler.dao.user;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import common.sql.Config;
import handler.dto.UserDTO;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UserDAO {
    public static UserDAO it;

    public static UserDAO getInstance(){
        if(it==null)
            it = new UserDAO();
        return it;
    }
    public String addUser(String data, String google_id) {

        String [] arr = data.split("-/-/-"); // 받아온 한 줄짜리 데이터를 배열로 쪼개기
        String id = arr[0];
        String pw = arr[1];
        String name = arr[2];
        String Birthday = arr[3];
        String gender = arr[4];
        String email = arr[5];
        String phone = arr[6];
        String type = arr[7];
        String image = arr[8];
        String home = arr[9];
        String time = arr[10];
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(conn,
                    "INSERT INTO `user`(id, password, name, birthday, gender, email, phone, type, image_url, home, google_id) " +
                            "VALUES (?,?,?,?,?,?,?,?,?,?,?)", id,pw,name,Birthday,gender,email,phone,type,image,home,google_id);
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
        return "회원가입에 성공하였습니다.";
    }

    public UserDTO getUser(String id) {
        List<Map<String, Object>> listOfMaps = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            listOfMaps = queryRunner.query(conn,"SELECT * FROM user WHERE id = ?;", new MapListHandler(), id);

//            System.out.println(listOfMaps);
        } catch(SQLException se) {
            se.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        ArrayList<UserDTO> selected = gson.fromJson(gson.toJson(listOfMaps), new TypeToken<List<UserDTO>>() {}.getType());
        if(selected.size()>0) {
            return selected.get(0);
        }
        else
            return null;
    }

    public UserDTO getType(String type){
        List<Map<String, Object>> listOfMaps = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            String sql = "SELECT * FROM type where name = '" + type + "';";
            listOfMaps = queryRunner.query(conn, sql, new MapListHandler());
        } catch(Exception se) {
            se.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }

        try {
            Gson gson = new Gson();
            ArrayList<UserDTO> selected = gson.fromJson(gson.toJson(listOfMaps), new TypeToken<List<UserDTO>>() {}.getType());
            if(selected.size() > 0) {
                return selected.get(0);
            }
            else
                return null;
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
    }

    public void whoIsLogIn(String id) {
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(conn,"UPDATE user SET lastlogin = now() WHERE id = ?;", id);
        } catch(SQLException se) {
            se.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
    }
    public UserDTO getGoogleUser(String google_id){
        System.out.println(google_id);
        List<Map<String, Object>> listOfMaps = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            listOfMaps = queryRunner.query(conn,"SELECT * FROM user WHERE google_id = ?;", new MapListHandler(), google_id);
        } catch(SQLException se) {
            se.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        System.out.println(listOfMaps);
        System.out.println(google_id);
        Gson gson = new Gson();
        ArrayList<UserDTO> selected = gson.fromJson(gson.toJson(listOfMaps), new TypeToken<List<UserDTO>>() {}.getType());
        if(selected.size()>0) {
            return selected.get(0);
        }
        else
            return null;
    }

}
