<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
	<title>login</title>
</head>
<body>
	<!-- ヘッダー読み込み -->
	<jsp:include page="header.jsp" flush="true" />

	<div class="main">
		<!-- ログイン -->
		<h1 class="page-title">
			社員の登録・削除・変更を行う場合、管理者用のIDとパスワードを入力して管理者としてログインしてください
		</h1>

		<!-- エラーメッセージ表示場所 -->
		<p class="text error-text">
	   		<!-- エラーメッセージが入ってる場合のみ表示する。nullが画面状に表示されることを防止 -->
			<% String loginErr = (String) request.getAttribute("loginErr");
				if(loginErr == null){%>
					<%= "" %>
				<% }else{ %>
					<%=loginErr %>
				<%} %>
	   	</p>

	   	<!-- 入力フォーム -->
	    <form class="auth-form login-form" action="/java_mysql/LoginServlet" method="post">
	       	<div class="field-wrap">
	       		<p class="label">ログインID</p>
	       		<input class="input" type="text" name="id" />
	       	</div>
	       	<div class="field-wrap">
	       		<p class="label">パスワード</p>
	       		<input class="input" type="password" name="password" />
	       	</div>
		    <button class="submit login" type="submit">
		    	ログイン
		    </button>
		</form>
	 	</div>
</body>
</html>