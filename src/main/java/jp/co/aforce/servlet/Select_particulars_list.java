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

@WebServlet("/jp.co.aforce.servlet/Select_particulars_list")
public class Select_particulars_list extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		Page.header(out);
		HttpSession session=request.getSession();

		try {

			String url = "";
			ParticularsDAO dao = new ParticularsDAO();
			List<ParticularsBean> list = new ArrayList<>();
			list = dao.search_particulars_list();
			session.setAttribute("search_particulars_list", list);
			
			if (list.size() >= 1) {
				url = "/ShoppingSite/views/admin/authenticated/particulars_list.jsp?status=success";
				response.sendRedirect(url);
			} else {
				url = "/ShoppingSite/views/admin/authenticated/particulars_list.jsp?status=none";
				response.sendRedirect(url);
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
