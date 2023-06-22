package jp.co.aforce.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Page;

@WebServlet("/jp.co.aforce.servlet/Delete_product")
public class Delete_product extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		Page.header(out);


		String product_ids = request.getParameter("product_id");
		try {

			String url = "";
			ProductDAO dao = new ProductDAO();
			int line = dao.delete_product(product_ids);
			if (line == 1) {
				url = "/ShoppingSite/jp.co.aforce.servlet/Manage_product_list";
				response.sendRedirect(url);
			}else {
				url = "/ShoppingSite/jp.co.aforce.servlet/Manage_product_list";
				response.sendRedirect(url);
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
