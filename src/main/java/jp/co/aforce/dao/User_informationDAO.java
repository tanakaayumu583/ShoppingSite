package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.bean.User_informationBean;

public class User_informationDAO extends DAO {
	//重複チェック
	public int Unique_check(String check) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT COUNT(*) AS DB_ordernumber FROM authorization WHERE login_id = ?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, check);
		
		ResultSet rs = stmt.executeQuery();
		rs.next();
		Integer line = Integer.valueOf((rs.getInt("DB_ordernumber")));
		stmt.close();
		con.close();

		return line;
	}
	//会員登録処理 会員情報
	public int insert_k_users(User_informationBean product) throws Exception {
		int autoIncrementKey = 0;
		Connection con = getConnection();

		String sql = "insert into k_users (last_name,first_name,sex,birth_year,birth_month,birth_day,job,zip_code,prefectures,city_address,phone_number,delivery_mail_address,email_delivery)"
				+ "values(?, ? ,?, ? ,?, ? ,?, ? ,?, ?,?,?,?)";
		PreparedStatement stmt = con.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, product.getLast_name());
		stmt.setString(2, product.getFirst_name());
		stmt.setInt   (3, product.getSex());
		stmt.setInt   (4, product.getBirth_year());
		stmt.setInt   (5, product.getBirth_month());
		stmt.setInt   (6, product.getBirth_day());
		stmt.setInt   (7, product.getJob());
		stmt.setInt   (8, product.getZip_code());
		stmt.setInt   (9, product.getPrefectures());
		stmt.setString(10, product.getCity_address());
		stmt.setString(11, product.getPhone_number());
		stmt.setString(12, product.getDelivery_mail_address());
		stmt.setInt   (13, product.getEmail_delivery());
		stmt.executeUpdate();
		ResultSet res = stmt.getGeneratedKeys();
        if(res.next()){
            autoIncrementKey = res.getInt(1);
        }
		stmt.close();
		con.close();

		return autoIncrementKey;
	}
	//会員登録処理　ログイン情報
	public int insert_authorization(User_informationBean product) throws Exception {
		Connection con = getConnection();

		String sql = "insert into authorization (user_id,login_id,login_password)"
				+ "values(?, ? ,?)";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt   (1, product.getUser_id());
		stmt.setString(2, product.getLogin_id());
		stmt.setString(3, product.getLogin_password());
		
		int line = stmt.executeUpdate();

		stmt.close();
		con.close();

		return line;
	}
	
	//会員一覧取得
	public List<User_informationBean> search_member_list() throws Exception {

		List<User_informationBean> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
		"SELECT * FROM k_users LEFT JOIN authorization ON k_users.user_id = authorization.user_id");
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			User_informationBean p = new User_informationBean();

			p.setUser_id(rs.getInt("user_id"));
			p.setLast_name(rs.getString("last_name"));
			p.setFirst_name(rs.getString("first_name"));
			p.setSex(rs.getInt("sex"));
			p.setBirth_year(rs.getInt("birth_year"));
			p.setBirth_month(rs.getInt("birth_month"));
			p.setBirth_day(rs.getInt("birth_day"));
			p.setJob(rs.getInt("job"));
			p.setZip_code(rs.getInt("zip_code"));
			p.setPrefectures(rs.getInt("prefectures"));
			p.setCity_address(rs.getString("city_address"));
			p.setPhone_number(rs.getString("phone_number"));
			p.setDelivery_mail_address(rs.getString("delivery_mail_address"));
			p.setEmail_delivery(rs.getInt("email_delivery"));
			p.setLogin_id(rs.getString("login_id"));
			p.setLogin_password(rs.getString("login_password"));
			list.add(p);
		}
		st.close();
		con.close();
		return list;

	}
	
	//特定会員情報取得
	public List<User_informationBean> search_member(int user_id) throws Exception {

		List<User_informationBean> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
		"SELECT * FROM k_users INNER JOIN authorization ON k_users.user_id = authorization.user_id where k_users.user_id = ?");
		st.setInt(1, user_id);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			User_informationBean p = new User_informationBean();

			p.setUser_id(rs.getInt("user_id"));
			p.setLast_name(rs.getString("last_name"));
			p.setFirst_name(rs.getString("first_name"));
			p.setSex(rs.getInt("sex"));
			p.setBirth_year(rs.getInt("birth_year"));
			p.setBirth_month(rs.getInt("birth_month"));
			p.setBirth_day(rs.getInt("birth_day"));
			p.setJob(rs.getInt("job"));
			p.setZip_code(rs.getInt("zip_code"));
			p.setPrefectures(rs.getInt("prefectures"));
			p.setCity_address(rs.getString("city_address"));
			p.setPhone_number(rs.getString("phone_number"));
			p.setDelivery_mail_address(rs.getString("delivery_mail_address"));
			p.setEmail_delivery(rs.getInt("email_delivery"));
			p.setLogin_id(rs.getString("login_id"));
			p.setLogin_password(rs.getString("login_password"));
			list.add(p);
		}
		st.close();
		con.close();
		return list;
	}
	//特定会員情報取得 パスワード用
	public List<User_informationBean> search_member_for_passwordsend(String login_id) throws Exception {

		List<User_informationBean> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
		"SELECT * FROM k_users INNER JOIN authorization ON k_users.user_id = authorization.user_id where authorization.login_id = ?");
		st.setString(1, login_id);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			User_informationBean p = new User_informationBean();

			p.setUser_id(rs.getInt("user_id"));
			p.setLast_name(rs.getString("last_name"));
			p.setFirst_name(rs.getString("first_name"));
			p.setLogin_id(rs.getString("login_id"));
			p.setLogin_password(rs.getString("login_password"));
			list.add(p);
		}
		st.close();
		con.close();
		return list;
	}
	//更新処理
	public int update_k_users(User_informationBean product) throws Exception {
		Connection con = getConnection();

		System.out.println(product.getUser_id());
		PreparedStatement st = con.prepareStatement(
				"UPDATE k_users SET last_name = ? , first_name = ? , sex = ? , birth_year = ? , birth_month = ? "
						+ ", birth_day = ? , job = ? ,zip_code = ? ,prefectures = ?,city_address = ?, phone_number = ?, delivery_mail_address = ? ,email_delivery = ? WHERE user_id = ?");
		st.setString(1, product.getLast_name());
		st.setString(2, product.getFirst_name());
		st.setInt(3, product.getSex());
		st.setInt(4, product.getBirth_year());
		st.setInt(5, product.getBirth_month());
		st.setInt(6, product.getBirth_day());
		st.setInt(7, product.getJob());
		st.setInt(8, product.getZip_code());
		st.setInt(9, product.getPrefectures());
		st.setString(10, product.getCity_address());
		st.setString(11, product.getPhone_number());
		st.setString(12, product.getDelivery_mail_address());
		st.setInt(13, product.getEmail_delivery());
		st.setInt(14, product.getUser_id());

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}
	
	//更新処理
	public int update_authorization(User_informationBean product) throws Exception {
		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"UPDATE authorization SET login_password = ? WHERE user_id = ?");
		st.setString(1, product.getLogin_password());
		st.setInt(2, product.getUser_id());

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}
	
	//ユーザ認証
	public int user_authentication(String user_mail) throws Exception {
		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"UPDATE authorization SET authenticated = 1  WHERE login_id = ?");
		st.setString(1, user_mail);

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}

}
