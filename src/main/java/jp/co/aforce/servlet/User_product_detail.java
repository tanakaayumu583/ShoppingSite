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

@WebServlet("/jp.co.aforce.servlet/User_product_detail")
public class User_product_detail extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		Page.header(out);
		HttpSession session=request.getSession();
		String product_id = request.getParameter("product_id");

		try {

			String url = "";
			ProductDAO dao = new ProductDAO();
			List<ProductBean> list = new ArrayList<>();
			list = dao.search_product(product_id);
			session.setAttribute("search_product", list);
			
			if (list.size() >= 1) {
				url = "/ShoppingSite/views/users/products/detail.jsp?status=success";
				response.sendRedirect(url);
			} else {
				url = "/ShoppingSite/views/users/products/detail.jsp?status=none";
				response.sendRedirect(url);
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
