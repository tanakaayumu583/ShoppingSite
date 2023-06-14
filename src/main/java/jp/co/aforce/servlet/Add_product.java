package jp.co.aforce.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.bean.ProductBean;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Page;

@WebServlet("/jp.co.aforce.servlet/Add_product")
public class Add_product extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		Page.header(out);
		//postの値を取得
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		//beanに格納
		ProductBean product = new ProductBean();
		product.setName(name);
		product.setDescription(description);

		try {

			String url = "";
			ProductDAO dao = new ProductDAO();
			int line = dao.insert_product(product);
			if (line == 1) {
				url = "/ShoppingSite/views/admin/authenticated/add_product.jsp?status=success";
				response.sendRedirect(url);
			}else {
				
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
