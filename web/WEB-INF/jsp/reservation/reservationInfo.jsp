<%--
  Created by IntelliJ IDEA.
  User: 최예슬
  Date: 2021-05-15
  Time: 오전 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String date = (String) request.getAttribute("date");
    String time = (String) request.getAttribute("time");
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>Little4 Restaurant ReservationInfo</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
    <title>RESERVATION info</title>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="css/form-validation.css" rel="stylesheet">

</head>
<body class="bg-light vsc-initialized">
<%--header를 이런식으로 include해서 끼워넣습니다. 이 작업은 매 페이지마다 필요해요.--%>
<%@include file="../common/header.jsp" %>
<div class="container">
    <main>
        <div class="py-5 text-center">
            <h2 style="font-family: 'Noto Serif KR', serif;">예약 정보</h2>
            <p class="lead" style="font-family: 'Noto Serif KR', serif;">예약하실 고객님의 정보를 입력해주세요.</p>
        </div>
        <div>


        <%--            <form class="needs-validation was-validated" novalidate="">--%>
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="reservationDate" class="form-label" style="font-family: 'Noto Serif KR', serif;">방문 날짜</label>
                        <input type="text" class="form-control"style="font-family: 'Noto Serif KR', serif;"  id="reservationDate" placeholder="" value=<%=date%> required="" readonly>
                        <div class="invalid-feedback">
                            방문하실 날짜를 입력하세요.
                        </div>
                    </div>
<%--            <input id="reservationDate" placeholder="reservationDate">--%>

                    <div class="col-sm-6">
                        <label for="reservationTime" class="form-label" style="font-family: 'Noto Serif KR', serif;">방문 시간</label>
                        <input type="text" class="form-control" style="font-family: 'Noto Serif KR', serif;" id="reservationTime" placeholder="" value=<%=time%> required="" readonly>
                        <div class="invalid-feedback" style="font-family: 'Noto Serif KR', serif;">
                            방문하실 시간을 입력하세요.
                        </div>
                    </div>
<%--            <input id="reservationTime" placeholder="reservationTime">--%>

                    <div class="col-sm-6" id = "userID"></div>
<%--            <input id="userid" placeholder="admin">--%>
                    <div class="col-sm-6" id = "userName"></div>
<%--            <input id="username" placeholder="홈페이지관리자">--%>

                    <div class="col-12">
                        <label for="covers" class="form-label" style="font-family: 'Noto Serif KR', serif;">인원수</label>
<%--                        <input type="text" class="form-control" style="font-family: 'Noto Serif KR', serif;" id="covers" placeholder="인원수를 입력하세요" required="" >--%>
                        <select id="covers" class="form-control">
                            <option value="1">1명</option>
                            <option value="2">2명</option>
                            <option value="3">3명</option>
                            <option value="4">4명</option>
                            <option value="5">5명</option>
                        </select>
                        <div class="invalid-feedback" style="font-family: 'Noto Serif KR', serif;">
                            함께 오시는 인원 수를 입력하세요.
                        </div>
                    </div>
                </div>
                <hr class="my-4">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="save-info">
                    <label class="form-check-label" for="save-info" style="font-family: 'Noto Serif KR', serif;">이 정보를 다음에도 사용하시겠습니까?</label>
                </div>
            <button></button>
    </main>
</div>
<%@include file="../common/footer.jsp" %>
</div>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/form-validation.js"></script>
</body>
<script>
    $(document).ready(function(){
        makeID();
        makeName();
    })
    function makeID(){
        var user=<%=user%>;
        var list = $('#userID');
        var text='';
        text += '<label for="userid" class="form-label">고객 아이디</label>'
            +'<div class="input-group has-validation"><span class="input-group-text">@</span>'
            +'<input type="text" class="form-control" id="userid" placeholder="Customer ID" value="'+user.id+'" required="" readonly>'
            +'<div class="invalid-feedback">고객 아이디를 입력하세요</div></div>';
        list.append(text);
    }
    function makeName(){
        //현재 user name DB에서 안받아와짐; 소소한 버그라 나중에 픽스 예정
        var user=<%=user%>;
        var list = $('#userName');
        var text='';
        text+='<label for="username" class="form-label">방문자 성함</label>'
            +'<input type="text" class="form-control" id="username" placeholder="" value="'+user.name+'" required="" readonly>'
            +'<div class="invalid-feedback">방문하실 시간을 입력하세요.</div>';
        list.append(text);
    }

    function completeReservationRequest(){  //예약요청 데이터를 ajax로 전달하는 함수
        var date = $('#reservationDate').val();
        var time = $('#reservationTime').val();
        //var covers = $('#covers').val();
        var name = $('#username').val();
        var id = $('#userid').val();
        var data = date+'-/-/-'+time+'-/-/-'+name+'-/-/-'+id;
        //예약 데이터 한줄로 묶어버리기
        var check =  swal({
                title : '예약을 하시겠습니까?',
                icon : 'info',
                button: '확인'
            }).then((check)  => {
                if(check) {
                    $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                        url: "ajax.sep", //ajax.do(ajaxAction)에 있는
                        type: "post",
                        data: {
                            req: "reservationRequest",
                            data: data
                        },
                        success: function (oid) {
                            if(oid=="-1"){
                                swal({
                                    title: '예약 실패!',
                                    text: "해당 시간은 만석입니다!\n다시 예약해주세요.",
                                    icon: 'error',
                                    button: '확인'
                                }).then(function () {
                                    location.href = 'main.sep';
                                });
                            }
                            else {
                                swal({
                                    title: '예약 성공!',
                                    text: "[예약번호:" + oid + "]의 예약 요청이 정상적으로 요청되었습니다.",
                                    icon: 'success',
                                    button: '확인'
                                }).then(function () {
                                    location.href = 'main.sep';
                                });
                            }
                        }
                    })
                }

            });
    }



</script>
</html>
