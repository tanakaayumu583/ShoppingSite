package jp.co.aforce.bean;

public class ParticularsBean implements java.io.Serializable {

	private int id;
	private long particulars_id;
	private int user_id;
	private String name;
	private int product_id;
	private String product_name;
	private int product_price;
	private int tax;
	private int quantity;
	private String date;
	private int status;
	
	
	public int getId() {
		return id;
	}
	
	public Long getParticulars_id() {
		return particulars_id;
	}
	public int getUser_id() {
		return user_id;
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public String getName() {
		return name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public int getTax() {
		return tax;
	}
	
	public int getQuantity() {
		return quantity;
	}
	public String getDate() {
		return date;
	}
	public int getStatus() {
		return status;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public void setParticulars_id(long particulars_id) {
		this.particulars_id = particulars_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
