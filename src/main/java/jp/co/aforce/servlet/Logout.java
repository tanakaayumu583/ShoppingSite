package jp.co.aforce.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.tool.Page;

@WebServlet("/jp.co.aforce.servlet/Logout")
public class Logout extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		Page.header(out);

		String status = request.getParameter("status");
		try {
		    HttpSession session = request.getSession(true);
		    session.invalidate();

		    if(status.equals("admin")) {
		    	response.sendRedirect("/ShoppingSite/views/admin/login.jsp?status=logout");
		    }else if(status.equals("users")){
		    	response.sendRedirect("/ShoppingSite/views/users/home.jsp?status=logout");
		    }
		    

		} catch (Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
