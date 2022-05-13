<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-09
  Time: 오전 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /**[윤주현]
     * session에서 user의 정보를 받아옵니다.
     * user를 setAttribute하고 있는 곳은 src/com/se/team4/application/domain/AjaxAction 클래스의
     * session.setAttribute("user", gson.toJson(HomeDAO.getInstance().getUserInfo(id))); 입니다.
     * 로그인을 하지 않은 경우 user는 null입니다.
     * 즉, 로그인 정보는 이 header.jsp가 include되는 어느 곳에서든 따라다니게 되므로 user 사용이 어디서나 가능하게 됩니다.
     */
    String user = (String) session.getAttribute("user");
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


    <title>System</title>
    <script src="js/jquery-3.2.1.min.js"></script>

    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-table.js"></script>
    <script src="/js/bootstrap-table-cookie.js"></script>
    <script src="/js/bootstrap-table-export.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/carousel/">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<header>
    <div>
        <!-- header -->
        <div class="header fixed-top border-3 border-top border-primary">
            <!-- navigation start -->
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-default">
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
                        <ul class="navbar-nav ms-auto me-lg-3 ">
                            <li class="nav-item dropdown disabled">
                                <a class="nav-link d-lg-none" href="#">
                                    Menu
                                </a>
                            </li>


                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="menu-3" data-bs-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">
                                    Blog
                                </a>
                                <ul class="dropdown-menu dropdown-menu-arrow  dropdown-menu-xl-left "
                                    aria-labelledby="menu-3">
                                    <li>
                                        <a class="dropdown-item" href="./pages/blog.html">
                                            Blog
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="./pages/blog-author.html">
                                            Blog Author
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="./pages/blog-category.html">
                                            Blog Category
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="./pages/blog-classic.html">
                                            Blog Classic
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="./pages/blog-single.html">
                                            Blog Single
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="menu-4" data-bs-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">
                                    Resources
                                </a>
                                <ul class="dropdown-menu dropdown-menu-md dropdown-menu-arrow  dropdown-menu-xl-left "
                                    aria-labelledby="menu-4">
                                    <li class="dropdown-submenu">
                                        <a class="dropdown-list-group-item dropdown-toggle" href="#">
                                            <h4 class="h5 ">Case Study <span
                                                    class="text-primary font-12 ms-1">(New)</span></h4>
                                            <p class="text-muted mb-0 font-12">
                                                Case Study Element Design
                                            </p>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-lg-right">
                                            <li>
                                                <a class="dropdown-item" href="./pages/case-studies.html">
                                                    Case Study</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="./pages/case-study-single.html">
                                                    Single</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="dropdown-submenu">
                                        <a class="dropdown-list-group-item dropdown-toggle" href="#">
                                            <h4 class="h5">Help Center </h4>
                                            <p class="text-muted mb-0 font-12">
                                                Beautiful help center design.
                                            </p>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-lg-right">
                                            <li>
                                                <a class="dropdown-item" href="./pages/help-center.html">
                                                    Help</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="./pages/help-center-category.html">
                                                    Category</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="dropdown-submenu">
                                        <a class="dropdown-list-group-item dropdown-toggle" href="#"
                                           data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <h4 class="h5">Webinar</h4>
                                            <p class="text-muted mb-0 font-12">
                                                Webinar Landing Page Design
                                            </p>
                                        </a>
                                    </li>

                                    <li>
                                        <a class="dropdown-list-group-item" href="./pages/book-download-page.html">
                                            <h4 class="h5">Download Book</h4>
                                            <p class="text-muted mb-0 font-12">
                                                Download the book for guide.
                                            </p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="menu-5" data-bs-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">
                                    Account
                                </a>
                                <ul class="dropdown-menu dropdown-menu-arrow  dropdown-menu-xl-left "
                                    aria-labelledby="menu-5">
                                    <li class="dropdown-submenu ">
                                        <a class="dropdown-item dropdown-toggle" href="#">
                                            Sign In
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-lg-right">
                                            <li>
                                                <a class="dropdown-item" href="./pages/signin-cover.html">
                                                    Side Cover </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="./pages/signin.html">
                                                    Basic</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="dropdown-submenu ">
                                        <a class="dropdown-item dropdown-toggle" href="#">
                                            Sign Up
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-lg-right">
                                            <li>
                                                <a class="dropdown-item" href="./pages/signup-cover.html">
                                                    Side Cover </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="./pages/signup.html">
                                                    Basic</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li class="dropdown-submenu ">
                                        <a class="dropdown-item dropdown-toggle" href="#">
                                            Password Reset
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-lg-right">
                                            <li>
                                                <a class="dropdown-item" href="./pages/password-reset-cover.html">
                                                    Side Cover</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="./pages/password-reset.html">
                                                    Basic</a>
                                            </li>
                                        </ul>
                                    </li>

                                </ul>
                            </li>
                        </ul>
                        <div class="header-btn ">
                        </div>
                    </div>
                </nav>
            </div>
            <!-- navigation close -->
        </div>
    </div>
</header>