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
            list = queryRunner.query(conn, "SELECT * FROM reservations", new MapListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
                DbUtils.closeQuietly(conn);
            }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationRequestDTO>>() {
        }.getType());
        System.out.println(list);
        System.out.println(result.get(0).getReserv_date());
        return result;
    }
    public ArrayList<ReservationRequestDTO> getUserReservationRequest(String id) {  //고객 예약 리스트 db 불러오기
        ArrayList<ReservationRequestDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM reservations WHERE reserv_user=?", new MapListHandler(), id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationRequestDTO>>() {
        }.getType());
         System.out.println(list);
//         System.out.println(result.get(0).getDate());
        return result;
    }
    public ArrayList<ReservationDTO> getUserReservation(String id) {  //고객 예약 리스트 db 불러오기
        ArrayList<ReservationDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM reservations WHERE reserv_user=?", new MapListHandler(), id);
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

//여기 수정 필요.
    public ArrayList<ReservationDTO> getReservationList(String date) {  //고객 예약 리스트 db 불러오기
        ArrayList<ReservationDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM reservations WHERE date=?", new MapListHandler(), date);
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

    //여기 작업중.
    public String addReservationRequest(String data) {    //고객 예약 요청 리스트 추가
        System.out.println("data : "+data);
        String[] arr = data.split("-/-/-");
        System.out.println("arr : "+ Arrays.toString(arr));
        String date = arr[0];
        String time = arr[1];
        String name = arr[2];
        String id = arr[3];
        String NOP = arr[4];
        String table_num = arr[5];
        System.out.println("date : "+ date);
        System.out.println("id : "+ id);
        List<Map<String, Object>> check_reservation = null;
        List<Map<String, Object>> check_walkIn = null;//도착을 했는가?
        List<Map<String, Object>> table = null;
        Random random = new Random();
        int verifyCode=random.nextInt(100000000);// 뭐에 쓰는 것인교

        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        try{
            QueryRunner que = new QueryRunner();
            table=que.query(conn,"SELECT * FROM restaurant_table",new MapListHandler());
            check_reservation=que.query(conn,"SELECT * FROM reservations WHERE reserv_date=? AND reserv_time=? AND reserv_table_num=? ", new MapListHandler(),
                    date,time, table_num); // 그 테이블에 예약이 존재 하는가?

            System.out.println("check resev"+check_reservation);
            if(check_reservation.size()>0){
                return "-1";
            }// 그 테이블의 예약이 존재할시 -1을 반환하여 예약이 불가능하게 출력한다.

            else {
                que.update(conn, "INSERT reservations SET reserv_user=?, reserv_userId=?, reserv_date=?, reserv_time=?,reserv_NOP=? ,reserv_table_num=?, r_code=?;",
                         name, id, date, time,NOP,table_num,verifyCode);
          System.out.println("insert 실행 완료");
                list = que.query(conn, "SELECT * FROM reservations WHERE reserv_user=?", new MapListHandler(), name);
                System.out.println(list);
            }

        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        ArrayList<ReservationRequestDTO> result = null;
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationRequestDTO>>() {}.getType());
        System.out.println("result: "+result.get(0).getReserv_user());
        String oid = result.get(0).getReserv_user();
        System.out.println("oid: "+oid);
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
        String[] arr = data.split("-/-/-"); //order.covers+"-/-/-"+order.date+"-/-/-"+order.time+"-/-/-"+order.customer_id;+"-/-/-"+order.customer_name
        String covers = arr[0];
        String date = arr[1];
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
        //selectTime에서 받아온 time과 date를 split해서 배열에 담는 과정입니다.
//        System.out.println("date: " +date);
//        System.out.println("time: "+time);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        List<Map<String, Object>> table = null;
        List<Map<String, Object>> check_reservation_request = null;
        List<Map<String, Object>> check_reservation = null;
        try{
            QueryRunner que = new QueryRunner();
            table=que.query(conn,"SELECT * FROM restaurant_table",new MapListHandler());
            check_reservation_request=que.query(conn,"SELECT * FROM reservations WHERE reserv_date=? AND reserv_time=?", new MapListHandler(),date,time);
            check_reservation=que.query(conn,"SELECT * FROM reservations WHERE reserv_date=? AND reserv_time=?", new MapListHandler(),date,time);
//            System.out.println("table : "+table);
//            System.out.println("check request: "+check_reservation_request);
//            System.out.println("check reservation : "+check_reservation);
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
        return "";
    }
    public String deleteReservation(String data) {    //고객 예약 요청 리스트 추가
        String[] arr = data.split("-/-/-"); //data=date+"-/-/-"+time+"-/-/-"+table;
        String date = arr[0];
        String time=arr[1];
        String table_id=arr[2];
        Connection conn = Config.getInstance().sqlLogin();
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn, "DELETE FROM reservations WHERE reservation_date=? AND reservation_time=? AND table_id=?", new MapListHandler(),
                    date, time, table_id);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        return "";
    }
    //삭제 예정
    public String deleteReservationRequest(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-"); //data=date+"-/-/-"+time
        String date = arr[0];
        String time=arr[1];
        Connection conn = Config.getInstance().sqlLogin();
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn, "DELETE FROM reservations WHERE date=? AND time=?", new MapListHandler(),
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
