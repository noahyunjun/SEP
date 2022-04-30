<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-09
  Time: 오전 4:39
  To change this template use File | Settings | File Templates.
--%>
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
<main>

    <%--    슬라이드에 등록할 사진과 설명을 정해줍니다.--%>
    <div class="carousel-inner">
        <div class="container">
            <p style="font-family: 'Noto Serif KR', serif;"><a class="btn btn-lg btn-dark" href="loginPage.sep">로그인 하러 가기</a></p>
        </div>
    </div>


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
    <div>
        <div>

            <h2 style="font-family: 'Noto Serif KR', serif;">테이블 예약하기</h2>
            <p style="font-family: 'Noto Serif KR', serif;">원하는 날짜와 시간에 예약을 하실 수 있습니다.</p>
            <p style="font-family: 'Noto Serif KR', serif;"><a class="btn btn-dark" href="reservation.sep">예약 하기</a>
            </p>
        </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->
    <hr class="featurette-divider" style="color: black">


</main>


<script src="js/bootstrap.bundle.min.js"></script>

<%@include file="../common/footer.jsp" %>
</body>
</html>
