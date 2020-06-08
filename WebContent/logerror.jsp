<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
	<head>
		<title>ログイン結果</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<link rel="stylesheet" type="text/css" href="./css/reset.css">
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
			<h1 class="page-title">ログイン認証結果</h1>
			<form class="form">
				<div class="form-content">
					<!-- エラーメッセージが入ってる場合のみ表示する。nullが画面状に表示されることを防止 -->
					<p class="text error-text">
						<% String loginResult = (String) request.getAttribute("loginResult");
						if(loginResult == null){%>
							<%= "" %>
						<% }else{ %>
							<%= loginResult %>
						<% } %>
					</p>
				</div>
				<div class="form-content">
					<p class="link-text">
						<a href="./login.jsp">&lt;&lt; ログイン画面へ戻る</a>
					</p>
				</div>
			</form>
		</div>
	</body>
	<footer class="footer">
		<p>Copyright :</p>
	</footer>
</html>