package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import jp.co.aforce.bean.ProductBean;

public class ShoppingDAO extends DAO {

	//購入明細挿入
	public int insert_order_detail(ProductBean product, Long detail_number,int user_id, String data) throws Exception {
		Connection con = getConnection();

		String sql = "insert into particulars (particulars_id,user_id,product_id,product_name,product_price,tax,quantity,date,status)"
				+ "values(?, ? ,?, ? ,?, ? ,?, ? ,? )";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setLong   (1, detail_number);
		stmt.setInt(2, user_id);
		stmt.setInt(3, product.getProduct_id());
		stmt.setString   (4, product.getName());
		stmt.setInt(5, product.getPrice());
		stmt.setDouble(6, (double)product.getPrice()*0.1);
		stmt.setInt   (7, product.getQuantity());
		stmt.setString(8, data);
		stmt.setInt(9, 1);
		
		int line = stmt.executeUpdate();

		stmt.close();
		con.close();

		return line;
	}
}
