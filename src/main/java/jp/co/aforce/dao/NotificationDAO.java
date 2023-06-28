package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.bean.NotificationBean;

public class NotificationDAO extends DAO {

	//通知
	public int set_notification(Long detail_number) throws Exception {
		Connection con = getConnection();

		String sql = "insert into notification(particulars_id ,`read`)"
				+ "values( ? ,0)";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setLong   (1, detail_number);
		
		int line = stmt.executeUpdate();

		stmt.close();
		con.close();

		return line;
	}
	//新着一覧取得 top画面用
	public List<NotificationBean> search_new_arrivals_notification() throws Exception {

		List<NotificationBean> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT "
				+ "    notification.id AS 'notification_id',"
				+ "    date AS 'date', "
				+ "    last_name AS 'last_name', "
				+ "    first_name AS 'first_name', "
				+ "    notification.read AS 'read',"
				+ "    SUM((particulars.product_price+tax) * particulars.quantity) AS 'sum' "
				+ "FROM notification "
				+ "JOIN particulars ON notification.particulars_id = particulars.particulars_id "
				+ "JOIN k_users ON particulars.user_id = k_users.user_id "
				+ "WHERE notification.read = 0  "
				+ "GROUP BY "
				+ "    particulars.particulars_id,k_users.first_name,k_users.last_name,particulars.date,notification.id,notification.read"
				+ " ORDER BY notification.id DESC; ");
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			NotificationBean p = new NotificationBean();
			p.setNotification_id(rs.getInt("notification_id"));
			p.setRead(rs.getInt("read"));
			p.setDate(rs.getString("date"));
			p.setFirst_name(rs.getString("first_name"));
			p.setLast_name(rs.getString("last_name"));
			p.setSum(rs.getInt("sum"));
			list.add(p);
		}
		st.close();
		con.close();
		return list;

	}
	//新着一覧取得 一覧画面用
	public List<NotificationBean> search_notification() throws Exception {

		List<NotificationBean> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT "
				+ "    notification.id AS 'notification_id',"
				+ "    date AS 'date', "
				+ "    last_name AS 'last_name', "
				+ "    first_name AS 'first_name', "
				+ "    notification.read AS 'read',"
				+ "    SUM((particulars.product_price+tax) * particulars.quantity) AS 'sum' "
				+ "FROM notification "
				+ "JOIN particulars ON notification.particulars_id = particulars.particulars_id "
				+ "JOIN k_users ON particulars.user_id = k_users.user_id "
				+ "WHERE notification.read = 0 OR notification.read = 1 "
				+ "GROUP BY "
				+ "    particulars.particulars_id,k_users.first_name,k_users.last_name,particulars.date,notification.id,notification.read"
				+ " ORDER BY notification.read ASC, notification.id DESC; ");
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			NotificationBean p = new NotificationBean();
			p.setNotification_id(rs.getInt("notification_id"));
			p.setRead(rs.getInt("read"));
			p.setDate(rs.getString("date"));
			p.setFirst_name(rs.getString("first_name"));
			p.setLast_name(rs.getString("last_name"));
			p.setSum(rs.getInt("sum"));
			list.add(p);
		}
		st.close();
		con.close();
		return list;

	}
	
	
	//既読
	public int update_notification(int notification_id) throws Exception {
		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"UPDATE notification SET `read` = 1  WHERE id = ?");
		st.setInt(1, notification_id);

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}
}
