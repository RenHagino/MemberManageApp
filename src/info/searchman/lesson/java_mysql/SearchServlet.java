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
		String department = request.getParameter("department");
		String position = request.getParameter("position");

		try {

			// JDBC Driverの登録、(コネクションループを使うときは不要なのでコメントアウトしておくと良い)
			//Class.forName("com.mysql.jdbc.Driver");
			//connect = DriverManager.getConnection(
					//"jdbc:mysql://localhost:8889/company_db?serverTimezone=UTC&useSSL=false", "root", "root"
					//);

			//データソースからConnectionを取得(コネクションループを使うときに必要な処理)
			connect = ds.getConnection();

			//sql文の作成
			//StringBuffer sql = new StringBuffer("select * from members where 1 = 1");

			//テーブル結合でデータを入手
			StringBuffer sql = new StringBuffer("select members.id, name, sex, age, d_name, p_name from members inner join `department` on members.department_id = department.id inner join `position` on members.position_id = position.id where 1 = 1");


			// ID
			if (id != "") {
				sql.append(" and id ='" + id + "'");
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

			// 部署
			if (department != "") {
				sql.append(" and department_id ='" + department + "'");
			}

			// 役職
			if (position != "") {
				sql.append(" and position_id ='" + position + "'");
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
			request.getRequestDispatcher("/error.jsp").forward(request, response);

		//最終処理
		} finally {

		}

	}

}
