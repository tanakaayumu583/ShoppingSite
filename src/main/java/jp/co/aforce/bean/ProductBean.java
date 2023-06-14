package jp.co.aforce.bean;

public class ProductBean implements java.io.Serializable {

	private int product_id;
	private String name;
	private String description;
	private String p_img;
	
	public int getProduct_id() {
		return product_id;
	}
	
	public String getName() {
		return name;
	}
	
	public String getDescription() {
		return description;
	}
	public String getP_img() {
		return p_img;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
}
