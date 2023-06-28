package jp.co.aforce.bean;

public class NotificationBean implements java.io.Serializable {

	private int notification_id;
	private int read;
	private String date;
	private String first_name;
	private String last_name;
	private int sum;
	
	public int getNotification_id() {
		return notification_id;
	}
	public int getRead() {
		return read;
	}
	public String getDate() {
		return date;
	}
	
	public String getFirst_name() {
		return first_name;
	}
	
	public String getLast_name() {
		return last_name;
	}
	public int getSum() {
		return sum;
	}
	public void setNotification_id(int notification_id) {
		this.notification_id = notification_id;
	}
	public void setRead(int read) {
		this.read = read;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public void setSum(int sum) {
		this.sum = sum;
		
	}
}
