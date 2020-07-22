<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="info.searchman.lesson.java_mysql.MemberBeans"%>
<html>
	<head>
		<title>変更結果ページ</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" type="text/css" href="css/reset.css">
	</head>
	<body>
		<!-- Beansを呼び出し、 memberのデータをgetAttributeする -->
		<% MemberBeans member = (MemberBeans) request.getAttribute("member"); %>

		<!-- ヘッダー読み込み -->
		<jsp:include page="header.jsp" flush="true" />

		<div class="main">
			<h1 class="title">ここはresult.jspです</h1>
			<p>ステータス</p><br>
			<p><%=request.getAttribute("status") %></p>
		</div>
	</body>
</html>