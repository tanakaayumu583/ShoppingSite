package jp.co.aforce.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.bean.User_informationBean;

@WebServlet("/jp.co.aforce.servlet/User_settings")
public class User_settings extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String url = "";
		//post項目名の定義
		List<String> list = new ArrayList<String>(Arrays.asList(
				"user_id", "last_name", "first_name",
				"sex", "birth_year", "birth_month",
				"birth_day", "job", "zip_code","prefectures","city_address","phone_number",
				"delivery_mail_address","email_delivery","login_id","login_password"));
		//beanにpostデータを格納
		User_informationBean pd = new User_informationBean();
		for (int i = 0; i < list.size(); i++) {
			if(request.getParameter(list.get(i))==null) {
				continue;
			}
			pd.setData(list.get(i), request.getParameter(list.get(i)));
		}
		request.setAttribute("データ", pd);
		User_informationBean p = (User_informationBean) request.getAttribute("データ");
//会員情報登録
		try {
			Regist.member_insert(p);
			url = "/ShoppingSite/views/users/login.jsp?status=regist_success";
			response.sendRedirect(url);
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		
//会員情報更新
		
//会員情報削除
	}
}

