package common.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

/**
 * SFilter 이후에 실행되는 클래스입니다.
 * 톰캣은 web/WEB-INF/web.xml의 설정에 의해 이 클래스를 실행합니다.
 * 톰캣이 url 요청을 분석했을 때, *.avocado의 패턴이 있었다면 Controller 클래스를 실행하게됩니다.
 * *.avocado패턴은 class.properties에서 검색하고, Action 클래스를 실행하게 됩니다.
 * Action클래스가 종료될 때 까지 기다렸다가 Action클래스로부터 return 받은 jsp를 분석하여 톰캣으로 return합니다.
 * */

public class Controller extends HttpServlet{
    /**
     ***
     */
    private static final long serialVersionUID = 1L;

    /**
     ***
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String RequestURI=request.getRequestURI();
        String contextPath=request.getContextPath();
        String command=RequestURI.substring(contextPath.length());
        Action action = null;
        String forward = null;

        ServletContext context = getServletContext();

        //프로퍼티에서 뒤져서 넘어온 .avocado를 찾아서 가져온다
        String fullPath = context.getRealPath("/WEB-INF/class.properties");
        Properties prop = new Properties();
        FileInputStream fis = new FileInputStream(fullPath);

        prop.load(fis);

        fis.close();

        String classPath = prop.getProperty(command);

        try{
            Class<?> url = Class.forName(classPath);
            //이 URL이 액션 타입이다
            action = (Action) url.newInstance();
            try {
                forward = action.execute(request, response); //Action클래스를 실행한 후, 결과값을 forward 변수에 담습니다.
            } catch (Exception e) {
                //세션 잃어버렸는데, 작업을 진행할때
            }
        }catch(ClassNotFoundException ex){
            ex.printStackTrace();
        }catch(InstantiationException ex){
            ex.printStackTrace();
        }catch(IllegalAccessException ex){
            ex.printStackTrace();
        }catch(NullPointerException ex)
        {
            ex.printStackTrace();
        }

/**
 * Action클래스 종료 이후, 반환받았던 변수인 forward를 분석하여 톰캣으로 넘겨줍니다.
 * */

        //return으로 받은 URL(경로?)을 처리
        //톰켓으로 부터 컨트롤러왔는데 처리하고 다시 톰켓한테 돌려준다
        if(forward != null){

            if(forward.contains("RequestDispatcher:"))
            {
                String jspName = (forward.split(":")[1]);
                request.getRequestDispatcher("WEB-INF/" + forward.split(":")[1]).forward(request, response);
            }
            else {
                PrintWriter pr = response.getWriter();
                pr.print(forward);
                pr.flush();
                pr.close();
            }
        }
    }
}
