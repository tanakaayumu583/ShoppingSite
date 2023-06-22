package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.bean.ParticularsBean;

public class ParticularsDAO extends DAO {

	//明細一覧取得
	public List<ParticularsBean> search_particulars_list() throws Exception {

		List<ParticularsBean> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
		"SELECT * FROM particulars ORDER BY date ,particulars_id");
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			ParticularsBean p = new ParticularsBean();

			p.setId(rs.getInt("id"));
			p.setParticulars_id(rs.getLong("particulars_id"));
			p.setUser_id(rs.getInt("user_id"));
			p.setProduct_id(rs.getInt("product_id"));
			p.setProduct_name(rs.getString("product_name"));
			p.setProduct_price(rs.getInt("product_price"));
			p.setTax(rs.getInt("tax"));
			p.setQuantity(rs.getInt("quantity"));
			p.setDate(rs.getString("date"));
			p.setStatus(rs.getInt("status"));
			list.add(p);
		}
		st.close();
		con.close();
		return list;

	}
}
