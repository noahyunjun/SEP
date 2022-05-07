package handler.action;

import com.google.gson.Gson;
import handler.dao.Home.HomeDAO;
import handler.dao.Reservation.ReservationDAO;
import handler.dao.Table.TableDAO;
import common.controller.Action;
import common.controller.LoginManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AjaxAction implements Action {
    /**
     * DB를 JSP에서 JAVA로 보낼 때 사용하는 클래스입니다.
     * JSP의 ajax에서 정해준 req, data 값을 가지고 작업을 하게됩니다.
     * req는 필요한 case문을 찾아 들어가는데 사용하고
     * data는 DAO로 넘길 데이터를 의미합니다.
     * data의 경우에는 JSP가 여러 데이터 값을 한줄로 합쳐놓은 상태입니다.
     * 따라서 마지막으로 받는 메소드는 항상 split해줘야 하는지 고민해야 합니다.
     * */

    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
//        System.out.println("1번실행");
        String req = request.getParameter("req"); //JSP에서 넘겨준 req
        String data = request.getParameter("data"); //JSP에서 넘겨준 data
        HttpSession session = request.getSession(); //Session에 있는 정보로 뭔가 해야할 때 사용
        String result=null;
        switch(req) {

            //User 정보 관련
            case "login": //로그인을 가능 여부를 판단하고, 로그인에 성공하는 경우 세션을 업데이트 합니다.
                LoginManager manager = LoginManager.getInstance();
//                System.out.println(data);
                Boolean check = HomeDAO.getInstance().loginCheck(data); //받은 데이터를 일단 loginCheck으로 넘겨서 이 아이디와 비밀번호가 유효한지 검사합니다.
//                System.out.println("check: "+check);
                if (check==false){ //로그인정보 미일치 시
                    return "실패";//실패했다는걸 JSP에게 알려줘야합니다.
                }
                else {//로그인 성공
                    String arr[] = data.split("-/-/-");
                    String id = arr[0];
                    if (manager.isUsing(id)) { //중복 접속 제한
                        manager.removeSession(id); //다른 세션에 접속되어있는 내 계정을 전부 로그아웃 시켜버립니다.
                    }
                    session.setAttribute("user", gson.toJson(HomeDAO.getInstance().getUserInfo(id)));
                    //로그인 정보는 어디서든 사용되므로 세션에 집어 넣습니다. 이 부분은 주로 header.jsp가 getAttribute 할 것으로 예상됩니다.
                    return "성공";//성공했다는 걸 JSP에게 알려줘야 합니다.
                }
            case "signup"://회원가입 시 입력된 정보를 한 줄로 보내줍니다.
                result = HomeDAO.getInstance().signUp(data);
//                System.out.println(data);
                break;
            case "deleteUser"://특정 id의 계정을 삭제합니다.
                HomeDAO.getInstance().deleteUser(data);
                break;
            case "pwReset": //특정 id의 password를 리셋 합니다.
                HomeDAO.getInstance().passwordReset(data);
                break;
            case "reservationRequest":
                result=ReservationDAO.getInstance().addReservationRequest(data);
//                System.out.println(result);
                break;
            case "checkReservationRequest":
                result=ReservationDAO.getInstance().checkReservationRequest(data);
                break;
            case "addReservation":
                result=ReservationDAO.getInstance().addReservation(data);
                break;
            case "deleteReservation":
                result=ReservationDAO.getInstance().deleteReservation(data);
                break;
            case "deleteReservationRequest":
                result=ReservationDAO.getInstance().deleteReservationRequest(data);
                break;
            case "modifyReservationRequest":
                result=ReservationDAO.getInstance().modifyReservationRequest(data);
                break;
            case "modifyReservation":
                result=ReservationDAO.getInstance().modifyReservation(data);
                break;
            case "recordArrival":
                result=ReservationDAO.getInstance().recordArrival(data);
                break;
            case "deleteTable":
                result=TableDAO.getInstance().deleteTable(data);
//                System.out.println(data);
                break;
            case "modifyTable":
                result=TableDAO.getInstance().modifyTable(data);
                break;
            case "addTable":
                result=TableDAO.getInstance().addTable(data);
                break;
        }
        return result;
    }

}