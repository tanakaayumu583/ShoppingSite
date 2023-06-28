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

import jp.co.aforce.bean.ParticularsBean;
import jp.co.aforce.dao.ParticularsDAO;
import jp.co.aforce.tool.Page;

@WebServlet("/jp.co.aforce.servlet/Cancel_order")
public class Cancel_order extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		int s_user_id = 0;
		Page.header(out);
		HttpSession session=request.getSession();
		

		try {

			String url = "";
			ParticularsDAO dao = new ParticularsDAO();
			List<ParticularsBean> list = new ArrayList<>();
			
			if (session.getAttribute("s_user_id") != null) {
				s_user_id = (int) session.getAttribute("s_user_id");
			}
	        //▼キャンセル処理
			@SuppressWarnings("unused")
			int check_ok = dao.cancel_order(request.getParameter("particulars_id"));
	        //▲キャンセル処理
			list = dao.search_order_history(s_user_id);
			session.setAttribute("search_order_history", list);
			
			if (list.size() >= 1) {
				url = "/ShoppingSite/views/users/order_history.jsp?status=success";
				response.sendRedirect(url);
			} else {
				url = "/ShoppingSite/views/users/order_history.jsp?status=none";
				response.sendRedirect(url);
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
