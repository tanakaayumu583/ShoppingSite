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

@WebServlet("/jp.co.aforce.servlet/Admin_login")
public class Admin_login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
				url = "/ShoppingSite/views/admin/login.jsp?status=fail";
				response.sendRedirect(url);
			}

			for (Authorization p : list) {
				
				if (p.getPassword().equals(password)&&(p.getIs_admin()==1)) {
//					セッションの発行
					HttpSession session=request.getSession();
					session.setAttribute("s_a_user_id", p.getId());
					url = "/ShoppingSite/views/admin/authenticated/home.jsp?status=success";
					response.sendRedirect(url);

				} else {
					url = "/ShoppingSite/views/admin/login.jsp?status=fail";
					response.sendRedirect(url);
				}
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
