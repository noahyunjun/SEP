<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String user = (String) session.getAttribute("user");
    /**
     * session에서 user의 정보를 받아옵니다.
     * user를 setAttribute하고 있는 곳은 AjaxAction 클래스의
     * session.setAttribute("user", gson.toJson(HomeDAO.getInstance().getUserInfo(id))); 입니다.
     * 로그인을 하지 않은 경우 user는 null입니다.
     * 즉, 로그인 정보는 이 header.jsp가 include되는 어느 곳에서든 따라다니게 되므로 user 사용이 어디서나 가능하게 됩니다.
     */
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

    <!-- 2022-05-13 YB ADD -->
    <!-- Libs CSS -->
    <link rel="stylesheet" href="../../../assets/libs/ion-rangeslider/css/ion.rangeSlider.min.css">
    <link rel="stylesheet" href="../../../assets/libs/litepicker/dist/css/litepicker.css">
    <link rel="stylesheet" href="../../../assets/libs/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../../../assets/libs/magnific-popup/dist/magnific-popup.css">

    <!-- 2022-05-13 YB ADD -->
    <!-- Theme CSS -->
    <link rel="stylesheet" href="../../../assets/css/theme.css">

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


    <script src="js/jquery-3.2.1.min.js"></script>

    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-table.js"></script>
    <script src="/js/bootstrap-table-cookie.js"></script>
    <script src="/js/bootstrap-table-export.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/carousel/">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        img {
            size: auto;
        }
    </style>
</head>
<header>
    <div>
        <!-- header -->
        <div class="header fixed-top border-3 border-top border-primary" style="height:90px;">
            <!-- navigation start -->
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-default" >
                    <a class="navbar-brand" style="color:#ff5938" href="main.sep"><h2>SW Rest</h2></a>
                    <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbar-default" aria-controls="navbar-default" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="icon-bar top-bar mt-0"></span>
                        <span class="icon-bar middle-bar"></span>
                        <span class="icon-bar bottom-bar"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbar-default">
                        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbar-default" aria-controls="navbar-default" aria-expanded="false"
                                aria-label="Toggle navigation">
                            <i class="fas fa-times"></i>
                        </button>
                        <ul class="navbar-nav ms-auto me-lg-3">
                            <li class="header-btn" style="margin-right: 10px;">
                                <p style="font-family: 'Noto Serif KR', serif;"><a class="btn btn-lg btn-dark" href="userReservationInfo.sep">마이페이지</a></p>
                            </li>
                            <li class="header-btn">
                                <div id="login"></div>
                            </li>
                        </ul>

<%--                        <div class="header-btn ">--%>
<%--                            <a style="font-family: 'Noto Serif KR', serif;" href="loginPage.sep"--%>
<%--                               class="btn btn-primary btn-sm ">로그인</a>--%>
<%--                        </div>--%>
                        <!--
                        <div class="d-flex">
                            <%--                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
                            <div id="login"></div>
                        </div>
                        -->
                    </div>
                </nav>
            </div>
            <!-- navigation close -->
        </div>
    </div>
</header>
<script>
    $(document).ready(function(){ //이 파일이 시작되면 자동으로 실행됩니다.
        loginInfo();
    })
    function loginInfo(){ //로그인 여부에 따라 버튼을 바꿔주는 역할
        var user = <%=user%>;
        var list = $('#login');
        var a = '';
        if (user==null){//미로그인 상태
            a+= '<button id="login" class="btn btn-lg btn-dark" style="font-family: \'Noto Serif KR\', serif;" onclick="goToLoginPage()">로그인</button>';
        }
        else {//로그인 상태
            // alert(user.type+'의 접속');
                a+= '<button id="logout" class="btn btn-lg btn-dark" style="font-family: \'Noto Serif KR\', serif;" onclick="logout()">로그아웃</button>';
        }
        list.append(a);
    }
    function goToLoginPage(){
        location.href='loginPage.sep';
    }
    function logout(){
        location.href='logout.sep';
    }
</script>