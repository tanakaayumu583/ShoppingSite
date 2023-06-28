package jp.co.aforce.servlet;

import java.io.IOException;
import java.net.InetAddress;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.bean.User_informationBean;
import jp.co.aforce.java.Mail_function;
import jp.co.aforce.java.Member_function;

@WebServlet("/jp.co.aforce.servlet/Forget_password")
public class Forget_password extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String login_url = request.getRequestURL().toString();

        String urlString = login_url;
        URL url_me = new URL(urlString);
        String host = url_me.getHost();
        String ipAddress = InetAddress.getByName(host).getHostAddress();
        
        
        
		String url = "";
		//ユーザidを取得
		String user_id = request.getParameter("login_id");

		
		try {
			//ログインidをキーにユーザ情報を取得
			List<User_informationBean> list_s_m = new ArrayList<>();
			list_s_m = Member_function.member_search_for_passwordsend(user_id);
			if(list_s_m.get(0) != null) {
				url = "/ShoppingSite/views/users/forget_password.jsp?status=none";
				response.sendRedirect(url);
			}
		    User_informationBean u_i=list_s_m.get(0);
			//パスワードをお知らせ
			Mail_function.send_password_function(u_i.getLogin_id(),u_i.getLast_name(),u_i.getLogin_password(),ipAddress);
			//画面遷移
			
			url = "/ShoppingSite/views/users/forget_password_finished.jsp";
			response.sendRedirect(url);
		} catch (Exception e) {
			e.printStackTrace();
		}


	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//doPostメソッドへ処理を渡す
		doPost(request, response);
	}
}
