<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
//送信されたデータを取得する
 String login_status = "initial";
 String fail = "fail";
 String regist_success = "regist_success";
try{
	if(!(request.getParameter("status")==null)){
	login_status = request.getParameter("status");
	}
}catch(Exception e){}
%>
<%@include file="../header.html"%>
<container>
<div>
	<h2>会員登録画面</h2>
	<%if(login_status.equals(fail)){ %>
	<p style="color:red;">既に登録されています。</p>
	<%}%>
	<form action="../jp.co.aforce.userlogin/Register" method="post">
		<p>ユーザIDを入力してください</p>
		<p>
			<input type="text" name="user_name" required>
		</p>
		<p>パスワードを入力してください</p>
		<p>
			<input type="text" name="password" required>
		</p>
		<div class="button"><input type="submit"  value="登録"></div>
	</form>
</div>
</container>
<%@include file="../footer.html"%>