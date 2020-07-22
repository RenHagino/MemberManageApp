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

		<!-- ヘッダー読み込み -->
		<jsp:include page="header.jsp" flush="true" />

		<div class="main">
			<h1 class="page-title">
				変更する内容を入力してください
			</h1>

			<!-- 変更フォーム : 変更確定ボタンを押すと-->
			<form class="form" action="/java_mysql/Edit" method="POST">
				<!-- idは変更不可なので表示しない -->
				<input class="member-input" type="hidden" name="id" value="<%=member.getId()%>"><br>

				<div class="form-content">
					<p class="title">
						名前
					</p>
					<input class="member-input"type="text" name="name" value="<%=member.getName()%>"><br>
				</div>

				<div class="form-content">
					<p class="title">
						性別
					</p>
					<SELECT class="select" name="sex">
						<OPTION VALUE="<%=member.getSex()%>" selected><%=member.getSex()%>(登録中)</OPTION>
						<OPTION VALUE="男性">男性</OPTION>
						<OPTION VALUE="女性">女性</OPTION>
					</SELECT>
				</div>

				<div class="form-content">
					<p class="title">年齢</p>
					<SELECT class="select" NAME="age">
						<OPTION VALUE="<%=member.getAge()%>" selected><%=member.getAge()%>(登録中)</OPTION>
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
					</SELECT>
				</div>

				<!-- todo : 所属部署用に変更する -->
				<div class="form-content">
					<p class="title">
						所属部署
					</p>
					<SELECT class="select"name="department">
						<OPTION VALUE="<%=member.getDepartment()%>" selected><%=member.getDepartment()%>(登録中)</OPTION>
						<OPTION VALUE="1">総務課</OPTION>
						<OPTION VALUE="2">経理・会計課</OPTION>
						<OPTION VALUE="3">人事課</OPTION>
						<OPTION VALUE="4">生産管理課</OPTION>
						<OPTION VALUE="5">設計課</OPTION>
						<OPTION VALUE="6">製造販売課</OPTION>
						<OPTION VALUE="7">営業課</OPTION>
						<OPTION VALUE="8">営業企画課</OPTION>
						<OPTION VALUE="9">商品開発課</OPTION>
						<OPTION VALUE="10">事業開発課</OPTION>
						<OPTION VALUE="11">メンテナンス事業部</OPTION>
					</SELECT>
				</div>
				<!-- todo : 役職用にに変更する -->
				<div class="form-content">
					<p class="title">
						役職
					</p>
					<SELECT class="select"name="position">
						<OPTION VALUE="<%=member.getPosition()%>" selected><%=member.getPosition()%>(登録中)</OPTION>
						<OPTION VALUE="1">部長</OPTION>
						<OPTION VALUE="2">次長</OPTION>
						<OPTION VALUE="3">課長</OPTION>
						<OPTION VALUE="4">係長</OPTION>
						<OPTION VALUE="5">課長</OPTION>
						<OPTION VALUE="6">主任</OPTION>
						<OPTION VALUE="7">平社員</OPTION>
					</SELECT>
				</div>

				<div class="form-content">
					<!-- 変更確定ボタン : del_addという値がEditServlet.javaに渡される -->
					<input class="submit" type="hidden" name="mode" value="update">
					<input class="submit" type="submit" value="変更確定">
				</div>
			</form>
		</div>
	</body>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
	    	$('.select').bind('change', function(){
	        	$(this).removeClass();
	        	$(this).addClass('select-value');
	    	});

	    	$('.member-input').bind('change', function(){
	    		$(this).removeClass();
		    	$(this).addClass('member-input-after');
	    	});
		});
	</script>
	<footer class="footer">
		<p>Copyright :</p>
	</footer>
</html>