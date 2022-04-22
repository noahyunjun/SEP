<%--
  Created by IntelliJ IDEA.
  User: YOON
  Date: 2021-11-09
  Time: 오전 2:50
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user = (String)session.getAttribute("user");
    String type = (String)session.getAttribute("type");
%>
<head>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>소프트웨어 공학Team</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/theme/main/assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/theme/main/css/styles.css" rel="stylesheet" />
</head>
