package jp.co.aforce.servlet;

import java.io.IOException;
import java.net.InetAddress;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.bean.User_informationBean;
import jp.co.aforce.java.Member_function;

@WebServlet("/jp.co.aforce.servlet/User_settings")
public class User_settings extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String url = "";
		int user_id = 0;
		//getの時はデータがないのでsessionからuser_idを取得して格納する。
		if (session.getAttribute("s_user_id") != null) {
			int s_user_id = (int) session.getAttribute("s_user_id");
			user_id = s_user_id;
		}

		//post項目名の定義
		List<String> list = new ArrayList<String>(Arrays.asList(
				"user_id", "last_name", "first_name",
				"sex", "birth_year", "birth_month",
				"birth_day", "job", "zip_code", "prefectures", "city_address", "phone_number",
				"delivery_mail_address", "email_delivery", "login_id", "login_password"));
		//beanにpostデータを格納
		User_informationBean pd = new User_informationBean();
		for (int i = 0; i < list.size(); i++) {
			if (request.getParameter(list.get(i)) == null) {
				continue;
			}
			pd.setData(list.get(i), request.getParameter(list.get(i)));
		}
		request.setAttribute("データ", pd);
		User_informationBean p = (User_informationBean) request.getAttribute("データ");

		String post_type = request.getParameter("post_type");
		String login_url = request.getRequestURL().toString();
        String urlString = login_url;
        URL url_me = new URL(urlString);
        String host = url_me.getHost();
        String ipAddress = InetAddress.getByName(host).getHostAddress();
		switch (post_type) {
		//会員情報登録
		case "regist":
			try {
				Member_function.member_insert(p,ipAddress);
				url = "/ShoppingSite/views/users/finished_regist.jsp";
				response.sendRedirect(url);
			} catch (Exception e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
			break;
		//会員情報更新のための検索
		case "search":
			try {
				List<User_informationBean> list_s_m = new ArrayList<>();
				list_s_m = Member_function.member_search(user_id);
				session.setAttribute("search_member", list_s_m);
				url = "/ShoppingSite/views/users/update.jsp";
				response.sendRedirect(url);
			} catch (Exception e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}

			break;
		//会員情報更新
		case "update":
			boolean check = false;
			try {
				check = Member_function.member_update(p);
				if(check) {
				url = "/ShoppingSite/views/users/home.jsp";
				response.sendRedirect(url);
				}
			} catch (Exception e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
			break;
		default:

		}

		//会員情報更新

		//会員情報削除
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//doPostメソッドへ処理を渡す
		doPost(request, response);
	}
}
