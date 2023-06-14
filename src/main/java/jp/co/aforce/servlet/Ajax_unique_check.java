package jp.co.aforce.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.dao.User_informationDAO;

/**
 * Servlet implementation class Ajax_unique_check
 */
@WebServlet("/jp.co.aforce.servlet/Ajax_unique_check")
public class Ajax_unique_check extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		int line=99;
		
		String check = request.getParameter("check"); //チェックする文字列
		User_informationDAO dao = new User_informationDAO();
		try {
			line = dao.Unique_check(check);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(line);
	    // 応答を返す
	    response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
	    //response.getWriter().write(line); // レスポンスの内容を設定
	    if(line==0) {
	    	response.getWriter().write("Success");
	    }else if(line>=1) {
	    	response.getWriter().write("Failure");
	    }
	    

	}

}
