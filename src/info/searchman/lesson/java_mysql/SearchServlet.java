package info.searchman.lesson.java_mysql;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


//=============================================================
// クラス定義
//=============================================================
public class SearchServlet extends HttpServlet {

	//フィールド
	private static final long serialVersionUID = 1L;

	//データソースの作成(コネクションループを使うときにはDataSourceクラスを利用する
	DataSource ds;

	//=============================================================
	// 初期化処理
	//=============================================================
	public void init() throws ServletException {
		try {
			// 初期コンテキストを取得
			InitialContext ic = new InitialContext();

			// ルックアップしてデータソースを取得( /jdbc/searchman と一致する設定ファイルを
			// WebContent/META-INF/context.xmlの中から拾ってくる
			// Resource name="jdbc/searchman" auth="Container"のnameの部分を一致させる
			ds = (DataSource) ic.lookup("java:comp/env/jdbc/memberManage");
		} catch (Exception e) {

			}
	}

	//=============================================================
	// 所属部署と役職取得メソッドを取得し、search.jspに渡す
	//=============================================================
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// DB接続のためのクラスを設定
		Connection connect = null;
		PreparedStatement stmt = null;
		ResultSet result = null;

		//レスポンスをUTF-8に設定
		request.setCharacterEncoding("UTF-8");

		//処理開始
		try {

		//データソースからConnectionを取得(コネクションループを使うときに必要な処理)
		connect = ds.getConnection();

		//Beansから呼び出してデータを取得する場合はこの処理を使う
			//MemberBeans member = new MemberBeans(request);
			//member.getDepartmentData();
			//member.getPositionData();

		//sql発行準備
		StringBuffer sql = new StringBuffer();

		//sqlの処理を定義
		sql.append("select * from department");

		//現在発行しようとしているsqlをデバッグ
		System.out.println(sql);

		//ステートメントに接続用のconnectとsql(String型)を設置する
		stmt = connect.prepareStatement(new String(sql));

		//実際にステートメントを実行
		stmt.execute();

		//実行結果をResultクラス(rset)に代入
		result = stmt.executeQuery();

		//実行結果をresult.jspに渡すため、セットする
		request.setAttribute("result", result);

		// searchresult.jspへ遷移する
		request.getRequestDispatcher("index.jsp").forward(request, response);

		//rset(実行結果), stmt(ステートメント), coonect(DB接続)それぞれのクラスを.close()で閉じる
		result.close();
		stmt.close();
		connect.close();

		//例外処理
		}catch(Exception e) {
			//例外処理。DBに接続できなったなど何らかのエラーで処理が正しく動かなかった場合の処理
			e.printStackTrace();
			String status ="DB接続に失敗しました。管理者に連絡してください。";
			request.setAttribute("status", status);
			request.getRequestDispatcher("/result.jsp").forward(request, response);
		}finally {
			//処理を追加
		}
	}


	//=============================================================
	// 登録メソッド
	//=============================================================

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// DB接続のためのクラスを設定
		Connection connect = null; //=> DBとの接続、接続停止、プリペアドステートメントの準備など
		PreparedStatement stmt = null;
		ResultSet rset = null;


		//文字コードの設定
		request.setCharacterEncoding("utf-8");

		// index.jspから渡ってくる値の取得
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");

		try {

			// JDBC Driverの登録、(コネクションループを使うときは不要なのでコメントアウトしておくと良い)
			//Class.forName("com.mysql.jdbc.Driver");
			//connect = DriverManager.getConnection(
					//"jdbc:mysql://localhost:8889/company_db?serverTimezone=UTC&useSSL=false", "root", "root"
					//);

			//データソースからConnectionを取得(コネクションループを使うときに必要な処理)
			connect = ds.getConnection();

			//sql文の作成
			StringBuffer sql = new StringBuffer();

			// sql文の内容を決める。今回はselect文章でmembersテーブルからそれぞれの項目を取得してくる
			sql.append("select * from members");

			// ID
			if (id != "") {
				sql.append(" where id ='" + id + "'");
			}
			//　名前
			if (name != "") {
				sql.append(" and name ='" + name + "'");
			}

			// 性別
			if (sex != "") {
				sql.append(" and sex ='" + sex + "'");
			}

			// 年齢
			if (age != "") {
				sql.append(" and age ='" + age + "'");
			}

			//現在発行しようとしているsqlをデバッグ
			System.out.println(sql);

			//ステートメントに接続用のconnectとsql(String型)を設置する
			stmt = connect.prepareStatement(new String(sql));

			//実際にステートメントを実行
			stmt.execute();

			//実行結果をResultクラス(rset)に代入
			rset = stmt.executeQuery();

			//実行結果をresult.jspに渡すため、セットする
			request.setAttribute("result", rset);

			// searchresult.jspへ遷移する
			request.getRequestDispatcher("searchresult.jsp").forward(request, response);

			//rset(実行結果), stmt(ステートメント), coonect(DB接続)それぞれのクラスを.close()で閉じる
			rset.close();
			stmt.close();
			connect.close();

		//例外処理
		} catch (Exception e) {
			//例外処理。DBに接続できなったなど何らかのエラーで処理が正しく動かなかった場合の処理
			e.printStackTrace();
			String status ="接続に失敗しました。管理者に連絡してください。";
			request.setAttribute("status", status);
			request.getRequestDispatcher("/result.jsp").forward(request, response);

		//最終処理
		} finally {

		}

	}

}
