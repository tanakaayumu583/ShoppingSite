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
<body class="index">
	<container>
	<div class="letter">
		<div class="title_area">
			<h2>ログイン画面</h2>
			<%
			if (login_status.equals(fail)) {
			%>
			<p style="color: red;">ログインIDまたはパスワードが間違っています。</p>
			<%
} else if (login_status.equals(regist_success)) {
%>
			<p style="color: green;">
				登録が完了しました。<br>登録したパスワードでログインしてください
			</p>
			<%
}
%>
		</div>
		<div class="form_area">
			<form action="/ShoppingSite/jp.co.aforce.servlet/Login" method="post">
				<div class="input_area">
					<label id="id_label" style="display: none;">メールアドレス</label>
					<div class="id_area border_area">
						<p>

							<input id="id_input" class="input" type="text" name="user_name"
								placeholder="メールアドレス"
								<%if (request.getParameter("login_id") != null) {%>
								value="<%=request.getParameter("login_id")%>"
								<%} else if ((session_username != null) && (request.getParameter("login_id") == null)) {%>
								value="<%=session_username%>" <%}%>>
						</p>
					</div>
					<label id="password_label" style="display: none;">パスワード</label>
					<div class="password_area border_area">
						<p>

							<input id="password_input" class="input" type="password"
								name="password" placeholder="パスワード"
								<%if (session_password != null) {%>
								value="<%=session_password%>" <%}%>>
						</p>
					</div>
				</div>
				<div class="submit_area">
					<div class="button">
						<button id="login" class="no_submit" type="submit"
							disabled="disabled" type="submit">ログイン</button>
					</div>
					<!-- <p><a href="register.jsp">会員登録が済んでいない人はこちら</a></p> -->
					<p style="margin-top: 10px;">
						<a href="/ShoppingSite/views/users/forget_password.jsp">パスワードをお忘れの方</a>
					</p>
					<p style="margin-top: 20px;">
						<a href="/ShoppingSite/views/users/register.jsp">会員登録が済んでいない人はこちら</a>
					</p>
				</div>
				<div class="clearfix"></div>
			</form>
		</div>
	</div>
	</container>
</body>


<script>
	$("#id_input").focus(function() {
		$(".id_area").toggleClass("active");
		$("#id_label").show();
	});
	$("#id_input").blur(function() {
		$(".id_area").toggleClass("active");
		console.log($("#id_input").text().length);
		if ($("#id_input").val().length == 0) {
			$("#id_label").hide();
		}
	});
	$("#password_input").focus(function() {
		$(".password_area").toggleClass("active");
		$("#password_label").show();
	});
	$("#password_input").blur(function() {
		$(".password_area").toggleClass("active");
		if ($("#password_input").val().length == 0) {
			$("#password_label").hide();
		}
	});

	//入力チェック
	var mailcheck = /^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/;
	$("#id_input").blur(
			function() {
				if (($(this).val().match(mailcheck))
						|| ($("#id_input").val().length == 0)) {
					$(".id_area").removeClass("error");
					$("#id_label").removeClass("error_label");
				} else if ($("#id_input").val().length != 0) {
					$(".id_area").addClass("error");
					$("#id_label").addClass("error_label");
				}
			});

	//ログインボタン出現用チェック
	//onメソッドを使ったkeyupイベント処理
	$(document).on(
			"keyup",
			"#id_input",
			function(e) {
				//入力されたテキストを取得   
				var id_input = $(this).val();
				//上記変数をspanタグ内に反映
				if ((id_input.match(mailcheck))
						&& ($("#password_input").val().length != 0)) {
					$("#login").removeClass("no_submit");
					$('#login').prop('disabled', false);
				} else {
					$("#login").addClass("no_submit");
					$('#login').prop('disabled', true);
				}
			});
</script>


<%@include file="../footer.html"%>