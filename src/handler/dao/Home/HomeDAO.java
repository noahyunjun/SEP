package handler.dao.Home;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import handler.dto.Home.UserDTO;
import common.sql.Config;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class HomeDAO {
    public static HomeDAO it;

    public static HomeDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new HomeDAO();
        return it;
    }

    //테스트 메소드
    public Boolean loginCheck(String data) {
        String arr[] = data.split("-/-/-"); // 0 id, 1 password
        String id = arr[0];
        String password = arr[1];
        // 스플릿을 활용하여 한줄로된 아이디와 비밀번호 쪼개줌.
        System.out.println("id: "+arr[0]);
        System.out.println("pw: "+arr[1]);

        ArrayList<UserDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner que = new QueryRunner();
            list = que.query(conn, "SELECT * FROM sedb.users WHERE id=?;", new MapListHandler(), id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
//        System.out.println(list);
        if (list.size() > 0) {//입력한 id가 존재할 때
            Gson gson = new Gson();
            result = gson.fromJson(gson.toJson(list), new TypeToken<List<UserDTO>>() {
            }.getType());
            String realPassword = result.get(0).getPassword();
            if (password.equals(realPassword)) {
                return true; //로그인 성공
            }
            return false;//로그인 실패
        }
        return false;//로그인 실패
    }

    public UserDTO getUserInfo(String id) {
        ArrayList<UserDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner que = new QueryRunner();
            list = que.query(conn, "SELECT * FROM users WHERE id=?;", new MapListHandler(), id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<UserDTO>>() {
        }.getType());
//        System.out.println(list);
        return result.get(0);
    }
    //이거 뭐하는 놈일까?

    public String signUp(String data) {//회원가입
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
//        System.out.println(data);
        String arr[] = data.split("-/-/-");
        String name = arr[0];
        String id = arr[1];
        String pw = arr[2];
        System.out.println("//"+arr[0]+"//"+arr[1]+"//"+arr[2]);
        try {
            QueryRunner que = new QueryRunner();
            list = que.query(conn, "SELECT * FROM users WHERE id=?;", new MapListHandler(), id);
            if(list.size()==0){ //존재하지 않는 아이디의 경우
                que.update(conn, "INSERT users SET user_name=?, id=?, pw=?;", name, id, pw);
//insert into User(id, password, type, name, birthDay, phoneNumber, blackList) values('admin', 'admin', '관리자', '홈페이지관리자', '2021-05-10', '010-0000-0000', false);
            }
            else {
                return "실패";
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return "성공";
    }

    public ArrayList<UserDTO> getUserList() { //User 정보 전부 돌려줌
//        ArrayList<UserDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM User", new MapListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        ArrayList<UserDTO> selected = gson.fromJson(gson.toJson(list), new TypeToken<List<UserDTO>>() {
        }.getType());
        if (selected.size() > 0) {
            return selected;
        } else {
            System.out.println("Not selected");
            return null;
        }
    }

    public void deleteUser(String id) { //회원 정보 삭제
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.query(conn, "DELETE FROM User WHERE id=?", new MapListHandler(), id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }

    }

    public void passwordReset(String id) { //비밀번호 0000으로 초기화
        Connection conn = Config.getInstance().sqlLogin();
        String password = "0000";
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.query(conn, "UPDATE User SET password=? WHERE id=?", new MapListHandler(), password, id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
    }

    public void typeChange(String data) { //Type 변경     관리자 <-> 손님
        String arr[] = data.split("-/-/-"); // 0 id, 1 type
        String id = arr[0];
        String type = arr[1];
//        System.out.println(id +" "+ type);
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            if (type.equals("관리자")) {
                queryRunner.query(conn, "UPDATE User SET type=? WHERE id=?", new MapListHandler(), "손님", id);
            } else { //손님
                queryRunner.query(conn, "UPDATE User SET type=? WHERE id=?", new MapListHandler(), "관리자", id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
    }

    public String changeBlacklist(String data) { //Type 변경     관리자 <-> 손님
        String arr[] = data.split("-/-/-"); // 0 id, 1 type
        String id = arr[0];
        String blackList = arr[1];
        //System.out.println(id +" "+ blackList);
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            if (blackList.equals("true")) {
                queryRunner.query(conn, "UPDATE User SET blackList=? WHERE id=?", new MapListHandler(), "false", id);
                return "false";
            } else { //손님
                queryRunner.query(conn, "UPDATE User SET blackList=? WHERE id=?", new MapListHandler(), "true", id);
                return "true";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return "";
    }

}
