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

import jp.co.aforce.bean.User_informationBean;
import jp.co.aforce.dao.User_informationDAO;
import jp.co.aforce.tool.Page;

@WebServlet("/jp.co.aforce.servlet/Select_member_list")
public class Select_member_list extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		Page.header(out);
		HttpSession session=request.getSession();

		try {

			String url = "";
			User_informationDAO dao = new User_informationDAO();
			List<User_informationBean> list = new ArrayList<>();
			list = dao.search_member_list();
			session.setAttribute("search_member_list", list);
			
			if (list.size() >= 1) {
				url = "/ShoppingSite/views/admin/authenticated/member_list.jsp?status=success";
				response.sendRedirect(url);
			} else {
				url = "/ShoppingSite/views/admin/authenticated/member_list.jsp?status=none";
				response.sendRedirect(url);
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
