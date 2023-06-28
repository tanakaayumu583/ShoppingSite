package jp.co.aforce.java;

import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.bean.User_informationBean;
import jp.co.aforce.dao.User_informationDAO;

public class Member_function {
	//会員情報登録
	public static boolean member_insert(User_informationBean p,String login_url) throws Exception {
		boolean successed = false;
		//String message = "登録処理が完了しました。";

		User_informationDAO dao = new User_informationDAO();
		int user_id = dao.insert_k_users(p);
		p.setUser_id(user_id);
		int line = dao.insert_authorization(p);
		if (line == 1) {

			successed = Mail_function.send_mail_function(p.getLogin_id(), p.getLast_name(),login_url);

		} else {
			//message="登録に失敗しました。";
		}
		return successed;
	}

	//会員情報検索
	public static List<User_informationBean> member_search(int user_id) throws Exception {
		//String message = "登録処理が完了しました。";
		User_informationDAO dao = new User_informationDAO();
		List<User_informationBean> list = new ArrayList<>();
		list = dao.search_member(user_id);

		return list;
	}
	//会員情報検索
	public static List<User_informationBean> member_search_for_passwordsend(String login_id) throws Exception {
		//String message = "登録処理が完了しました。";
		User_informationDAO dao = new User_informationDAO();
		List<User_informationBean> list = new ArrayList<>();
		list = dao.search_member_for_passwordsend(login_id);

		return list;
	}
	
	//会員情報更新
	public static boolean member_update(User_informationBean p) throws Exception {
		boolean successed = false;
		//String message = "登録処理が完了しました。";
		int line_1 = 0;
		int line_2 = 0;
		User_informationDAO dao = new User_informationDAO();
		try {
		line_1 = dao.update_k_users(p);
		line_2 = dao.update_authorization(p);
		System.out.println(line_1);
		System.out.println(line_2);
		}catch(Exception e) {}
		if ((line_1 == 1)&&(line_2 ==1)) {
			successed = true;
		} else {
			//message="登録に失敗しました。";
			successed = false;
		}
		return successed;
	}
}
