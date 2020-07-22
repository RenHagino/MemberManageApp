<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
	<head>
		<title>エラーページ</title>
	</head>

	<!-- ヘッダー読み込み -->
	<jsp:include page="header.jsp" flush="true" />

	<body>
		<div class="main">
			<%
				String status = (String) request.getAttribute("status");
			%>
			<h1 class="page-title">エラーが発生しました開発者に連絡してください</h1>
			<form class="form" action="LogoutServlet" method="post">
				<p class="text"><%=status%></p>
				<a href="./index.jsp">トップページに戻る</a>
			</form>
		</div>
	</body>
	<footer class="footer">
		<p>Copyright :</p>
	</footer>
</html>
