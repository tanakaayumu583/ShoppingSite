package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

}
