package jp.co.aforce.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.bean.Product;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Page;

@WebServlet("/jp.co.aforce.servlet/Login")
public class Login extends HttpServlet {

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
			ProductDAO dao = new ProductDAO();

			List<Product> list = dao.login_check(user_name);
			if(list.isEmpty()) {
				url = "/ShoppingSite/views/users/login.jsp?status=fail";
				response.sendRedirect(url);
			}

			for (Product p : list) {
				
				if (p.getPassword().equals(password)) {
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
