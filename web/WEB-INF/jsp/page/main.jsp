<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
    <title>Restaurant</title>

</head>
<body>
<%@include file="../common/header.jsp" %>
<%
    //System.out.println("user : "+user);
%>
<main>
    <!-- restaurantMain section -->
    <div style="background-image: url(../../../assets/images/rBVaV16ME3eAdZTLAABRmPam0NI216.jpg); background-size: cover; background-repeat: no-repeat; background-position: center; height: 580px;">
        <div class="container">
            <div class="row">
                <%--                <div class="offset-lg-2 col-lg-8 col-md-12 col-12">--%>
                <%--                    <div class="pt-17 pb-13 pt-lg-19 pb-lg-19 text-center text-light">--%>
                <div class="container">
                    <div class="row">
                        <div class="offset-lg-2 col-lg-8 col-md-12 col-12">
                            <div class="pt-17 pb-13 pt-lg-18 pb-lg-15 text-center text-light">
                                <img src="../../../assets/images/logo_transparent.png" alt="">
                                <div class="carousel-inner">
                                    <div class="container pt-5 pb-5">
                                        <p style="font-family: 'Noto Serif KR', serif;"><a class="btn btn-lg btn-dark"
                                                                                           href="reservation.sep">예약
                                            하기</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--                </div>--%>
        </div>
    </div>
    </div>


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->


    <!-- START THE FEATURETTES -->
    <%--    <hr class="featurette-divider" style="color: black">--%>

</main>


<script src="js/bootstrap.bundle.min.js"></script>

<%@include file="../common/footer.jsp" %>
</body>
</html>


