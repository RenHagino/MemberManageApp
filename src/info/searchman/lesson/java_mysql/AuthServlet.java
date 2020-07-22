package info.searchman.lesson.java_mysql;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//クラス定義
public class AuthServlet extends HttpServlet {
	//管理者用のIDとパスワードを設定
	 private final String loginId = "id123";
	 private final String loginPass = "pass321";


	//ポストメソッド
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException{

			response.setContentType("text/html; charset=Shift_JIS");

			//ログイン画面から渡ってくるidとパスワードを定義
			String id = request.getParameter("user");
			String pass = request.getParameter("pass");
			//ログインに失敗したときにエラーメッセージを格納する変数を定義
			String loginErr = "ここにログインエラーのメッセージが入ります";

			//HttpSession session = request.getSession(true);

			//idとパスワード両方の入力欄が空だった場合
			if (id.isEmpty() || pass.isEmpty()){
				loginErr = "idとパスワードが入力されていません";
				request.setAttribute("loginErr", loginErr);
	            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
	            rd.forward(request, response);

	        //idの入力欄が空だった場合
			}else if(id.isEmpty()){
				loginErr = "IDの入力欄が空です";
	            request.setAttribute("loginErr", loginErr);
	            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
	            rd.forward(request, response);

	        //パスワードの入力欄が空だった場合
			}else if(pass.isEmpty()) {
				loginErr = "パスワードの入力欄が空です";
	            request.setAttribute("loginErr", loginErr);
	            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
	            rd.forward(request, response);

	        //idもしくはパスワードが間違っていた場合
			}else if(!(id.equals(loginId)) || !(pass.equals(loginPass))) {
				//requestにloginが失敗したという情報を詰め込み、getRequestDispatcherでlogerror.jspに遷移する;
	        	loginErr = "IDまたはパスワードが違います";
	        	request.setAttribute("loginErr", loginErr);
	            //task: dispatcher先はlogerror.jspを直接指定しても良いかチェック
	        	RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
	        	rd.forward(request, response);

	        //idとパスワードが合っていた場合
			}else if( id.equals(loginId) && pass.equals(loginPass) ) {
	        	//sessionという変数にhttpセッションをセット
	            HttpSession session = request.getSession();
	            //sessionのloginUserにtrueを設定する
	            session.setAttribute("loginUser", true);
	            //RequestDispatcherにindex.jspを指定し、loginUserがtrueであることを知らせる
	            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
	            rd.forward(request, response);
			}
			//authUserメソッドを呼び出してcheckにはtrue or falseが入る
			//boolean check = authUser(user, pass);
			//if (check){
				/* 認証済みにセット */
				//session.setAttribute("login", "OK");

				/* 本来のアクセス先へ飛ばす */
				//String target = (String)session.getAttribute("target");
				//response.sendRedirect(target);
			//}else{
				/* 認証に失敗したら、ログイン画面に戻す */
			//	session.setAttribute("status", "Not Auth");
			//	response.sendRedirect("/auth/Login");
			/* 取りあえずユーザー名とパスワードが入力されていれば認証する */

		}

			//protected boolean authUser(String user, String pass){
				/* 取りあえずユーザー名とパスワードが入力されていれば認証する */
				//if (user.isEmpty() || pass.isEmpty()){
				//	request.setAttribute("loginErr", loginErr);
		        //    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		        //    rd.forward(request, response);
				//	return false;
				//}else{
				//return true;
				//}
			//}
	}