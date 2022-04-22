package handler.dao.with;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import common.sql.Config;
import handler.dto.InformationDTO;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class WithDAO {
    public static WithDAO it;


    public static WithDAO getInstance(){
        if(it==null)
            it = new WithDAO();
        return it;
    }

    public InformationDTO getInformation(String num) {
        List<Map<String, Object>> listOfMaps = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            listOfMaps = queryRunner.query(conn,"SELECT * FROM information WHERE id = ?;", new MapListHandler(), num);

//            System.out.println(listOfMaps);
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

    public String saveInformation(String data) {
        List<Map<String, Object>> listOfMaps = null;
        Connection conn = Config.getInstance().sqlLogin();
        String [] array = data.split("-/-/-");
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.update(conn,"UPDATE information SET content=? WHERE id=?", array[0], array[1]);

//            System.out.println(listOfMaps);
        } catch(SQLException se) {
            se.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        return "success";
    }
}
