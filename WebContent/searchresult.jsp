<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
	<meta charset="UTF-8">
	<title>検索結果</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
</head>
<body>
	<!-- ヘッダー読み込み -->
	<jsp:include page="header.jsp" flush="true" />

	<div class="main">

	<!-- search.jspで実行された社員の検索結果を表示-->
	<%
		ResultSet rset = (ResultSet) request.getAttribute("result");
	%>

		<div class="page-title">
			<h1>検索結果</h1>
		</div>
		<!-- 検索結果がnullの場合はここに表示するメッセージを入れる -->
		<div class="search-null">

		</div>

		<table class="member-table" border="1">
			<tr class="member-table line" bgcolor="#cccccc">
				<td class="member-table item item_s"><b>ID</b></td>
				<td class="member-table item item_l"><b>名前</b></td>
				<td class="member-table item item_s"><b>性別</b></td>
				<td class="member-table item item_s" ><b>年齢</b></td>
				<td class="member-table item item_l" ><b>部署</b></td>
				<td class="member-table item item_m" ><b>役職</b></td>
				<td class="member-table item item_btn"><b>削除</b></td>
				<td class="member-table item item_btn"><b>変更</b></td>
			</tr>
			<%
				while (rset.next()) {
			%>
			<tr class="line">
				<td class="member-table item item_s"><%=rset.getString(1)%></td>
				<td class="member-table item item_l"><%=rset.getString(2)%></td>
				<td class="member-table item item_s"><%=rset.getString(3)%></td>
				<td class="member-table item item_s"><%=rset.getString(4)%></td>
				<td class="member-table item item_l"><%=rset.getString(5)%></td>
				<td class="member-table item item_m"><%= rset.getString(6)%></td>
				<!-- 削除ボタン-->
				<td class="member-table item item_btn delete">
					<form action="/java_mysql/Edit" method="POST">
						<input type="hidden" name="mode" value="check">
						<input type="hidden" name="id" value="<%=rset.getString(1)%>">
						<input type="hidden" name="name" value="<%=rset.getString(2)%>">
						<input type="hidden" name="sex" value="<%=rset.getString(3)%>">
						<input type="hidden" name="age" value="<%=rset.getString(4)%>">
						<input type="hidden" name="department" value="<%=rset.getString(5)%>">
						<input type="hidden" name="position" value="<%=rset.getString(6)%>">
						<input class="submit" type="submit" value="削除">
					</form>
				</td>
				<!-- 更新ボタン -->
				<td class="member-table item item_btn update">
					<form action="/java_mysql/Edit" method="POST">
						<input type="hidden" name="mode" value="change">
						<input type="hidden" name="id" value="<%=rset.getString(1)%>">
						<input type="hidden" name="name" value="<%=rset.getString(2)%>">
						<input type="hidden" name="sex" value="<%=rset.getString(3)%>">
						<input type="hidden" name="age" value="<%=rset.getString(4)%>">
						<input type="hidden" name="department" value="<%=rset.getString(5)%>">
						<input type="hidden" name="position" value="<%=rset.getString(6)%>">
						<input class="submit" type="submit" value="変更">
					</form>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
	</div>
</body>
</html>
