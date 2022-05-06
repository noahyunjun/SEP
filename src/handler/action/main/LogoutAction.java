package handler.action.main;


import common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogoutAction implements Action {

    /**
     * session에 있는 로그인 정보를 없애버리는 역할을 합니다.
     * */
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("Index");
        return null;
    }
}
