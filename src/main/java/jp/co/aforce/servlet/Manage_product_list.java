package jp.co.aforce.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.bean.ProductBean;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Page;

@WebServlet("/jp.co.aforce.servlet/Manage_product_list")
public class Manage_product_list extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		Page.header(out);
		//getの値を取得　今後開発予定
		//検索や並べ替え用
		//String name = request.getParameter("name");
		//String description = request.getParameter("description");
		//beanに格納
		//s_a_user_id = se
		HttpSession session=request.getSession();
		//String s_a_user_id = (String)session.getAttribute("s_a_user_id");

		try {
			String none = "";

			String url = "";
			ProductDAO dao = new ProductDAO();
			List<ProductBean> list = new ArrayList<>();
			list = dao.search_product_list(none,none);
			session.setAttribute("search_product_list", list);
			
			if (list.size() >= 1) {
				url = "/ShoppingSite/views/admin/authenticated/product_list.jsp?status=success";
				response.sendRedirect(url);
			} else {
				url = "/ShoppingSite/views/admin/authenticated/product_list.jsp?status=none";
				response.sendRedirect(url);
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
