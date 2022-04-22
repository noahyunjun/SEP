<%--
  Created by IntelliJ IDEA.
  User: gabri
  Date: 2021-10-05
  Time: 오후 10:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String team = (String) request.getAttribute("team");
%>
<!DOCTYPE html>
<html lang="en">
<body id="page-top">
<%@include file="header.jsp" %>
<!-- Masthead-->
<header class="masthead">
    <div class="container">
        <div class="masthead-subheading">초기세팅 완료 페이지</div>
        <div class="masthead-heading text-uppercase">시작</div>
        <div id="loginInfo"></div>
    </div>
</header>

<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>



</html>
