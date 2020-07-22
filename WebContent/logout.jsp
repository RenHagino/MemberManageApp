<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<link rel="stylesheet" type="text/css" href="./css/reset.css">
		<title>ログアウトページです</title>
	</head>

	<!-- ヘッダー読み込み -->
	<jsp:include page="header.jsp" flush="true" />

	<body>
	  <div class="main">
	  		<h1 class="page-title">現在、管理者としてログイン中です。ログアウトしますか？</h1>
			<form class="auth-form logout-form" action="/java_mysql/LogoutServlet" method="post">
				<button class="submit logout" type="submit">
					ログアウト
				</button>
	      </form>
	    </div>

	</body>
</html>