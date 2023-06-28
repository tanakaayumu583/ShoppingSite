package jp.co.aforce.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.bean.CartBean;

@WebServlet("/jp.co.aforce.servlet/Delete_cart_one_product")
public class Delete_cart_one_product extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String url="";

		//Get受け取り
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		//セッション受け取り
		HttpSession session=request.getSession();
		CartBean cart=(CartBean)session.getAttribute("cart");
		//中身確認
		if(cart==null) {
			cart=new CartBean();
		}
		CartLogic logic=new CartLogic();
		logic.execute_delete_one_product(cart,product_id);
		session.setAttribute("cart", cart);
		
		url = "/ShoppingSite/views/users/shopping/cart.jsp?cart_product_delete=sccess";
		response.sendRedirect(url);
		
	}

}
