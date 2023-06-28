<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.Optional" %>
	<%@ page import="jp.co.aforce.java.Encryption_function"%>
	<%@ page import="jp.co.aforce.dao.User_informationDAO"%>
<%
//▼認証コード取得
String dec_code = "";
if(request.getParameter("autorization_code") != null){
	dec_code = Encryption_function.decryption(request.getParameter("autorization_code"));
}
//▲認証コード取得
%>
<%
//▼ステータスを認証済に変更
User_informationDAO dao = new User_informationDAO();
dao.user_authentication(dec_code);
//▲ステータスを認証済に変更
%>

<%@include file="../authentication.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.12.1.min.js"></script>
<title>Home</title>
<META http-equiv="Refresh" content="7;URL=/ShoppingSite/views/users/login.jsp">
<%@include file="../../../css/users/users_login.css"%>
<%@include file="../../../css/users/users_background.css"%>
</head>
<body class="index">
	<container>
	<div class="letter">
		<div class="title_area">
			<h2>認証成功</h2>
			<p>5秒後に自動的にログイン画面に移動します。</p>
			<p><a href="/ShoppingSite/views/users/login.jsp">移動しない場合はこちらをクリックしてください</a></p>
		</div>
	</div>
	</container>
</body>
<%@include file="../footer.html"%>