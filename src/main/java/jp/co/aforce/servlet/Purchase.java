package jp.co.aforce.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.bean.CartBean;
import jp.co.aforce.bean.ProductBean;
import jp.co.aforce.dao.NotificationDAO;
import jp.co.aforce.dao.ShoppingDAO;

@WebServlet("/jp.co.aforce.servlet/Purchase")
public class Purchase extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		//セッション受け取り
		HttpSession session = request.getSession();
		CartBean cart = (CartBean) session.getAttribute("cart");
		

		try {
			int s_user_id = (int)session.getAttribute("s_user_id");
			//日付取得
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String data = sdf.format(timestamp);
			//明細番号の発行
			Date date = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMddHHmmss");
			String dateString = dateFormat.format(date);
			Long detail_number = Long.parseLong(dateString + "99");
			//カート内のlistの個数分insert処理を繰り返す

			for (ProductBean p : cart.getList()) {
				ShoppingDAO sd = new ShoppingDAO();
				sd.insert_order_detail(p, detail_number, s_user_id, data);
			}
			//▼通知処理
			NotificationDAO n = new NotificationDAO();
			n.set_notification(detail_number);
			//▲通知処理
			
			session.removeAttribute("cart");
			
			//購入完了画面に遷移
			response.sendRedirect("/ShoppingSite/views/users/home.jsp");
			

		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

	}
}
