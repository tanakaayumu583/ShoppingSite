package jp.co.aforce.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class CartBean implements Serializable{
	private List<ProductBean> list;
	private int total;
	public CartBean() {
		super();
		list=new ArrayList<>();
		total=0;
	}

	public List<ProductBean> getList() {
		return list;
	}
	public void setList(List<ProductBean> list) {
		this.list = list;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

}
