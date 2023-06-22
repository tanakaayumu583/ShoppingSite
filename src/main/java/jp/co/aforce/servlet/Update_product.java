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

@WebServlet("/jp.co.aforce.servlet/Update_product")
public class Update_product extends HttpServlet {

	String url = "";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		Page.header(out);

		String product_id = request.getParameter("product_id");
		try {

			
			ProductDAO dao = new ProductDAO();
			List<ProductBean> list = new ArrayList<>();
			list = dao.search_product(product_id);
			session.setAttribute("search_product", list);
			if (list.size() == 1) {
				url = "/ShoppingSite/views/admin/authenticated/update_product.jsp";
				response.sendRedirect(url);
			} else {
				url = "/ShoppingSite/jp.co.aforce.servlet/Select_product_list";
				response.sendRedirect(url);
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		ProductDAO dao = new ProductDAO();
		ProductBean product = new ProductBean();
		product.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
		product.setName(request.getParameter("name"));
		product.setDescription(request.getParameter("description"));
		

		try {
			int line = dao.update_product(product);
			if (line == 1) {

				url = "/ShoppingSite/jp.co.aforce.servlet/Manage_product_list";
				response.sendRedirect(url);

			} else {
				url = "/ShoppingSite/jp.co.aforce.servlet/Manage_product_list";
				response.sendRedirect(url);
			}
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	}

}
