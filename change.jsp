<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="info.searchman.lesson.java_mysql.MemberBeans"%>
<html>
	<head>
		<title>変更結果ページ</title>
	</head>
	<body>
		<!-- Beansを呼び出し、 memberのデータをgetAttributeする -->
		<% MemberBeans member = (MemberBeans) request.getAttribute("member"); %>

		<div class="main">
			<h1>変更結果を確認</h1><br>
			<!-- 変更フォーム : 変更確定ボタンを押すと-->
			<form action="/java_mysql/Edit" method="POST">
				ID : (変更不可能) <input type="hidden" name="id" value="<%=member.getId()%>"><br>
				名前 : <input type="text" name="name" value="<%=member.getName()%>"><br>
				性別 : <SELECT name="sex">
						<OPTION VALUE="<%=member.getSex()%>" selected><%=member.getSex()%></OPTION>
						<OPTION VALUE="男性">男性</OPTION>
						<OPTION VALUE="女性">女性</OPTION>
					</SELECT><br>
				年齢 : <SELECT name="age">
						<OPTION VALUE="<%=member.getAge()%>" selected><%=member.getAge()%></OPTION>
						<OPTION VALUE="20">20</OPTION>
						<OPTION VALUE="21">21</OPTION>
						<OPTION VALUE="22">22</OPTION>
						<OPTION VALUE="23">23</OPTION>
						<OPTION VALUE="24">24</OPTION>
						<OPTION VALUE="25">25</OPTION>
						<OPTION VALUE="26">26</OPTION>
						<OPTION VALUE="27">27</OPTION>
						<OPTION VALUE="28">28</OPTION>
						<OPTION VALUE="29">29</OPTION>
						<OPTION VALUE="30">30</OPTION>
					</SELECT><br>

				<!-- 変更確定ボタン : del_addという値がEditServlet.javaに渡される -->
				<input type="hidden" name="mode" value="update">
				<input type="submit" value="変更確定">
			</form>
		</div>
	</body>
</html>