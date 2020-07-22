<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<header class="header site-header">
		<div class="title">
			<h1><a href="./home.jsp">社員管理画面</a></h1>
		</div>
		<nav class="menu">
			<!-- if文でログイン状態保持を確認 -->
			<%
				if (session != null && session.getAttribute("loginUser") != null && (Boolean)session.getAttribute("loginUser")){
			%>
				<ul>
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
				<ul>
					<li class="btn btn-menu">
						<a href="./search.jsp">
						<img class="header-icon" src="./images/grasses.png">
						社員を検索
						</a>
					</li>
					<li class="btn btn-menu">
						<img class="header-icon" src="./images/register.png">
						<a href="./index.jsp">社員を登録</a>
					</li>
					<li class="btn btn-menu">
						<img class="header-icon" src="./images/login_1.png">
						<a href="./login.jsp">ログイン</a>
					</li>
				</ul>
			<% } %>
		</nav>
	</header>
</html>