package handler.action.reservation;

import common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReservationAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null) { //로그인하지 않은 사용자의 경우에만 로그인 페이지를 띄워줌
            request.setAttribute("error", "로그인이 필요한 서비스 입니다.");
            return "RequestDispatcher:jsp/page/login.jsp";
        }
        else{
//            System.out.println("ReAction 실행되었습니다.");
            return "RequestDispatcher:jsp/reservation/reservation.jsp";
        }
    }
}
