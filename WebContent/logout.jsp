<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<link rel="stylesheet" type="text/css" href="./css/reset.css">
		<title>ログアウトページです</title>
	</head>
	<header class="header">
	<div class="title">
		<h1>社員管理画面</h1>
	</div>
	<nav class="menu">
		<ul>
			<li class="btn btn-menu">
				<a href="./search.jsp">社員を検索</a>
			</li>
			<li class="btn btn-menu">
				<a href="./login.jsp">ログイン</a>
			</li>
			<li class="btn btn-menu">
				<a href="./logout.jsp">ログアウト</a>
			</li>
		</ul>
	</nav>
	</header>
	<body>
	  <div class="main">
		<h1 class="page-title">現在ログイン中です</h1>
			<form class="form" action="LogoutServlet" method="post">
			<p class="title">ログアウトしますか？</p>
			<div class="form-content">
				<input class="submit" type="submit" value="ログアウト">
			</div>
	      </form>
	    </div>
	<footer class="footer">
		<p>Copyright :</p>
	</footer>
	</body>
</html>