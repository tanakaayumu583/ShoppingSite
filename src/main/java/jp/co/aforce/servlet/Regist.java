package jp.co.aforce.servlet;

import jp.co.aforce.bean.MemberInformationBean;
import jp.co.aforce.dao.Member_informationDAO;

public class Regist {
	public static boolean member_insert(MemberInformationBean p) throws Exception {
		boolean successed = false;
		//String message = "登録処理が完了しました。";
		
		Member_informationDAO dao = new Member_informationDAO();
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
