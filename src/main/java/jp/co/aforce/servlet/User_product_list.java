package jp.co.aforce.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.bean.Authorization;
import jp.co.aforce.dao.LoginDAO;
import jp.co.aforce.tool.Page;

@WebServlet("/jp.co.aforce.servlet/User_produvt_list")
public class User_product_list extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		Page.header(out);

		try {

			String user_name = request.getParameter("user_name");
			String password = request.getParameter("password");
			String url = "";
			LoginDAO dao = new LoginDAO();

			List<Authorization> list = dao.login_check(user_name);
			if(list.isEmpty()) {
				url = "/ShoppingSite/views/users/login.jsp?status=fail";
				response.sendRedirect(url);
			}

			for (Authorization p : list) {
				
				if (p.getPassword().equals(password)) {
//					セッションの発行
					HttpSession session=request.getSession();
					session.setAttribute("s_user_id", p.getId());
					url = "/ShoppingSite/views/users/home.jsp?status=success";
					response.sendRedirect(url);

				} else {
					url = "/ShoppingSite/views/users/login.jsp?status=fail";
					response.sendRedirect(url);
				}
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
