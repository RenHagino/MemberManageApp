<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>検索結果</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
</head>
<body>
	<header class="header">
		<div class="title">
			<h1>社員管理アプリ</h1>
		</div>
		<nav class="menu">
			<ul>
				<li class="btn btn-menu">
					<a href="./index.jsp">データ登録画面へ</a>
				</li>
				<li class="btn btn-menu">
					<a href="./search.jsp">データ検索画面へ</a>
				</li>
				<li class="btn btn-menu">
					<a>メニュー2</a>
				</li>
			</ul>
		</nav>
		</header>
		<div class="main">
		<!-- rsetはsearch.jspで実行されたSQLのステートメントの実行結果がrequest.setAttributeで渡ってくる -->
		<%
			ResultSet rset = (ResultSet) request.getAttribute("result");
		%>

		<div class="page-title">
			<h1>検索結果</h1>
		</div>

		<table class="member-table" border="1">
			<tr class="member-table line" bgcolor="#cccccc">
				<td class="member-table item"><b>ID</b></td>
				<td class="member-table item"><b>名前</b></td>
				<td class="member-table item"><b>性別</b></td>
				<td class="member-table item" ><b>年齢</b></td>
				<td class="member-table item" ><b>部署</b></td>
				<td class="member-table item" ><b>役職</b></td>
				<td class="member-table item"><b>削除</b></td>
				<td class="member-table item"><b>変更</b></td>
			</tr>
			<%
				while (rset.next()) {
			%>
			<tr class="line">
				<td class="member-table item"><%=rset.getString(1)%></td>
				<td class="member-table item"><%=rset.getString(2)%></td>
				<td class="member-table item"><%=rset.getString(3)%></td>
				<td class="member-table item"><%=rset.getString(4)%></td>
				<td class="member-table item"><%=rset.getString(5)%></td>
				<td class="member-table item"><%= rset.getString(6)%></td>
				<!-- 削除ボタン-->
				<td class="member-table item delete"><a href="Edit?&mode=delete&id=<%=rset.getString(1)%>">削除する</a></td>
				<!-- 更新ボタン -->
				<td class="member-table item update"><a href="Edit?&mode=change&id=<%=rset.getString(1)%>">変更する</a></td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
	</div>
	<footer class="footer">
		<p>Copyright :</p>
	</footer>
</body>
</html>
