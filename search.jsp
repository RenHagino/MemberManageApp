<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title></title>
</head>
<body>
	<br>

	<!-- resultはindex.jspで実行されたステートメントの実行結果がrequest.setAttributeで渡ってくる -->
	<%
		ResultSet rset = (ResultSet) request.getAttribute("result");
	%>

	<table border="1">
		<tr bgcolor="#cccccc">
			<td><b>ID</b></td>
			<td><b>名前</b></td>
			<td><b>性別</b></td>
			<td><b>年齢</b></td>
			<td><b>削除</b></td>
			<td><b>変更</b></td>
		</tr>
		<%
			while (rset.next()) {
		%>
		<tr>
			<td><%=rset.getString(1)%></td>
			<td><%=rset.getString(2)%></td>
			<td><%=rset.getString(3)%></td>
			<td><%=rset.getString(4)%></td>
			<!-- 削除ボタン-->
			<td><a href="Edit?&mode=delete&id=<%=rset.getString(1)%>">削除する</a></td>
			<!-- 更新ボタン -->
			<td><a href="Edit?&mode=change&id=<%=rset.getString(1)%>">変更する</a></td>
		</tr>
		<%
			}
		%>
	</table>

	<br>

	<a href="./index.jsp">トップに戻る</a>

</body>
</html>
