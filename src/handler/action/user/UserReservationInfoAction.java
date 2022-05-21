package handler.action.user;

import com.google.gson.Gson;
import common.controller.Action;
import handler.dao.Reservation.ReservationDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserReservationInfoAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String date = request.getParameter("date"); //이전 페이지로부터 date 파라미터를 받음
//        String id = request.getParameter("ID");
        String id = (String) session.getAttribute("ID");
//        System.out.println("Action date : "+ date);
//        System.out.println("Action id : "+ id);

//        System.out.println("URA user : "+ id);
        Gson gson = new Gson();
        if(session.getAttribute("user") == null){
            return "RequestDispatcher:jsp/page/error.jsp";
        }
        else{

            request.setAttribute("ReservationRequest", gson.toJson(ReservationDAO.getInstance().getUserReservationRequest(id)));
            request.setAttribute("Reservation", gson.toJson(ReservationDAO.getInstance().getUserReservation(id)));
            request.setAttribute("id",id);
//            System.out.println("reservationRequest : "+ ReservationRequest);


        }
        return "RequestDispatcher:jsp/user/userReservationInfo.jsp";
    }
}
