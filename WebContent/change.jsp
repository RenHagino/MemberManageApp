<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="info.searchman.lesson.java_mysql.MemberBeans"%>
<html>
	<head>
		<title>変更結果ページ</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" type="text/css" href="css/reset.css">
	</head>
	<body>
		<!-- Beansを呼び出し、 memberのデータをgetAttributeする -->
		<% MemberBeans member = (MemberBeans) request.getAttribute("member"); %>
		<div class="header">
			<div class="title">
				<h1>社員管理画面</h1>
			</div>
				<nav class="menu">
				<ul>
					<li class="btn btn-menu">
						<a href="./search.jsp">社員を検索</a>
					</li>
					<li class="btn btn-menu">
						<a>メニュー2</a>
					</li>
					<li class="btn btn-menu">
						<a>メニュー3</a>
					</li>
				</ul>
			</nav>
		</div>
		<div class="main">

			<!-- 変更フォーム : 変更確定ボタンを押すと-->
			<form class="form" action="/java_mysql/Edit" method="POST">
				<h1 class="title">
					変更結果を確認
				</h1>

				<div class="form-content">
					<div class="title">
					ID : (変更不可能)
					</div>
					<input class="input" type="text" name="id" value="<%=member.getId()%>" readonly><br>
				</div>
				<div class="form-content">
					<div class="title">
					名前 :
					</div>
					<input class="input"type="text" name="name" value="<%=member.getName()%>"><br>
				</div>
				<!-- サブコンテント扱いにして横幅を半分ずつに分ける -->
				<div class="form-content">
					<div class="sub sub-left">
						<div class="title title-left">
							性別 :
						</div><br>
						<SELECT class="select select-left" name="sex">
							<OPTION VALUE="<%=member.getSex()%>" selected><%=member.getSex()%></OPTION>
							<OPTION VALUE="男性">男性</OPTION>
							<OPTION VALUE="女性">女性</OPTION>
						</SELECT><br>

					</div>

					<div class="sub sub-right">
						<div class="title title-right">
						年齢 :
						</div><br>
						<SELECT class="select select-right"name="age">
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
					</div>
				</div>
				<div class="form-content">
					<!-- 変更確定ボタン : del_addという値がEditServlet.javaに渡される -->
					<input class="submit" type="hidden" name="mode" value="update">
					<input class="submit" type="submit" value="変更確定">
				</div>
			</form>
		</div>
	</body>
</html>