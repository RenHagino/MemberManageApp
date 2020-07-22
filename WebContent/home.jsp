<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
</head>
<body class="home-wrapper">
	<div class="home-image">
		<header class="header home-header">
			<div class="title">
				<h1>MMA</h1>
			</div>
			<nav class="menu">
			<!-- if文でログイン状態保持を確認 -->
			<%
				if (session != null && session.getAttribute("loginUser") != null && (Boolean)session.getAttribute("loginUser")){
			%>
				<ul class="header-menu-list">
					<li class="btn btn-menu">
						<a href="./search.jsp">社員を検索</a>
					</li>
					<li class="btn btn-menu">
						<a href="./index.jsp">社員を登録</a>
					</li>
					<li class="btn btn-menu">
						<a href="./logout.jsp">ログアウト</a>
					</li>
				</ul>
			<% }else{ %>
				<ul class="header-menu-list">
					<li class="btn btn-menu">
						<a href="./search.jsp">社員を検索</a>
					</li>
					<li class="btn btn-menu">
						<a href="./index.jsp">社員を登録</a>
					</li>
					<li class="btn btn-menu">
						<a href="./login.jsp">ログイン</a>
					</li>
				</ul>
			<% } %>
			</nav>
		</header>
		<div class="home-content">
			<div class="welcome-msg">
				<p>あなたの会社、どのくらいの社員がいらっしゃいますか？</p>
				<p>最近になって社員は増えてきていませんか?</p>
				<p>よりシンプルなこのアプリで管理で管理してみましょう</p>
			</div>
		</div>
	</div>
</body>
</html>