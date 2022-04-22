package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * [중요] 21-07-07자로 생긴 개념입니다.
 * CustomAction은 기존 프로젝트와 가장 큰 차이점 중 하나라고 볼 수 있는 클래스로
 * 기존의 각종 Action클래스에서 중복되어 사용되던 코드를 모아 만들었습니다.
 * 이전 프로젝트에서의 각종 Action클래스(이하 *Action 클래스)들은 Action Interface를 implements하여 execute 메소드(요청과 응답하는 간단한 역할)를 오버라이딩 하는 것에 그쳤습니다.
 * 기존 *Action 클래스들은 이로인해 자주 사용되는 setAttribute메소드나 getAttribute 메소드를 반복하여 사용해야 했고, 이는 코드 파편화의 주범이 되었습니다.
 * 예를 들어 로그인 한 사용자의 정보나 타입을 매번 Action 클래스 상단에 넣어야 했고, 페이지를 만들 때 페이지 메뉴나, 헤더의 메뉴들을 매 Action 클래스마다 불러와야 했습니다.
 * 페이지를 구성하는데 있어 기본 환경설정 하느라 정작 중요한 컨텐츠 개발에 집중 하는 것을 방해하고, 변수명 파편화나 각종 오류를 유발하는 것을 막기 위해
 * 관습적으로 자주 사용되는 메소드를 모아 CustomAction에 모았습니다.
 * 이 클래스를 상속(extends) 받고, super.execute(request,response); 해버리면
 * 헤더나 페이지의 기본적인 요소들을 설정(setAttribute)하는 것을 대신 해주므로 일절 신경쓰지 않아 해당 JSP의 컨텐츠 개발에만 집중할 수 있게 됩니다.
 * (Java의 기본 정책에 의해) super.를 통해 상속받더라도 getAttribute는 각자의 *Action에서 해주셔야 하는 것이 일반적입니다.
 *
 * 이 클래스를 상속받지 않고, 기존 방식 처럼 Action Interface를 implements해도 되는 경우는 다음과 같습니다.
 * 1. jsp에서 헤더, 페이지 등을 구현하지 않는 클래스다. (예를들어 업로드나 다운로드, Ajax나 로그인 등, 직접적인 JSP구현에 관련이 없는 클래스)
 *
 * 위 경우를 제외하고는 이 클래스를 상속 받는 것이 유지보수 측면에서도 매우 옳습니다.
 * 이 클래스를 상속받지 않고, 기존 방식처럼 Action만 implements 하는 경우에는
 * 한 개의 setAttribute 변수를 바꾸기 위해 수많은 클래스를 수정해야 하고,
 * 매 Action 클래스마다 코드가 수십줄 씩 늘어납니다.
 * 이 주석 아래에 나오는 메소드 대부분이 매 Action 클래스마다 등장해야한다고 해도 과언이 아닙니다.
 *
 * Header 또는 Page를 사용하려는 Action은 반드시 이 클래스를 상속받아야 합니다.
 * 여기에 있는 설정들이 있어야 Header가 제대로 동작합니다.
 *
 * 앞으로의 유지보수를 위해서도 이 클래스를 상속하는 것을 절대 강권합니다.
 * */

public class CustomAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return null;
    }
}
