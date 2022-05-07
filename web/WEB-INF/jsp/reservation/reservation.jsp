<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<head>
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="css/cover.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@800&family=Oswald:wght@300&display=swap" rel="stylesheet">
    <title>RESERVATION</title>

</head>
<html>
<body class="text-center text-white bg-white">
<%--header를 이런식으로 include해서 끼워넣습니다. 이 작업은 매 페이지마다 필요해요.--%>
<%@include file="../common/header.jsp" %>
<div class= "cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <main class="px-3">
        <br>
        <h1 style="font-family: 'Noto Serif KR', serif; color: black" >Reservation</h1>
        <p class="lead" style="font-family: 'Noto Serif KR', serif; color: black">예약하실 날짜를 선택해 주세요.</p>
        <div class="col-md-12">
<%--            <label for="reservationDate">예약 일정 조회</label>--%>
            <input type="date" class="form-control" id="reservationDate" name="new_date" value='' placeholder="Date of Birth" required>
        </div>
        <br>
        <br>
        <p class="lead">
            <button class="btn btn-lg btn-dark fw-bold bg-black" style="font-family: 'Noto Serif KR', serif;" onclick="goToSelectTime()">이 날짜로 예약하기</button>
        </p>
    </main>
</div>
<script src="js/bootstrap.bundle.min.js"></script>
<%--<%@include file="../common/footer.jsp" %>--%>
<img src="img/sea.jpg" style="width: 100%; height: auto">
</body>
<%@include file="../common/footer.jsp" %>
<script>
function goToSelectTime(){
    var date=$('#reservationDate').val();
    if(date!=''){
        location.href='selectTime.sep?date='+date;

    }
    else {
        swal({
            title : '날짜를 선택해주세요!',
            icon : 'error',
            button : '확인',
        });
    }
}
</script>
</html>
