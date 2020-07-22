<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>検索フォーム</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
</head>

<!-- ヘッダー読み込み -->
<jsp:include page="header.jsp" flush="true" />

<body>
	<div class="main">
		<h1 class="page-title">
			社員を検索する条件を入力してください<br><br>
			条件を入力せずに検索すると全ての社員が表示されます
		</h1>
		<form class="form" action="/java_mysql/Search" method="POST">


			<div class="form-content">
				<div class="info">
					<p class="validate">*入力は自由です</p>
				</div>
				<input class="member-input" type="text" name="id" placeholder="IDを入力">
			</div>


			<div class="form-content">
				<div class="info">
					<p class="validate">*入力は自由です</p>
				</div>
				<input class="member-input" type="text" name="name" placeholder="社員名を入力">
			</div>


			<div class="form-content">
				<div class="info">
					<p class="validate">*選択は自由です</p>
				</div>
				<SELECT class="select" NAME="sex">
					<OPTION class="placeholder" VALUE="" selected>性別</OPTION>
					<OPTION class="value" VALUE="男">男性</OPTION>
					<OPTION class="value" VALUE="女">女性</OPTION>
				</SELECT>
			</div>

			<div class="form-content">
				<div class="info">
					<p class="validate">*選択必須です</p>
				</div>
				<SELECT class="select" NAME="age">
					<OPTION class="placeholder" VALUE="" selected>年齢</OPTION>
					<OPTION class="value" VALUE="21">21</OPTION>
					<OPTION class="value" VALUE="22">22</OPTION>
					<OPTION class="value" VALUE="23">23</OPTION>
					<OPTION class="value" VALUE="24">24</OPTION>
					<OPTION class="value" VALUE="25">25</OPTION>
					<OPTION class="value" VALUE="26">26</OPTION>
					<OPTION class="value" VALUE="27">27</OPTION>
					<OPTION class="value" VALUE="28">28</OPTION>
					<OPTION class="value" VALUE="29">29</OPTION>
					<OPTION class="value" VALUE="30">30</OPTION>
				</SELECT>
			</div>

			<div class="form-content">
				<div class="info">
					<p class="validate">*選択必須です</p>
				</div>
				<SELECT class="select" name="department">
					<OPTION class="placeholder" VALUE="" selected>所属部署</OPTION>
					<OPTION class="value" VALUE="1">総務課</OPTION>
					<OPTION class="value" VALUE="2">経理・会計課</OPTION>
					<OPTION class="value" VALUE="3">人事課</OPTION>
					<OPTION class="value" VALUE="4">生産管理課</OPTION>
					<OPTION class="value" VALUE="5">設計課</OPTION>
					<OPTION class="value" VALUE="6">製造販売課</OPTION>
					<OPTION class="value" VALUE="7">営業課</OPTION>
					<OPTION class="value" VALUE="8">営業企画課</OPTION>
					<OPTION class="value" VALUE="9">商品開発課</OPTION>
					<OPTION class="value" VALUE="10">事業開発課</OPTION>
					<OPTION class="value" VALUE="11">メンテナンス事業部</OPTION>
				</SELECT>
			</div>

			<div class="form-content">
				<div class="info">
					<p class="validate">*選択必須です</p>
				</div>
				<SELECT class="select" name="position">
					<OPTION VALUE="" selected>役職</OPTION>
					<OPTION class="value" VALUE="1">部長</OPTION>
					<OPTION class="value" VALUE="2">次長</OPTION>
					<OPTION class="value" VALUE="3">課長</OPTION>
					<OPTION class="value" VALUE="4">係長</OPTION>
					<OPTION class="value" VALUE="5">課長</OPTION>
					<OPTION class="value" VALUE="6">主任</OPTION>
					<OPTION class="value" VALUE="7">平社員</OPTION>
				</SELECT>
			</div>
			<div class="form-content">
				<input class="submit" type="submit" value="検索する">
			</div>
		</form>
	</div>
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

</body>
</html>
