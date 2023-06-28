package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.bean.Authorization;

public class LoginDAO extends DAO {

	//ログイン時に使用
	public List<Authorization> login_check(String keyword) throws Exception {
		List<Authorization> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"select * from authorization where login_id = ? and authenticated = 1");
		st.setString(1, keyword);
		ResultSet rs = st.executeQuery();


		while (rs.next()) {
			Authorization p = new Authorization();
			p.setId(rs.getInt("user_id"));
			p.setName(rs.getString("login_id"));
			p.setPassword(rs.getString("login_password"));
			p.setIs_admin(rs.getInt("is_admin"));
			list.add(p);
		}
		st.close();
		con.close();
		

		return list;

	}
}
