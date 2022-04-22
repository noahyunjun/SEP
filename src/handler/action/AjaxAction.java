package handler.action;


import com.google.gson.Gson;
import common.controller.Action;
import handler.dao.user.UserDAO;
import handler.dao.with.BbsDAO;
import handler.dao.with.WithDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AjaxAction implements Action {
    /**
     * DB를 JSP에서 JAVA로 보낼 때 사용하는 클래스입니다.
     * JSP의 ajax에서 정해준 req, data 값을 가지고 작업을 하게됩니다.
     * req는 필요한 case문을 찾아 들어가는데 사용하고
     * data는 DAO로 넘길 데이터를 의미합니다.
     * data의 경우에는 "일반적으로" JS가 여러 데이터 값을 한줄로 합쳐놓은 상태입니다.
     * 따라서 마지막으로 받는 메소드는 항상 split해줘야 하는지 고민해야 합니다.
     * */


    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        String req = request.getParameter("req"); //JSP에서 넘겨준 req
        HttpSession session = request.getSession(); //Session에 있는 정보로 뭔가 해야할 때 사용
        String data = request.getParameter("data"); //JSP에서 넘겨준 data
        String result=null;
        System.out.println(req);
        System.out.println(data);

        switch(req) {
            case "signup":
                String google_id = (String) session.getAttribute("google_id");
                result= UserDAO.getInstance().addUser(data, google_id);
                break;
            case "insertBbs":
                System.out.println(data);
                result= BbsDAO.getInstance().insertBbs(data);
                break;
            case "saveInformation":
                result= WithDAO.getInstance().saveInformation(data);
                break;
        }

        return result;
    }
}