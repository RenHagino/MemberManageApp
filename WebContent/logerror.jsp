<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
	<head>
		<title>ログイン結果</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<link rel="stylesheet" type="text/css" href="./css/reset.css">
	</head>

	<!-- ヘッダー読み込み -->
	<jsp:include page="header.jsp" flush="true" />

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
</html>