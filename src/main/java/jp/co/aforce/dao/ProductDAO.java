package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.bean.ProductBean;

public class ProductDAO extends DAO {

	//商品追加
	public int insert_product(ProductBean product) throws Exception {
		int autoIncrementKey = 0;
		Connection con = getConnection();

		String sql = "insert into products (name,description,p_img,price)"
				+ "values(?, ? ,?,?)";
		PreparedStatement stmt = con.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS);
		stmt.setString   (1, product.getName());
		stmt.setString(2, product.getDescription());
		stmt.setString(3, product.getP_img());
		stmt.setInt(4, product.getPrice());
		stmt.executeUpdate();
		ResultSet res = stmt.getGeneratedKeys();
        if(res.next()){
            autoIncrementKey = res.getInt(1);
        }
		stmt.close();
		con.close();

		return autoIncrementKey;
	}
	//商品一覧取得
	public List<ProductBean> search_product_list(String keyword, String order_by) throws Exception {
		String sql_keyword = "";
		String sql_order_by = "";
		if((keyword != "")&&(keyword != null)) {
			sql_keyword = "AND name LIKE \"%"+keyword+"%\""; 
		}
		if((order_by != "")&&(order_by != null)) {
			
	        switch (order_by) {
	        case "新着":
	        	sql_order_by = " ORDER BY product_id DESC"; 
	            break;
	        case "価格が高い順":
	        	sql_order_by = " ORDER BY `price` DESC"; 
	            break;
	        case "価格が安い順":
	        	sql_order_by = " ORDER BY price ASC"; 
	            break;
	        }
		}

		List<ProductBean> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"select * from products where ((deleted is null or deleted != 1)"
				+ sql_keyword
				+ ")"
				+ sql_order_by
				);
		//st.setString(1, s_a_user_id);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			ProductBean p = new ProductBean();

			p.setProduct_id(rs.getInt("product_id"));
			p.setName(rs.getString("name"));
			p.setPrice(rs.getInt("price"));
			p.setDescription(rs.getString("description"));
			p.setP_img(rs.getString("p_img"));
			list.add(p);
		}
		st.close();
		con.close();
		return list;

	}
	//特定商品取得
	public List<ProductBean> search_product(String product_id) throws Exception {

		List<ProductBean> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"select * from products where product_id = ?");
		st.setString(1, product_id);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			ProductBean p = new ProductBean();

			p.setProduct_id(rs.getInt("product_id"));
			p.setName(rs.getString("name"));
			p.setPrice(rs.getInt("price"));
			p.setDescription(rs.getString("description"));
			p.setP_img(rs.getString("p_img"));
			list.add(p);
		}
		st.close();
		con.close();
		return list;

	}
	//商品更新
	public int update_product(ProductBean product) throws Exception {
		Connection con = getConnection();
		String sql_pimg = "";
		if(product.getP_img() == null) {
			sql_pimg = "";
		}else {
			sql_pimg = ",p_img = \""+product.getP_img()+"\"";
		}

		PreparedStatement st = con.prepareStatement(
				"UPDATE products SET name = ?,description = ?"
				+ sql_pimg
				+ "  WHERE product_id = ?");
		st.setString(1, product.getName());
		st.setString(2, product.getDescription());
//		st.setString(3, product.getP_img());
		st.setInt(3, product.getProduct_id());

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}
	//商品削除
	public int delete_product(String product_ids) throws Exception {
		int product_id = Integer.valueOf(product_ids);
		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"UPDATE products SET deleted = 1  WHERE product_id = ?");
		st.setInt(1, product_id);

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}
	//おすすめ商品取得
	public List<ProductBean> search_recommend_product_list() throws Exception {

		List<ProductBean> list = new ArrayList<>();

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"select * from recommend_product left join products ON recommend_product.product_id = products.product_id");
		ResultSet rs = st.executeQuery();

		while (rs.next()) {
			ProductBean p = new ProductBean();

			p.setProduct_id(rs.getInt("product_id"));
			p.setName(rs.getString("name"));
			p.setPrice(rs.getInt("price"));
			p.setDescription(rs.getString("description"));
			p.setP_img(rs.getString("p_img"));
			list.add(p);
		}
		st.close();
		con.close();
		return list;

	}
}
