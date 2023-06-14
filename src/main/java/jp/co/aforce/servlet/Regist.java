package jp.co.aforce.servlet;

import jp.co.aforce.bean.User_informationBean;
import jp.co.aforce.dao.User_informationDAO;

public class Regist {
	public static boolean member_insert(User_informationBean p) throws Exception {
		boolean successed = false;
		//String message = "登録処理が完了しました。";
		
		User_informationDAO dao = new User_informationDAO();
		int user_id = dao.insert_k_users(p);
		p.setUser_id(user_id);
		int line = dao.insert_authorization(p);
		if(line==1) {
			successed = true;
		}else {
			//message="登録に失敗しました。";
		}
		  return successed;
		}
}
