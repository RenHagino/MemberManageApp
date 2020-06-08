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
        if (session != null && session.getAttribute("loginUser") != null && (Boolean)session.getAttribute("loginUser")){
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);

        //ログインにセッションがなく、loginUserがnullの場合
        } else {
            request.setAttribute("loginErrorMsg", "編集機能や削除機能を使うにはログインが必要です。");
            request.setAttribute("errorFlg", true);
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }

		//文字コードの設定
		request.setCharacterEncoding("UTF-8");

		//モードの取得(getパラメータ取得を行う) index.jspからのリクエストでmodeが変わる
		String mode = request.getParameter("mode");

		//実行ステータスの宣言
		String status = "成功しました";

		//JavaBeansの初期化 index.jspからのrequestをMemberBeansに入れてインステンス化 (new)する
		MemberBeans member = new MemberBeans(request);

		//Switch文で登録の成功失敗を判断
		switch (mode) {

		//addDataメソッドの返り値がfalseだった場合
		case "add":
			if (member.addAllData() == false) {
				status = "データの追加に失敗しました";
			}
			break;

		//deleteDataメソッドの返り値がfalseだった場合
		case "delete":
			if (member.deleteData() == false) {
				status = "データの削除に失敗しました。";
			}
			break;

		//変更 : change.jspに遷移する
		case "change": {
			//requestにmember変数をセットし、responseと共にchange.jspに遷移する
			request.setAttribute("member", member);
			request.getRequestDispatcher("/change.jsp").forward(request, response);
			}
			break;

		//アップデート : change.jspで確定ボタンを押す
		case "update":
			if (member.updateData() == false) {
				status = "データのアップデートに失敗しました";
			}

		//それ以外の場合(trueだった場合)は特にメッセージを定義せずにbreakされる

		}

		//statusをセットしてresult.jspに転送
		request.setAttribute("status", status);
		request.getRequestDispatcher("/result.jsp").forward(request, response);
	}

	//メソッド定義 doGet
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//doPostにリクエストを流す。
		doPost(request, response);
	}
}
