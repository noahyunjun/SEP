
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String ReservationRequest = (String) request.getAttribute("ReservationRequest");
    String Reservation = (String) request.getAttribute("Reservation");
    String Order = (String) request.getAttribute("Order");
    String id=(String) request.getAttribute("id");


%>
<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <link href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
    <title>Little4 Restaurant USER</title>

</head>
<body>
<%@include file="../common/header.jsp" %>
<%
System.out.println("user2: "+user);
%>
<br>
<br>
<h1 class="text-center" style="font-family: 'Noto Serif KR', serif;">My Page</h1>
<div id="container" class="py-5 row text-center" style="font-family: 'Noto Serif KR', serif;">
    <div class="col-lg-7 mx-auto">
        <div style="font-size: 20px; font-weight: bold">예약신청 현황</div>
        <table
                id="reservationRequestTable"
                data-toggle="table"
                data-height="460"
                data-search="true"
                data-show-search-button="true"
                data-pagination="true"
                data-side-pagination="server">
            <thead>
            <tr>
                <th data-field="action">설정</th>
                <th data-field="oid">예약번호</th>
                <th data-field="date">날짜</th>
                <th data-field="time">시간</th>
                <th data-field="covers">예약인원</th>
                <th data-field="message">메시지</th>
            </tr>
            </thead>
        </table>

        <br>
        <div style="font-size: 20px; font-weight: bold">예약완료 현황</div>
        <table
                id="reservationTable"
                data-toggle="table"
                data-height="460"
                data-search="true"
                data-show-search-button="true"
                data-pagination="true"
                data-side-pagination="server">
            <thead>
            <tr>
                <th data-field="action">설정</th>
                <th data-field="oid">예약번호</th>
                <th data-field="date">날짜</th>
                <th data-field="time">시간</th>
                <th data-field="covers">예약인원</th>
                <th data-field="table_id">테이블</th>
            </tr>
            </thead>
        </table>

        <br>
        <br>
        <div style="font-size: 20px; font-weight: bold">주문 현황</div>
        <table
                id="orderTable"
                data-toggle="table"
                data-height="460"
                data-search="true"
                data-show-search-button="true"
                data-pagination="true"
                data-side-pagination="server">
            <thead>
            <tr>
                <th data-field="oid">예약번호</th>
                <th data-field="date">날짜</th>
                <th data-field="orderedList">주문 리스트</th>
                <th data-field="payment">결제방식</th>
                <th data-field="totalPrice">결제금액</th>
                <th data-field="message">메세지</th>
            </tr>
            </thead>
        </table>

    </div>
    <div class="modal fade" id="staticBackdrop4" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel4" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel4">수정하기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id = "UserModify"></div>
                <%--                        <div class="modal-footer">--%>
                <%--                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>--%>
                <%--                            <button type="button" class="btn btn-primary">추가하기</button>--%>
                <%--                        </div>--%>
            </div>
        </div>
    </div>

