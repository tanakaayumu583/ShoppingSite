package jp.co.aforce.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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

@WebServlet("/jp.co.aforce.servlet/User_product_list")
public class User_product_list extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		

		PrintWriter out = response.getWriter();

		String keyword = "";
		String order_by = "";
		Page.header(out);
		//getの値を取得　今後開発予定
		//検索や並べ替え用
		keyword = request.getParameter("keyword");
		order_by = request.getParameter("order_by");
		//beanに格納
		HttpSession session=request.getSession();

		try {

			String url = "";
			ProductDAO dao = new ProductDAO();
			List<ProductBean> list = new ArrayList<>();
			list = dao.search_product_list(keyword,order_by);


			if (list.size() >= 1) {
				String encodedKeyword = "";
				String encodedOrderBy = "";
				if((keyword != "")&&(keyword != null)) {
				encodedKeyword = URLEncoder.encode(keyword, "UTF-8");
				}
				if((order_by != "")&&(order_by != null)) {
				encodedOrderBy = URLEncoder.encode(order_by, "UTF-8");
				}
				session.setAttribute("search_product_list", list);

				url = "/ShoppingSite/views/users/shopping/product_list.jsp?status=success&keyword=" + encodedKeyword + "&order_by=" + encodedOrderBy;
				response.sendRedirect(url);
			} else {
				url = "/ShoppingSite/views/users/shopping/product_list.jsp?status=none";
				response.sendRedirect(url);
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
