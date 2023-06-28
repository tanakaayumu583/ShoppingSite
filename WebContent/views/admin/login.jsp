<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//送信されたデータを取得する
String login_status = "initial";
String fail = "fail";
String regist_success = "regist_success";
try {
	if (!(request.getParameter("status") == null)) {
		login_status = request.getParameter("status");
	}
} catch (Exception e) {
}
%>
<%@include file="../authentication.jsp"%>
<link rel="icon" href="/ShoppingSite/img/icon/favicon_admin.png">
<link href="/ShoppingSite/css/admin_login.css" rel="stylesheet">
<%@include file="../header.html"%>

<container>
<div class="login_box" style="height:300px !important;">
	<div class="inner_box" >

		<%
		if (login_status.equals(fail)) {
		%>
		<p style="color: red;">ホスト接続に失敗しました。</p>
		<%}%>

		<h1>ログイン</h1>
		<form action="/ShoppingSite/jp.co.aforce.servlet/Admin_login"
			method="post">
			<table>
				<tbody>
					<tr>
						<td class="title">
						<label for="login_id">ユーザ名</label>
						</td>
						<td class="input"><input  type="text" name="user_name" id="login_id" placeholder="メールアドレス"
							<%if (request.getParameter("login_id") != null) {%>
							value="<%=request.getParameter("login_id")%>"
							<%} else if ((session_username != null) && (request.getParameter("login_id") == null)) {%>
							value="<%=session_username%>" <%}%>></td>
					</tr>
					<tr>
						<td class="title">
						<label for="login_password">パスワード</label>
						</td>
						<td class="input"><input  type="password" name="password" id="login_password"
							placeholder="パスワード" <%if (session_password != null) {%>
							value="<%=session_password%>" <%}%>></td>
					</tr>
				</tbody>
			</table>
			<p class="formbuttons">
				<input id="login_button" type="submit" value="ログイン">
			</p>
		</form>
	</div>
</div>
</container>
<%@include file="../footer.html"%>

