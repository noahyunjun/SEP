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

    <!-- Libs CSS -->
    <link rel="stylesheet" href="../../../assets/libs/ion-rangeslider/css/ion.rangeSlider.min.css">
    <link rel="stylesheet" href="../../../assets/libs/litepicker/dist/css/litepicker.css">
    <link rel="stylesheet" href="../../../assets/libs/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet"  href="../../../assets/libs/magnific-popup/dist/magnific-popup.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="../../../assets/css/theme.min.css">

    <!-- Libs JS -->
    <script src="../../../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../../../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../../assets/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../../../assets/libs/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
    <script src="../../../assets/libs/prismjs/prism.js"></script>
    <script src="../../../assets/libs/leaflet/dist/leaflet.js"></script>
    <script src="../../../assets/libs/litepicker/dist/litepicker.js"></script>
    <script src="../../../assets/libs/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
    <script src="../../../assets/libs/inputmask/dist/jquery.inputmask.min.js"></script>

    <!-- clipboard -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.12/clipboard.min.js"></script>

    <!-- Theme JS -->
    <script src="../../../assets/js/theme.min.js"></script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<main class="form-signin">
    <!-- sign in -->
    <div class="min-vh-100 d-flex align-items-center " style="background:url(../../../assets/images/signUp.jpg)no-repeat; background-size: cover;">
        <div class="container">
            <div class="row">
                <div class="offset-lg-3 col-lg-6 col-12">
                    <div class="bg-dark p-4 p-lg-8 rounded-3">
                        <form>
                            <h1 class="mb-2 text-white">Welcome</h1>
                            <p class="mb-4">Today will be great! </p>
                            <div class="mb-3">
                                <label for="floatingInput" class="form-label text-white-50">Username </label>
                                <input type="text" id="floatingInput" class="form-control border-0" placeholder="Username" required="" />
                            </div>
                            <div class="mb-3 mb-4">
                                <label for="floatingPassword" class="form-label  text-white-50">Password</label>
                                <input type="password" id="floatingPassword" class="form-control border-0" placeholder="Password" required="" />
                            </div>
                            <div class="d-grid">
                                <button class="btn btn-primary" type="submit" id="login_button">
                                    LOGIN
                                </button>
                            </div>
                            <div class="d-lg-flex justify-content-between mt-4 mb-3 ">
                                <p class="text-muted font-14">
                                    Don't have an account yet? <a href="signupPage.sep">Sign up</a>
                                </p>
                                <p class="font-14">
                                    <a href="#">Forget Password</a>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
