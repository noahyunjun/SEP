package handler.action.reservation;

import com.google.gson.Gson;
import handler.dao.Reservation.ReservationDAO;
import common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SelectTimeAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null) { //로그인하지 않은 사용자의 경우에만 로그인 페이지를 띄워줌
            request.setAttribute("error", "로그인이 필요한 서비스 입니다.");
            return "RequestDispatcher:jsp/page/login.jsp";
        }
        else {
            String date = request.getParameter("date"); //이전 페이지로부터 date 파라미터를 받아서
            Gson gson = new Gson();
            request.setAttribute("date", gson.toJson(date));//다음 페이지로 date 파라미터를 그대로 넘기고
            request.setAttribute("getSchedule", gson.toJson(ReservationDAO.getInstance().getSchedule(date))); //해당 date의 스케쥴을 돌려줌 (미완성)
            return "RequestDispatcher:jsp/reservation/selectTime.jsp";
        }
    }
}
