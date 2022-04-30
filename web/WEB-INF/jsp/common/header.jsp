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
	String user =  (String)session.getAttribute("user");
%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.83.1">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

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
		Header position
	</div>
</header>