</div>
<%@include file="../common/footer.jsp" %>
</body>
<script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function() {
        callSetupTableView();
        makeID();
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
    function callSetupTableView(){
        $('#reservationRequestTable').bootstrapTable('load',data1());
        $('#reservationRequestTable').bootstrapTable('refresh');
        $('#orderTable').bootstrapTable('load',data2());
        $('#orderTable').bootstrapTable('refresh');
        $('#reservationTable').bootstrapTable('load',data3());
        $('#reservationTable').bootstrapTable('refresh');
    }
    function data1(){
        var reservaionRequestLst = <%=ReservationRequest%>
        var rows = [];
        for(var i=0;i<reservaionRequestLst.length;i++){
            var request=reservaionRequestLst[i];
            rows.push({
                oid: request.oid,
                covers: request.covers,
                date: request.date,
                time: request.time,
                message: request.message,
                action : '<button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#staticBackdrop4" onclick="MakeModalData('+i+')">예약 정보 수정</button>'+
                    '<button class="btn btn-outline-dark" onclick="deleteReservationRequest('+i+')">예약 취소</button>'
            });
        }
        // alert(rows);
        return rows;
    }
    function data2(){
        var orderList = <%=Order%>
        var rows = [];
        for(var i=0;i<orderList.length;i++){
            var order=orderList[i];
            rows.push({
                oid: order.oid,
                orderedList: order.orderedList,
                date: order.date,
                payment: order.payment,
                totalPrice: order.totalPrice,
                message: order.message,
            });
        }
        // alert(rows);
        return rows;
    }
    function data3(){
        var reservationList = <%=Reservation%>
        var rows = [];
        for(var i=0;i<reservationList.length;i++){
            var reservation=reservationList[i];
            rows.push({
                oid: reservation.oid,
                covers: reservation.covers,
                date: reservation.date,
                time: reservation.time,
                table_id: "No."+reservation.table_id,
                action : '<button class="btn btn-outline-dark" onclick="message()">예약 정보 수정</button>'+
                    '<button class="btn btn-outline-dark" onclick="deleteReservation('+i+')">예약 취소</button>'
            });
        }
        // alert(rows);
        return rows;
    }
    var openingTime = 10;
    var closingTime = 22;
    function MakeModalData(i){
        var list = $('#UserModify');
        var text='';
        // alert('id:'+id);
        var reservationRequestList = <%=ReservationRequest%>;
        var reservation=reservationRequestList[i];
        var date = reservation.date;
        var time = reservation.time;
        text +='날짜<input type="date" class="form-control" id="modifyDate" name="new_date" value="'+date+'" placeholder="Date">'
        text +='시간<select id="modifyTime" class="form-control"><option value="'+time+'">'+time+':00</option>'
        for(var i=openingTime;i<closingTime;i++){
            text+='<option value="'+i+'">'+i+':00</option>';
        }
        text +='</select>';
        //이름
        text+= '이름<input type="text" class="form-control" id="modifyName" name="new_name" value="'+""+'">';
        //인원수
        text += '인원수<select id="modifyCovers" class="form-control"><option value="1">1명</option>';
        for(var i=2;i<6;i++){
            text+='<option value="'+i+'">'+i+'명</option>';
        }
        text+='</select>';
        text+='<div class="modal-footer">'
            +'<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>'
            +'<button type="button" class="btn btn-dark" onclick="modifyReservationRequest('+reservation.oid+')">수정하기</button>'
            +'</div>';
        list.html(text);//누를때마다 #DataModify의 값을 완전 새로 갈아치움
    }
    function message(){
        alert("※변경을 원하시면 02-111-2222로 문의해주세요.※");
        location.href='userReservationInfo.do?id='+<%=id%>;
    }
    function deleteReservation(i) {
        var reservationList =
        <%=Reservation%>
        var reservation = reservationList[i];
        var date = reservation.date;
        var time = reservation.time;
        var table = reservation.table_id;
        var data = date + "-/-/-" + time + "-/-/-" + table;
        //var check = confirm("삭제하시겠습니까?");
        var check = swal({
            title: '예약을 취소하시겠습니까?',
            icon: 'info',
            button: '확인'
        }).then((check) => {
            if (check) {

                $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                    url: "ajax.do", //ajax.do(ajaxAction)에 있는
                    type: "post",
                    data: {
                        req: "deleteReservation",
                        data: data
                    },
                    success: function (oid) {

                            swal({
                                title: '예약 취소',
                                text: "예약이 취소되었습니다.",
                                icon: 'success',
                                button: '확인'
                            }).then(function () {
                                location.href = 'userReservationInfo.do?id=' +<%=id%>;

                            });

                    }
                })
            }
        });
    }
    function deleteReservationRequest(i){
        var reservationRequestList = <%=ReservationRequest%>
        var reservation=reservationRequestList[i];
        var date = reservation.date;
        var time = reservation.time;
        var data=date+"-/-/-"+time;
        var check = swal({
            title : '예약을 취소하시겠습니까?',
            icon : 'info',
            button : '확인'
        }).then((check) => {
            if(check){
                $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                    url: "ajax.do", //ajax.do(ajaxAction)에 있는
                    type: "post",
                    data: {
                        req: "deleteReservationRequest",
                        data: data
                    },
                    success: function (oid) {
                        swal({
                            title : '예약 취소',
                            text: "예약이 취소되었습니다.",
                            icon : 'success',
                            button : '확인'
                        }).then(function () {
                            location.href = 'userReservationInfo.do?id=' +<%=id%>;

                        });
                    }
                })
            }
        });

    }
    function  modifyReservationRequest(oid){
        var date = document.getElementById('modifyDate').value;
        var time = document.getElementById('modifyTime').value;
        var cover = document.getElementById('modifyCovers').value;
        var name = document.getElementById('modifyName').value;
        var data=date+"-/-/-"+time+"-/-/-"+cover+"-/-/-"+name+"-/-/-"+oid;
        var check =swal({
            title : '예약을 수정하시겠습니까?',
            icon : 'info',
            button : '확인'
        }).then((check) => {
            if(check){
                $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                    url: "ajax.sep", //ajax.do(ajaxAction)에 있는
                    type: "post",
                    data: {
                        req: "modifyReservationRequest",
                        data: data
                    },
                    success: function (oid) {

                        if(oid=="-1"){
                            swal({
                                title : '예약 수정 실패!',
                                text : "이미 예약이 있는 날짜입니다\n다른 날짜로 수정해주세요.",
                                icon : 'error',
                                button: '확인'
                            }).then(function () {
                                location.hrer= 'userReservationInfo.sep?id=' +<%=id%>;
                            });
                        }
                        else {
                            swal({
                                title : '예약 수정 성공!',
                                text : "예약 정보가 수정되었습니다.",
                                icon : 'success',
                                button : '확인'
                            }). then(function () {
                                location.href = 'userReservationInfo.sep?id=' +<%=id%>;

                            });
                        }
                    }
                })
            }
        });

    }
</script>
</html>