package jp.co.aforce.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.bean.CartBean;
import jp.co.aforce.bean.ProductBean;

@WebServlet("/jp.co.aforce.servlet/Set_cart")
public class Set_cart extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String url="";

		//Post受け取り
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String p_img = request.getParameter("p_img");
		//セッション受け取り
		HttpSession session=request.getSession();
		CartBean cart=(CartBean)session.getAttribute("cart");
		//中身確認
		if(cart==null) {
			cart=new CartBean();
		}

		ProductBean pro=new ProductBean(product_id,name,price,quantity,p_img);
		CartLogic logic=new CartLogic();
		logic.execute(cart, pro);
		session.setAttribute("cart", cart);
		
		url = "/ShoppingSite/views/users/shopping/cart.jsp";
		response.sendRedirect(url);
		
	}

}
