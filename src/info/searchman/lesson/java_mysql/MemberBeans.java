package info.searchman.lesson.java_mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;


public class MemberBeans {

	//=============================================
	//フィールド
	//=============================================
	private String id;
	private String name;
	private String sex;
	private String age;
	private String department;
	private String position;
	//==============================================
	//セッターゲッター
	//==============================================

	//ID
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	//名前
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	//性別
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	//年齢
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	//所属部署
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	//役職
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

	//================================================
	//DB関連の初期設定
	//================================================
	private Connection connect = null;
	private PreparedStatement stmt = null;
	private DataSource ds = null;

	//=================================================
	// コンストラクタ : ブラウザから飛んできたrequestのキー(id,name,sex,age)に基づいてセッターを呼び出す
	//=================================================
	public MemberBeans(HttpServletRequest request) {
		setId(request.getParameter("id"));
		setName(request.getParameter("name"));
		setSex(request.getParameter("sex"));
		setAge(request.getParameter("age"));
		//追加
		setDepartment(request.getParameter("department"));
		setPosition(request.getParameter("position"));
	}

	//================================================
	//DBへのアクション設定
	//================================================
	public void doDataBase(String sql) throws Exception {

		//設定コンテキストを/WebContent/META-INF/contex.htmlから取得
		InitialContext ic = new InitialContext();

		// context.htmlにある設定から使用したいDBの接続設定を.lookupで呼び出す。
		ds = (DataSource) ic.lookup("java:comp/env/jdbc/memberManage");
		//
		connect = ds.getConnection();

		//SQL文を表示
		System.out.println(sql);
		//ステートメントにSQLをつめる
		stmt = connect.prepareStatement(sql);
		//SQLを実行
		stmt.execute();
		//使用したオブジェクトを終了
		stmt.close();
		connect.close();

	}

	//====================================================
	// 所属部署取得メソッド
	//====================================================
	public Boolean getDepartmentData() {
		try {
			//sql作成
			String sql = "select * from department";
			//DBに接続
			doDataBase(sql);
			//結果を返す
			return true;

		//例外処理
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	//====================================================
	// 役職取得メソッド
	//====================================================
	public Boolean getPositionData() {
		try {
			//sql作成
			String sql = "select * from position";
			//DBに接続
			doDataBase(sql);
			//結果を返す
			return true;

		//例外処理
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	//====================================================
	// 所属部署取得メソッド2
	//====================================================
		public Boolean getDepartmentData_2() {
			try {
				//sql作成
				String sql = "select * from department";
				//DBに接続
				doDataBase(sql);
				//結果を返す
				return true;

			//例外処理
			}catch(Exception e) {
				e.printStackTrace();
				return false;
			}
		}
	//====================================================
	// 役職取得メソッド2
	//====================================================
		public Boolean getPositionData_2() {
			try {
				//sql作成
				String sql = "select * from position";
				//DBに接続
				doDataBase(sql);
				//結果を返す
				return true;

			//例外処理
			}catch(Exception e) {
				e.printStackTrace();
				return false;
			}
		}
	//====================================================
	//データ 追加メソッド insert todo:部署と役職も追加できるように
	//====================================================
	public Boolean addData() {
		try {

			// sql文 の作成
			String sql = "insert into members(name, sex, age, department_id, position_id)"
				+ "values ('" + name + "','" + sex + "','" + age + "')";

			// データベース接続&sqlの実行
			doDataBase(sql);

			//trueを返す
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	//====================================================
	//データ追加メソッド2
	//====================================================
	public Boolean addAllData() {
		try {

			// sql文 の作成
			String sql = "insert into members(name, sex, age, department_id, position_id)"
					+ "values ('" + name + "','"+ sex + "'," + age + "," + department + "," + position + ")";

			// データベース接続&sqlの実行
			doDataBase(sql);

			//trueを返す
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	//===================================================
	//データ 削除メソッド　delete
	//===================================================
	public Boolean deleteData() {
		try{
			//sql文の作成
			String sql = " delete from members Where id = " + id;

			// データベース接続&sqlの実行
			doDataBase(sql);

			//結果を返す(Boolean)
			return true;

		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	//===================================================
	//データ 更新メソッド　Update todo:部署と役職も編集できるように
	//===================================================
	//public Boolean change() {
		//return true;
	//}

	//===================================================
	//データ 更新メソッド　Update todo:部署と役職も編集できるように
	//===================================================
	public Boolean updateData() {
		try {
			//sql文の作成
			//UPDATE `members` SET `id`= 1,  `name`= '健太浪', `sex`= '男性', `age` = 24 WHERE `id` = 1 ;
			String sql = " Update members set name = '" + name + "', sex = '" + sex + "', age = '" + age + "', department_id = '" + department + "', position_id = '" + position + "' WHERE id = " + id;

			// データベース接続&sqlの実行
			doDataBase(sql);

			//結果を返す(Boolean)
			return true;

		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}



}
