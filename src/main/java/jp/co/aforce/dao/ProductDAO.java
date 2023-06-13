package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.bean.Product;

public class ProductDAO extends DAO {

	//ログイン時に使用
	public List<Product> login_check(String keyword) throws Exception {
		List<Product> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"select * from authorization where login_id = ? ");
		st.setString(1, keyword);
		ResultSet rs = st.executeQuery();


		while (rs.next()) {
			Product p = new Product();
			p.setId(rs.getInt("user_id"));
			p.setName(rs.getString("login_id"));
			p.setPassword(rs.getString("login_password"));
			list.add(p);
		}
		st.close();
		con.close();
		

		return list;

	}
}
