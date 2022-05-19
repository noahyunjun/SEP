package handler.action.user;

import com.google.gson.Gson;
import handler.dao.Reservation.ReservationDAO;
import common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserReservationInfoAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        String date = request.getParameter("date"); //이전 페이지로부터 date 파라미터를 받음
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        System.out.println("URA user : "+ id);
        Gson gson = new Gson();
        if(session.getAttribute("user") == null){
            return "RequestDispatcher:jsp/page/error.jsp";
        }
        else{
            request.setAttribute("ReservationRequest", gson.toJson(ReservationDAO.getInstance().getUserReservationRequest(id)));
            request.setAttribute("Reservation", gson.toJson(ReservationDAO.getInstance().getUserReservation(id)));
            request.setAttribute("id",id);
        }
        return "RequestDispatcher:jsp/user/userReservationInfo.jsp";
    }
}
