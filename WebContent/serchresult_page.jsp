<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
	<title>検索結果</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
	<!-- ページネーションのためのスタイルシート読み込み -->
</head>
<body>
	<%
		ResultSet rset = (ResultSet) request.getAttribute("result");
	%>
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

	<!-- resultはindex.jspで実行されたステートメントの実行結果がrequest.setAttributeで渡ってくる -->


	<div class="page-title">
			<h1>検索結果(ここはsearchresult_page.jspです)</h1>
	</div>

	<table class="member-table" border="1">
		<tr class="member-table line" bgcolor="#cccccc">
			<td class="member-table item"><b>ID</b></td>
			<td class="member-table item"><b>名前</b></td>
			<td class="member-table item"><b>性別</b></td>
			<td class="member-table item" ><b>年齢</b></td>
			<td class="member-table item"><b>削除</b></td>
			<td class="member-tanle item"><b>変更</b></td>
		</tr>
		<!-- ここに検索した結果のメンバーが入ってくる -->
		<tr id="all-member-list"class="line">

		</tr>

	</table>

	<!-- ページネーションがのボタンが入ってくる  -->
	<div class="pager" id="all-member-pager">
	</div>

	<br>
	</div>
	<footer class="footer">
		<p>Copyright :</p>
	</footer>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous">
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.min.js" integrity="sha256-E+fw0vUbuPq4p3FWWtX7FzzlcMTe7hvrgZxOk8LPAh4=" crossorigin="anonymous">
	</script>

	<!-- スクリプト読み込み -->
	<script>
	//全てのデータを取得
	var members =[]
	// [1] 配列のデータを用意
    var member = [
      {
        id: rset_id,
        name: rset_name,
        sex: rset_sex,
        age: rset_age,
      },
     ]
     // [2] pagination.jsの設定
     $(function() {
        $('#all-member-pager').pagination({ // diary-all-pagerにページャーを埋め込む
          dataSource: member,
          pageSize: 5, // 1ページあたりの表示数
          prevText: '&lt; 前へ',
          nextText: '次へ &gt;',
          // ページがめくられた時に呼ばれる
          callback: function(data, pagination) {
            // dataの中に次に表示すべきデータが入っているので、html要素に変換
            $('#all-member-list').html(template(data)); // diary-all-contentsにコンテンツを埋め込む
          }
        });
      });
      // [3] データ1つ1つをhtml要素に変換する
	 function template(dataArray) {
        return dataArray.map(function(data) {
          return '<td class="member-table item">' + data.id + '</td>'+
          	'<td class="member-table item">' + data.name + '</td>'+
          	'<td class="member-table item">' + data.sex + '</td>'+
 		 	'<td class="member-table item">' + data.age + '</td>'+
 		 	'<td class="member-table item delete"><a href="Edit?&mode=delete&id='+ data.id + ' "> ' + "削除する" + '</a></td>'+
 		 	'<td class="member-table item update"><a href="Edit?&mode=change&id='+ data.id + ' "> ' + "変更する" + '</a></td>'
        })
      }
	</script>


</body>
</html>