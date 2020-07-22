package info.searchman.lesson.java_mysql;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//クラス定義
public class EditServlet extends HttpServlet {

	//フィールド定義
	private static final long serialVersionUID = 1L;

	//メソッド定義 doPost
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//ログインセッションチェック
		HttpSession session = request.getSession(false);

		//ログインユーザーセッションが残っていた場合は何も処理を行わない
        if (session != null && session.getAttribute("loginUser") != null && (Boolean)session.getAttribute("loginUser")){

        //ログインにセッションがなく、loginUserがnullの場合
        } else {
            request.setAttribute("loginErrorMsg", "編集機能や削除機能を使うにはログインが必要です。");
            request.setAttribute("errorFlg", true);
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }

    try {
		//文字コードの設定
		request.setCharacterEncoding("UTF-8");

		//モードの取得(getパラメータ取得を行う) index.jspからのリクエストでmodeが変わる
		String mode = request.getParameter("mode");

		//実行ステータスの宣言
		String status = "成功しました";

		//JavaBeansの初期化 index.jspからのrequestをMemberBeansに入れてインステンス化する
		MemberBeans member = new MemberBeans(request);

		//Switch文で登録の成功失敗を判断
		switch (mode) {

		//所属事務所取得メソッド
		case "getD":
			if (member.getDepartmentData() == true) {
				status = "所属事務所のデータ取得に成功しました";
				//statusをセットしてresult.jspに転送
				request.getRequestDispatcher("/result.jsp").forward(request, response);
			}
			break;

		//社員追加メソッド
		case "add":
			if (member.addAllData() == false) {
				status = "データの追加に失敗しました";
				request.setAttribute("status", status);
				request.getRequestDispatcher("/sample.jsp").forward(request, response);
			}else {
				status = "データの追加に成功しました";
				request.setAttribute("status", status);
				request.getRequestDispatcher("/sample.jsp").forward(request, response);
			}
			break;

		//削除確認メソッド
		case "check" :
			request.setAttribute("member", member);
			request.getRequestDispatcher("/delete.jsp").forward(request, response);
			break;

		//削除確定メソッド
		case "delete":
			if (member.deleteData() == false) {
				status = "データの削除に失敗しました。";
			}else{
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
			break;

		//変更 : change.jspに遷移する
		case "change":
			request.setAttribute("member", member);
			request.getRequestDispatcher("/change.jsp").forward(request, response);
			//なぜbreakではなくreturn???
			break;

		//変更確定 : change.jspで確定ボタンを押す
		case "update":
			if (member.updateData() == false) {
				status = "データのアップデートに失敗しました";
			}
			break;
		}

		//statusをセットしてresult.jspに転送
		request.setAttribute("status", status);
		request.getRequestDispatcher("/result.jsp").forward(request, response);

    }catch(Exception e) {
    	//例外処理。DBに接続できなったなど何らかのエラーで処理が正しく動かなかった場合の処理
		e.printStackTrace();
	}

	}
	//メソッド定義 doGet
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//doPostにリクエストを流す。
		doPost(request, response);
	}
}
