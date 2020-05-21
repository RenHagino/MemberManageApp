<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<body>
	<br> 検索条件を入力してください。
	<br>（何も入力しないと全件抽出します）
	<br>
	<br>

	<form action="/java_mysql/Search" method="POST">

		ID: <input type="text" name="id">
		名前: <input type="text" name="name">
		性別：<SELECT NAME="sex">
			<OPTION VALUE="" selected></OPTION>
			<OPTION VALUE="男">男性</OPTION>
			<OPTION VALUE="女">女性</OPTION>
			</SELECT>
		年齢：<SELECT NAME="age">
			<OPTION VALUE="" selected></OPTION>
			<OPTION VALUE="20">20</OPTION>
			<OPTION VALUE="21">21</OPTION>
			<OPTION VALUE="22">22</OPTION>
			<OPTION VALUE="23">23</OPTION>
			<OPTION VALUE="24">24</OPTION>
		</SELECT> <br>
		<br> <input type="submit" value="検索">
	</form>

	<!-- データ登録画面 -->
	<br> 以下から登録できます。
	<br>
	<form action="/java_mysql/Edit" method="POST">

		ID: <input type="text" name="id">
		名前: <input type="text" name="name">
		性別：<SELECT NAME="sex">
				<OPTION VALUE="" selected></OPTION>
				<OPTION VALUE="男">男性</OPTION>
				<OPTION VALUE="女">女性</OPTION>
			</SELECT>
		年齢：<SELECT NAME="age">
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

		<br> <input type="hidden" name="mode" value="add"> <input
			type="submit" value="登録する">
	</form>
	<a href="./change.jsp">データ更新画面へ</a>
</body>
</html>