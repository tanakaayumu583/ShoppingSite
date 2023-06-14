package jp.co.aforce.bean;

public class User_informationBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
//ユーザ情報
	private int user_id;
	private String last_name;
	private String first_name;
	private int sex;
	private int birth_year;
	private int birth_month;
	private int birth_day;
	private int job;
	private int zip_code;      
	private int prefectures; 
	private String city_address;
	private String phone_number;
	private String delivery_mail_address;
	private int email_delivery;
//ログイン情報
	private String login_id;
	private String login_password;
	

	//ゲット
	public int getUser_id() {
		return user_id;
	}
	public String getLast_name() {
		return last_name;
	}
	public String getFirst_name() {
		return first_name;
	}
	public int getSex() {
		return sex;
	}
	public int getBirth_year() {
		return birth_year;
	}
	public int getBirth_month() {
		return birth_month;
	}
	public int getBirth_day() {
		return birth_day;
	}
	public int getJob() {
		return job;
	}
	public int getZip_code() {
		return zip_code;
	}
	public int getPrefectures() {
		return prefectures;
	}
	public String getCity_address() {
		return city_address;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public String getDelivery_mail_address() {
		return delivery_mail_address;
	}
	public int getEmail_delivery() {
		return email_delivery;
	}
	public String getLogin_id() {
		return login_id;
	}
	public String getLogin_password() {
		return login_password;
	}

	


	//セット
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public void setBirth_year(int birth_year) {
		this.birth_year = birth_year;
	}
	public void setBirth_month(int birth_month) {
		this.birth_month = birth_month;
	}
	public void setBirth_day(int birth_day) {
		this.birth_day = birth_day;
	}
	public void setJob(int job) {
		this.job = job;
	}
	public void setZip_code(int zip_code) {
		this.zip_code = zip_code;
	}
	public void setPrefectures(int prefectures) {
		this.prefectures = prefectures;
	}
	public void setCity_address(String city_address) {
		this.city_address = city_address;
	}
	
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public void setDelivery_mail_address(String delivery_mail_address) {
		this.delivery_mail_address = delivery_mail_address;
	}
	public void setEmail_delivery(int email_delivery) {
		this.email_delivery = email_delivery;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public void setLogin_password(String login_password) {
		this.login_password = login_password;
	}
	

	//セット変換
	public void setData(String post_name,String post_value) {
		switch (post_name) {
		case "user__id":
			setUser_id(Integer.parseInt(post_value));
			break;
		case "last_name":
			setLast_name(post_value);
			break;
		case "first_name":
			setFirst_name(post_value);
			break;
		case "sex":
			setSex(Integer.parseInt(post_value));
			break;
		case "birth_year":
			setBirth_year(Integer.parseInt(post_value));
			break;
		case "birth_month":
			setBirth_month(Integer.parseInt(post_value));
			break;
		case "birth_day":
			setBirth_day(Integer.parseInt(post_value));
			break;
		case "job":
			setJob(Integer.parseInt(post_value));
			break;
		case "zip_code":
			setZip_code(Integer.parseInt(post_value));
			break;
		case "prefectures":
			setPrefectures(Integer.parseInt(post_value));
			break;
		case "city_address":
			setCity_address(post_value);
			break;
		case "phone_number":
			setPhone_number(post_value);
			break;
		case "delivery_mail_address":
			setDelivery_mail_address(post_value);
			break;
		case "email_delivery":
			setEmail_delivery(Integer.parseInt(post_value));
			break;
		case "login_id":
			setLogin_id(post_value);
			break;
		case "login_password":
			setLogin_password(post_value);
			break;
		}
	}
	

	
	
}
