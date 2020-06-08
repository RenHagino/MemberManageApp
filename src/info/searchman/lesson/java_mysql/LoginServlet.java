package info.searchman.lesson.java_mysql;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	//ログインに必要なidを設定
    private final String loginId = "id123";
    private final String password = "pass321";

    //post送信処理(ログイン認証)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    	throws ServletException, IOException {

    	//login.jspの中でユーザーが入力したid, passwordを取得し、変数につめる
        String sentId = request.getParameter("id");
        String sentPw = request.getParameter("password");
        //ログインのエラーメッセージをいれるステータス変数を定義
        String loginErr = "ここにログインエラーのメッセージが入ります";

        //入力フォームが空だった場合
        if(sentId.isEmpty() && sentPw.isEmpty()) {
        	loginErr = "IDとパスワードの入力欄が空です";
        	request.setAttribute("loginErr", loginErr);
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);

        }else if(sentId.isEmpty()){
        	loginErr = "IDの入力欄が空です";
            request.setAttribute("loginErr", loginErr);
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);

        }else if(sentPw.isEmpty()){
        	loginErr = "パスワードの入力欄が空です";
            request.setAttribute("loginErr", loginErr);
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);

        //ID、パスワードが合っていた場合
        }else if (sentId.equals(loginId) && sentPw.equals(password)) {
        	//sessionという変数にhttpセッションをセット
            HttpSession session = request.getSession();
            //sessionのloginUserにtrueを設定する
            session.setAttribute("loginUser", true);
            //RequestDispatcherにindex.jspを指定し、loginUserがtrueであることを知らせる
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);

        //ID、パスワードが間違っていた場合
        } else {
        	//requestにloginが失敗したという情報を詰め込み、getRequestDispatcherでlogerror.jspに遷移する;
        	loginErr = "IDまたはパスワードが違います";
        	request.setAttribute("loginErr", loginErr);
            //task: dispatcher先はlogerror.jspを直接指定しても良いかチェック
        	RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
        	rd.forward(request, response);
        }
    }

	//GET送信が飛んできた場合はログインページ(login.jsp)に遷移させる
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
        rd.forward(request, response);
    }

}
