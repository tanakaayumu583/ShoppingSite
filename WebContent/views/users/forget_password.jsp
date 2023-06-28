<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Optional"%>
<%@include file="../authentication.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.12.1.min.js"></script>
<title>Home</title>
<%@include file="../../../css/users/users_login.css"%>
<%@include file="../../../css/users/users_background.css"%>
<link rel="icon"
	href="/ShoppingSite/img/icon/to_top_kinniku_nohaikei.png">
</head>
<style>
.title_area {
margin-top:70px;

}
</style>
<body class="index">
	<container>
	<div class="letter">
		<div class="title_area">
			<p>ご登録のログインid(メールアドレス)を入力してください。</p>
			<div class="form_area">
				<form action="/ShoppingSite/jp.co.aforce.servlet/Forget_password"
					method="post">
					<div class="input_area">
						<label id="id_label" style="display: none;">メールアドレス</label>
						<div class="id_area border_area">
							<input id="id_input" class="input" type="text" name="login_id"
								placeholder="メールアドレス">
						</div>
					</div>
					<div class="submit_area">
						<div class="button">
							<button id="login" type="submit">送信</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</container>
</body>
<%@include file="../footer.html"%>