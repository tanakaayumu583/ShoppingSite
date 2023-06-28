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
		"SELECT * FROM particulars ORDER BY date DESC,particulars_id");
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
	
	//特定会員注文履歴取得
	public List<ParticularsBean> search_order_history(int user_id) throws Exception {

		List<ParticularsBean> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
		"SELECT * FROM particulars where user_id= ? ORDER BY date DESC,particulars_id");
		st.setInt(1, user_id);
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
	
	
	//ステータス更新
	public int update_status(String get_particulars_id,String get_select) throws Exception {
		Connection con = getConnection();
		int selected_num = 0;
		
		switch (get_select) {
		case "未発送":
		    // 式の値と値Aが一致したときの処理
			selected_num = 1;
		    break;
		case "発送済み":
		    // 式の値と値Bが一致したときの処理
			selected_num = 2;
		    break;
		case "受け取り済み":
		    // 式の値と値Bが一致したときの処理
			selected_num = 3;
			
		    break;
		case "キャンセル済み":
		    // 式の値と値Bが一致したときの処理
			selected_num = 4;
		    break;
		}

		PreparedStatement st = con.prepareStatement(
				"UPDATE particulars SET `status` = ?  WHERE particulars_id = ?");
		st.setInt(1, selected_num);
		st.setLong(2, Long.valueOf(get_particulars_id));

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}
	
	//注文キャンセル
	public int cancel_order(String get_particulars_id) throws Exception {
		Connection con = getConnection();
		PreparedStatement st = con.prepareStatement(
				"UPDATE particulars SET `status` = 4  WHERE particulars_id = ?");
		st.setLong(1, Long.valueOf(get_particulars_id));

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}
}
