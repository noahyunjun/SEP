<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-05
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
<%
    /**
     * login시 입력한 ID와 PW를 한줄의 String으로 만들어서 AjaxAction 클래스로 보냅니다.
     * */
    String errorMessage = (String) request.getAttribute("error");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>
    <title>Little4 Restaurant LOGIN</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@800&family=Oswald:wght@300&display=swap" rel="stylesheet">

</head>
<body>
<%@include file="../common/header.jsp" %>
<main class="form-signin">
    <form>
        <h1 class="h3 mb-3 fw-normal text-center " style="font-family: 'Noto Serif KR', serif;">Log-In</h1>
        <div class="form-floating">
            <input type="text" class="form-control btn-outline-dark " id="floatingInput" placeholder="id">
            <label for="floatingInput">ID</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control btn-outline-dark" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>
        <button type="button" id="login_button" >로그인하기</button>
        <div class="mb-3">
            <a style="font-size: 20px; color: black; font-family: 'Noto Serif KR', serif;" href="signupPage.sep">회원
                가입하기</a>
        </div>


        <%--        class="w-100 btn btn-lg btn-dark" style="font-family: 'Noto Serif KR', serif;"--%>
<%--        onclick="button()"--%>
    </form>
</main>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</body>
<script>
    $(document).ready(function () { //이 파일이 시작되면 자동으로 실행됩니다.
        errorAlert();
    })

    function errorAlert() {
        var errorMessage = "<%=errorMessage%>";
        if (errorMessage != 'null')
            swal({
                title: '잠깐!',
                text: errorMessage,
                icon: 'info',
                button: '확인',
            });
    }


    $("#login_button").click(function () {
        let id = $('#floatingInput').val();
        let pw = $('#floatingPassword').val();
        let data = id + "-/-/-" + pw; //데이터를 1줄로 합침.

        $.ajax({
            url: "ajax.sep",
            type: "post",
            data: {
                req: "login", //AjaxAction 클래스에다가 req값을 전달해줍니다.
                data: data //AjaxAction 클래스에다가 data값을 전달해줍니다.
            },
            success: function (login) { //login은 ajaxAction 클래스가 return해준 값을 담는 변수 이름입니다.
                if (login == "성공") {
                    swal({
                        title: '로그인 성공!',
                        text: 'Restaurant에 오신 걸 환영합니다.',
                        icon: 'success',
                        button: '확인',

                    }).then(function () {
                        window.location.href = "main.sep"
                    });
                } else {
                    swal({
                        title: '로그인 실패!',
                        text: '다시 입력해주세요!',
                        icon: 'error',
                        button: '확인',
                    }).then(function () {
                        location.reload();
                    });
                }
            }
        })

    });
</script>
</html>
