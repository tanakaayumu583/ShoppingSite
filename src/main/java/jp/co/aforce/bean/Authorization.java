package jp.co.aforce.bean;

public class Authorization implements java.io.Serializable {

	private int id;
	private String name;
	private String password;
	private int is_admin;
	
	public int getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public String getPassword() {
		return password;
	}
	public int getIs_admin() {
		return is_admin;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public void setIs_admin(int is_admin) {
		this.is_admin = is_admin;
		
	}
}
