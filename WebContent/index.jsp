<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>ホームページ</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
</head>
<body>
<header class="header">
	<div class="title">
		<h1>社員管理画面</h1>
	</div>
	<nav class="menu">
		<ul>
			<li class="btn btn-menu">
				<a href="./search.jsp">社員を検索</a>
			</li>
			<li class="btn btn-menu">
				<a href="./login.jsp">ログイン</a>
			</li>
			<li class="btn btn-menu">
				<a href="./logout.jsp">ログアウト</a>
			</li>
		</ul>
	</nav>
</header>

<div class="main">

	<!-- データ登録画面 -->
	<%
		ResultSet result = (ResultSet) request.getAttribute("result");
	%>
	<!-- 所属部署データを定義 -->
	<form class="form" action="/java_mysql/Edit" method="POST">
		<h1 class="title">
			社員を登録する場合は以下のフォームに内容を入力してください
		</h1>

		<div class="form-content">
			<p class="title">ID</p>
			<input class="input" type="text" name="id">
		</div>
		<div class="form-content">
			<p class="title">名前</p>
			<input class="input" type="text" name="name">
		</div>
		<div class="form-content">
			<div class="sub sub-left">
				<div class="title title-left">
					<p class="">性別</p>
				</div><br>
				<SELECT class="select select-left" NAME="sex">
					<OPTION VALUE="" selected></OPTION>
					<OPTION VALUE="男">男性</OPTION>
					<OPTION VALUE="女">女性</OPTION>
				</SELECT>
			</div>
			<div class="sub sub-right">
				<div class="title title-right">
					<p class="">年齢</p>
				</div><br>
				<SELECT class="select select-right" NAME="age">
					<OPTION VALUE="" selected></OPTION>
					<OPTION VALUE="21">21</OPTION>
					<OPTION VALUE="22">22</OPTION>
					<OPTION VALUE="23">23</OPTION>
					<OPTION VALUE="24">24</OPTION>
					<OPTION VALUE="25">25</OPTION>
					<OPTION VALUE="26">26</OPTION>
					<OPTION VALUE="27">27</OPTION>
					<OPTION VALUE="26">28</OPTION>
					<OPTION VALUE="29">29</OPTION>
					<OPTION VALUE="30">30</OPTION>
				</SELECT>
			</div>
		</div>
		<div class="form-content">
			<div class="sub sub-left">
				<div class="title title-left">
					<p class="">所属部署</p>
				</div><br>
				<SELECT class="select select-left" name="department">
					<OPTION VALUE="" selected></OPTION>
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
			<div class="sub sub-right">
				<div class="title title-right">
				<p class="">役職</p>
				</div><br>
				<SELECT class="select select-right" name="position" >
					<OPTION VALUE="" selected></OPTION>

					<OPTION VALUE="2">次長</OPTION>
					<OPTION VALUE="3">課長</OPTION>
					<OPTION VALUE="4">係長</OPTION>
					<OPTION VALUE="5">課長</OPTION>
					<OPTION VALUE="6">主任</OPTION>
					<OPTION VALUE="7">平社員</OPTION>
				</SELECT>
			</div>
		</div>
		<div class="form-content">
			<div class="sub sub-left">
				<div class="title title-left">
					<p class="">DB所属部署</p>
				</div><br>
				<%
					while (result.next()) {
				%>
				<SELECT class="select select-left" name="department">
					<OPTION VALUE="" selected></OPTION>
					<OPTION VALUE="1"><%=result.getString(1) %></OPTION>
					<OPTION VALUE="2">経理・会計課</OPTION>
					<OPTION VALUE="3">人事課</OPTION>
					<OPTION VALUE="4">生産管理課<OPTION>
					<OPTION VALUE="5">設計課</OPTION>
					<OPTION VALUE="6">製造販売課</OPTION>
					<OPTION VALUE="7">営業課</OPTION>
					<OPTION VALUE="8">営業企画課</OPTION>
					<OPTION VALUE="9">商品開発課</OPTION>
					<OPTION VALUE="10">事業開発課</OPTION>
					<OPTION VALUE="11">メンテナンス事業部</OPTION>
				</SELECT>
				<%
					}
				%>
			</div>
			<div class="sub sub-right">
				<div class="title title-right">
				<p class="">DB役職</p>
				</div><br>
				<SELECT class="select select-right" name="position" >
					<OPTION VALUE="" selected></OPTION>
					<OPTION VALUE="1">部長</OPTION>
					<OPTION VALUE="2">次長</OPTION>
					<OPTION VALUE="3">課長</OPTION>
					<OPTION VALUE="4">係長</OPTION>
					<OPTION VALUE="5">課長</OPTION>
					<OPTION VALUE="6">主任</OPTION>
					<OPTION VALUE="7">平社員</OPTION>
				</SELECT>
			</div>
		</div>

		<div class="form-content">
			<input class="submit" type="hidden" name="mode" value="add">
			<input class="submit" type="submit" value="登録する">
		</div>


	</form>
</div>
<footer class="footer">
	<p>Copyright :</p>
</footer>
</body>
</html>