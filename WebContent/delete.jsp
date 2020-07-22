<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="info.searchman.lesson.java_mysql.MemberBeans"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>削除確認ページ</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
</head>
<body>
<% MemberBeans member = (MemberBeans) request.getAttribute("member"); %>

	<div class="main">
		<h1 class="page-title">この社員の情報を削除します。よろしいですか？</h1>
		<table class="member-table" border="1">
			<tr class="member-table line" bgcolor="#cccccc">
				<td class="member-table item item_s"><b>ID</b></td>
				<td class="member-table item item_l"><b>名前</b></td>
				<td class="member-table item item_s"><b>性別</b></td>
				<td class="member-table item item_s" ><b>年齢</b></td>
				<td class="member-table item item_l" ><b>部署</b></td>
				<td class="member-table item item_m" ><b>役職</b></td>
			</tr>
			<tr class="line">
				<td class="member-table item item_s"><%=member.getId()%></td>
				<td class="member-table item item_l"><%=member.getName()%></td>
				<td class="member-table item item_s"><%=member.getSex()%></td>
				<td class="member-table item item_s"><%=member.getAge()%></td>
				<td class="member-table item item_l"><%=member.getDepartment()%></td>
				<td class="member-table item item_m"><%=member.getPosition()%></td>
			</tr>
		</table>
		<!-- 削除ボタン -->
		<form action="/java_mysql/Edit/" method="POST">
			<input type="hidden" name="mode" value="delete">
			<input type="hidden" name="id" value="<%=member.getId()%>">
			<input type="hidden" name="name" value="<%=member.getName()%>">
			<input type="hidden" name="sex" value="<%=member.getSex()%>">
			<input type="hidden" name="age" value="<%=member.getAge()%>">
			<input type="hidden" name="department" value="<%=member.getDepartment()%>">
			<input type="hidden" name="position" value="<%=member.getPosition()%>">
			<input class="submit" type="submit" value="削除">
		</form>
		<form>

		</form>
	</div>
</body>
</html>