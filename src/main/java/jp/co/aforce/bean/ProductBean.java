package jp.co.aforce.bean;

public class ProductBean implements java.io.Serializable {

	private int product_id;
	private String name;
	private int price;
	private String description;
	private String p_img;
	
	//カート用
	private int quantity;
	
	public ProductBean() {
		super();
	}
	public ProductBean(int product_id,String name ,int price,int quantity ,String p_img) {
		super();
		this.product_id = product_id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.p_img = p_img;
	}
	
	public int getProduct_id() {
		return product_id;
	}
	
	public String getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	
	public String getDescription() {
		return description;
	}
	public String getP_img() {
		return p_img;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
