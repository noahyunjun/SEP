package handler.dao.main;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import common.sql.Config;
import handler.dto.InformationDTO;
import handler.dto.TeamDTO;
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

    public static HomeDAO getInstance(){
        if(it==null)
            it = new HomeDAO();
        return it;
    }
    public ArrayList<TeamDTO> getTeam(){
        List<Map<String,Object>> listOfMaps = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            listOfMaps = queryRunner.query(conn, "SELECT * FROM `team`", new MapListHandler());
        }
        catch (SQLException se){
            se.printStackTrace();
        }
        finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        ArrayList<TeamDTO> selectedList = gson.fromJson(gson.toJson(listOfMaps), new TypeToken<List<TeamDTO>>(){
        }.getType());
        return selectedList;
    }

    public InformationDTO getInformation(String id) {
        List<Map<String, Object>> listOfMaps = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            listOfMaps = queryRunner.query(conn,"SELECT * FROM main_information WHERE id = ?;", new MapListHandler(), id);
        } catch(SQLException se) {
            se.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        ArrayList<InformationDTO> selected = gson.fromJson(gson.toJson(listOfMaps), new TypeToken<List<InformationDTO>>() {}.getType());
        if(selected.size()>0) {
            return selected.get(0);
        }
        else
            return null;
    }
}
