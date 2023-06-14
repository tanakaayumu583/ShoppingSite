package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import jp.co.aforce.bean.ProductBean;

public class ProductDAO extends DAO {

	//商品一覧取得
	//会員登録処理　ログイン情報
	public int insert_product(ProductBean product) throws Exception {
		Connection con = getConnection();

		String sql = "insert into products (name,description,p_img)"
				+ "values(?, ? ,?)";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString   (1, product.getName());
		stmt.setString(2, product.getDescription());
		stmt.setString(3, product.getP_img());
		
		int line = stmt.executeUpdate();

		stmt.close();
		con.close();

		return line;
	}
}
