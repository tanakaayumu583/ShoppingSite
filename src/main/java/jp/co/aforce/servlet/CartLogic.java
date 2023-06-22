package jp.co.aforce.servlet;

import jp.co.aforce.bean.CartBean;
import jp.co.aforce.bean.ProductBean;

public class CartLogic {
	public void execute(CartBean cart, ProductBean pro) {
		boolean duplication = false;

		for (ProductBean p : cart.getList()) {
			if (pro.getProduct_id() == p.getProduct_id()) {
				//数量の更新
				p.setQuantity(p.getQuantity() + pro.getQuantity());
				duplication = true;
				break;
			}
		}
		if (duplication == false) {
			cart.getList().add(pro);
		}

		cart.setTotal(cart.getTotal() + pro.getPrice() * pro.getQuantity());
	}

}