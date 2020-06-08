<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
	<title>Sample</title>
</head>
<body>
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
	<div class="main">
	   	<p class="text error-text">
	   	<!-- エラーメッセージが入ってる場合のみ表示する。nullが画面状に表示されることを防止 -->
		<% String loginErr = (String) request.getAttribute("loginErr");
			if(loginErr == null){%>
				<%= "" %>
			<% }else{ %>
				<%=loginErr %>
			<%} %>
	   	</p>

	    <form class="form" action="/java_mysql/LoginServlet" method="post">
			<h1 class="title">
				IDとパスワードを入力してログインしてください
			</h1>
	       	<div class="form-content">
	       		<p class="title">ログインID：</p><br>
	       		<input class="input" type="text" name="id" />
	       	</div>
	       	<div class="form-content">
	       		<p class="title">パスワード：</p><br>
	       		<input class="input" type="password" name="password" />
	       	</div>
	       	<div class="form-content">
		      	<input class="submit" type="submit" value="ログイン">
	       	</div>
	      	<!-- ログインサーブレットからエラーメッセージが飛んでくるのを確認する -->
		</form>
	 	</div>
	 	<footer class="footer">
			<p>Copyright :</p>
		</footer>
</body>
</html>