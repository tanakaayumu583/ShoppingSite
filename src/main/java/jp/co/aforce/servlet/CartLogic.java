package jp.co.aforce.servlet;

import java.util.Iterator;

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

	public void execute_update_quantity(CartBean cart, int product_id, int quantity_level) {
		//数量を増減させる商品のidを検索
		for (ProductBean p : cart.getList()) {
			if (product_id == p.getProduct_id()) {
				//数量の増減
				p.setQuantity(p.getQuantity() + quantity_level);
				
				//合計金額の修正
				cart.setTotal(cart.getTotal() + p.getPrice()*quantity_level);
				break;
			}
		}
	}
	
	public void execute_delete_one_product(CartBean cart, int product_id) {
		//削除商品のidを検索
		Iterator<ProductBean> it = cart.getList().iterator();
		while (it.hasNext()) {
			ProductBean p = it.next();
			if (product_id == p.getProduct_id()) {
				//合計金額の修正
				cart.setTotal(cart.getTotal() - p.getPrice()* p.getQuantity());
				
				//削除
				it.remove();
				break;
			}
		}
	}

}