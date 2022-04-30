package handler.dao.Reservation;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import handler.dto.Reservation.ReservationDTO;
import handler.dto.Reservation.ReservationRequestDTO;
import handler.dto.Reservation.TableDTO;
import common.sql.Config;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ReservationDAO {
    public static ReservationDAO it;

    public static ReservationDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new ReservationDAO();
        return it;
    }
    public ArrayList<ReservationRequestDTO> getReservationRequestList() {  //고객 예약 요청 리스트 db 불러오기
        ArrayList<ReservationRequestDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM ReservationRequest", new MapListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
                DbUtils.closeQuietly(conn);
            }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationRequestDTO>>() {
        }.getType());
       // System.out.println(list);
       // System.out.println(result.get(0).getDate());
        return result;
    }
    public ArrayList<ReservationRequestDTO> getUserReservationRequest(String id) {  //고객 예약 리스트 db 불러오기
        ArrayList<ReservationRequestDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM ReservationRequest WHERE customer_id=?", new MapListHandler(), id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationRequestDTO>>() {
        }.getType());
        // System.out.println(list);
        // System.out.println(result.get(0).getDate());
        return result;
    }
    public ArrayList<ReservationDTO> getUserReservation(String id) {  //고객 예약 리스트 db 불러오기
        ArrayList<ReservationDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM Reservation WHERE customer_id=?", new MapListHandler(), id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationDTO>>() {
        }.getType());
        // System.out.println(list);
        // System.out.println(result.get(0).getDate());
        return result;
    }


    public ArrayList<ReservationDTO> getReservationList(String date) {  //고객 예약 리스트 db 불러오기
        ArrayList<ReservationDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM Reservation WHERE date=?", new MapListHandler(), date);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationDTO>>() {
        }.getType());
        // System.out.println(list);
        // System.out.println(result.get(0).getDate());
        return result;
    }
    public String addReservationRequest(String data) {    //고객 예약 요청 리스트 추가
        System.out.println(data);
        String arr[] = data.split("-/-/-"); //data = covers+"-/-/-"+date+"-/-/-"+time+"-/-/-"+user.name+"-/-/-"+user.id+"-/-/-"+message;
        String covers = arr[0];
        String date = arr[1];
        String time = arr[2];
        String name = arr[3];
        String id = arr[4];
        String message = arr[5];
        List<Map<String, Object>> check_reservation = null;
        List<Map<String, Object>> check_walkIn = null;
        List<Map<String, Object>> table = null;
        Random random = new Random();
        int verifyCode=random.nextInt(100000000);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        try{
            QueryRunner que = new QueryRunner();
            table=que.query(conn,"SELECT * FROM `Table`",new MapListHandler());
            check_reservation=que.query(conn,"SELECT * FROM Reservation WHERE date=? AND time=?", new MapListHandler(),
                    date,time);
            check_walkIn=que.query(conn,"SELECT * FROM WalkIn WHERE date=? AND time=?", new MapListHandler(),
                    date,time);
            if(check_reservation.size()+check_walkIn.size()==table.size()){
                return "-1";
            }
            else {
                que.query(conn, "INSERT ReservationRequest SET covers=?, date=?,time=?,customer_name=?,customer_id=?, message=?, verifyCode=?;", new MapListHandler(),
                        covers, date, time, name, id, message, verifyCode);
//          System.out.println("ddd");
                list = que.query(conn, "SELECT * FROM ReservationRequest WHERE verifyCode=?", new MapListHandler(), verifyCode);
            }
//          System.out.println(list);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        ArrayList<ReservationRequestDTO> result = null;
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationRequestDTO>>() {}.getType());
        System.out.println(result.get(0).getOid());
        String oid = result.get(0).getOid();
        return oid;
    }

    public ArrayList<?> getSchedule(String date) {
        return null;
    }

    public ArrayList<TableDTO> getTables() {  //테이블 받아오기
        ArrayList<TableDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM `Table`", new MapListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<TableDTO>>() {
        }.getType());
        return result;
    }

    public String addReservation(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-"); //order.covers+"-/-/-"+order.date+"-/-/-"+order.time+"-/-/-"+order.customer_id;+"-/-/-"+order.customer_name
        String covers = arr[0];
        //	5월 26, 2021
//        String newDate[]=arr[1].split(", ");
//        String mmddyy[]=newDate[0].split("월 ");
//        mmddyy[2]=newDate[1];
//        if(mmddyy[1].length()<2)
//            mmddyy[1]="0"+mmddyy[1];
//        String date = mmddyy[2]+"-"+mmddyy[0]+"-"+mmddyy[1];
        String date = arr[1];
//        String[] array = date.split("월 ");          // array[0]는 월, array[1]은 일이랑 년도
//        String[] array2 =array[1].split(", ");      //array2[0]는 일, array2[1]는 년도
//        date = array2[1]+"-"+array[0]+"-"+array2[0];
        String time = arr[2];
        String id = arr[3];
        String name=arr[4];
        Random random = new Random();
        int verifyCode=random.nextInt(100000000);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        List<Map<String, Object>> table = null;
        List<Map<String, Object>> check_walkIn = null;
        List<Map<String, Object>> check_reservation = null;
        try{
            QueryRunner que = new QueryRunner();
            table=que.query(conn,"SELECT * FROM `Table`",new MapListHandler());
            for(int table_id = 1; table_id<=table.size();table_id++){//모든 테이블 좌석 검사
                check_walkIn=que.query(conn,"SELECT * FROM WalkIn WHERE date=? AND time=? AND table_id=?", new MapListHandler(),
                        date,time,table_id);
                check_reservation=que.query(conn,"SELECT * FROM Reservation WHERE date=? AND time=? AND table_id=?", new MapListHandler(),date,time,table_id);
                if(check_walkIn.size()+check_reservation.size()==0){
                    que.query(conn,"INSERT Reservation SET covers=?, date=?,time=?,customer_name=?,customer_id=?, table_id=?;",new MapListHandler(),
                            covers,date,time,name,id, table_id );
                    que.query(conn, "DELETE FROM ReservationRequest WHERE customer_id=? AND time=?", new MapListHandler(), id, time);
                    break;
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        ArrayList<ReservationDTO> result = null;
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationDTO>>() {}.getType());
        return result.get(0).getOid();
    }

    public String checkReservationRequest(String data){
        String arr[] = data.split("-/-/-");
        String time=arr[0];
        String date=arr[1];
        System.out.println(time);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        List<Map<String, Object>> table = null;
        List<Map<String, Object>> check_reservation_request = null;
        List<Map<String, Object>> check_reservation = null;
        try{
            QueryRunner que = new QueryRunner();
            table=que.query(conn,"SELECT * FROM `Table`",new MapListHandler());
            check_reservation_request=que.query(conn,"SELECT * FROM ReservationRequest WHERE date=? AND time=?", new MapListHandler(),date,time);
            check_reservation=que.query(conn,"SELECT * FROM Reservation WHERE date=? AND time=?", new MapListHandler(),date,time);
                if(check_reservation_request.size()+check_reservation.size()==table.size()){
                    return "-1";
                }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
//        ArrayList<ReservationDTO> result = null;
//        Gson gson = new Gson();
//        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationDTO>>() {}.getType());
        return "";
    }
    public String deleteReservation(String data) {    //고객 예약 요청 리스트 추가
//        System.out.println(data+"아잇!");
        String arr[] = data.split("-/-/-"); //data=date+"-/-/-"+time+"-/-/-"+table;
        String date = arr[0];
//        String[] array = date.split("월 ");          // array[0]는 월, array[1]은 일이랑 년도
//        String[] array2 =array[1].split(", ");      //array2[0]는 일, array2[1]는 년도
//        if(array[0].length()==1){
//            array[0]="0"+array[0];
//        }
//        if(array2[0].length()==1){
//            array2[0]="0"+array2[0];
//        }
//        date = array2[1]+"-"+array[0]+"-"+array2[0];
//        System.out.println(date+"아잇!");
        String time=arr[1];
//        System.out.println(time+"아잇!");
        String table_id=arr[2];
//        System.out.println(table_id+"아잇!");
        Connection conn = Config.getInstance().sqlLogin();
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn, "DELETE FROM Reservation WHERE date=? AND time=? AND table_id=?", new MapListHandler(),
                    date, time, table_id);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        return "";
    }
    public String deleteReservationRequest(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-"); //data=date+"-/-/-"+time
        String date = arr[0];
        String time=arr[1];
        Connection conn = Config.getInstance().sqlLogin();
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn, "DELETE FROM ReservationRequest WHERE date=? AND time=?", new MapListHandler(),
                    date, time);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        return "";
    }
    public String modifyReservationRequest(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-"); //data=date+"-/-/-"+time+"-/-/-"+cover+"-/-/-"+name;
        String date = arr[0];
        String time=arr[1];
        String cover=arr[2];
        String name=arr[3];
        String oid=arr[4];
        Connection conn = Config.getInstance().sqlLogin();
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn, "UPDATE ReservationRequest SET date=?, time=?, covers=?, customer_name=? WHERE oid=?", new MapListHandler(),
                    date, time, cover,name,oid);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        return "";
    }
    public String modifyReservation(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-"); //data=date+"-/-/-"+time+"-/-/-"+cover+"-/-/-"+name;
        String date = arr[0];
        String time=arr[1];
        String cover=arr[2];
        String table=arr[3];
        String oid=arr[4];
        List<Map<String, Object>> check_reservation = null;
        List<Map<String, Object>> check_walkIn = null;
        Connection conn = Config.getInstance().sqlLogin();
        try{
            QueryRunner que = new QueryRunner();
            check_reservation=que.query(conn,"SELECT * FROM Reservation WHERE date=? AND time=? AND table_id=?",new MapListHandler(),
                    date, time, table);
            check_walkIn=que.query(conn,"SELECT * FROM WalkIn WHERE date=? AND time=? AND table_id=?",new MapListHandler(),
                    date, time, table);
            if(check_reservation.size()+check_walkIn.size()==0) {
                que.query(conn, "UPDATE Reservation SET date=?, time=?, covers=?, table_id=? WHERE oid=?", new MapListHandler(),
                        date, time, cover, table, oid);
            }
            else return "-1";
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        return "";
    }

    public String recordArrival(String data) {
        String arr[] = data.split("-/-/-"); //data = date+"-/-/-"+time_number+"-/-/-"+table_number;
        String date = arr[0];
        String time=arr[1];
        String table=arr[2];
        SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");

        Date now = new Date();

        String nownow = format.format(now);

        Connection conn = Config.getInstance().sqlLogin();
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn, "UPDATE Reservation SET arrivalTime=? WHERE date=? AND time=? AND table_id=?", new MapListHandler(),
                    nownow, date, time, table);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        return "";
    }

}
