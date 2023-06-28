<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.html"%>
<title>会員情報登録</title>
<link href="/ShoppingSite/css/member_regist.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- メッセージ -->
<c:if test="${errormsg != null }">
	<strong style="color: green;">${errormsg}</strong>
</c:if>
<c:remove var="errormsg" />
<container>
<div>
	<h2>会員情報</h2>
	<form action="/ShoppingSite/jp.co.aforce.servlet/User_settings"
		method="post">
		<div class="input_area">
			<div class="colum">
				<p>■メールアドレス(ログインid)</p>
				<p class="ml_15">
					<input type="email" id="inpMail" name="login_id" style="width: 200px;"
						maxlength="50" required>
				</p>
				<p hidden id="warning" style="color:red;">このメールアドレスは既に存在しています。</p>
			</div>
			<div class="colum clearfix">
				<p>■パスワード</p>
				<p class="ml_15">
					<input type="tel" name="login_password" style="width: 200px;"
						maxlength="15" required >
				</p>
			</div>

			<div class="colum clearfix">
				<p>■名前</p>
				<p class="float_l ml_15">
					姓<input type="text" name="last_name" required>
				</p>
				<p class="float_l ml_15">
					名<input type="text" name="first_name" required>
				</p>
			</div>
			<div class="colum clearfix">
				<p>■性別</p>
				<p class="float_l ml_15">
					<input type="radio" name="sex" value="1" checked>男
				</p>
				<p class="float_l ml_15">
					<input type="radio" name="sex" value="2">女
				</p>
			</div>

			<div class="colum clearfix">
				<p>■生年月日</p>
				<p class="float_l ml_15">
					<select name="birth_year" required>
						<option value=""></option>
						<%for (int i = 1920; i <= 2020; i++) {%>
						<option value="<%=i%>"><%=i%></option>
						<%}%>
					</select>年
				</p>
				<p class="float_l">
					<select name="birth_month" required>
						<option value=""></option>
						<%for (int i = 1; i <= 12; i++) {%>
						<option value="<%=i%>"><%=i%></option>
						<%}%>
					</select>月
				</p>
				<p class="float_l">
					<select name="birth_day" required>
						<option value=""></option>
						<%for (int i = 1; i <= 31; i++) {%>
						<option value="<%=i%>"><%=i%></option>
						<%}%>
					</select>日
				</p>
			</div>
			<div class="colum clearfix">
				<p>■郵便番号</p>
				<p class="ml_15">
					<input type="tel" name="zip_code" style="width: 200px;"
						maxlength="15" required >
				</p>
			</div>
			<div class="colum clearfix">
				<p>■都道府県</p>
				<p class="ml_15">
					<input type="tel" name="prefectures" style="width: 200px;"
						maxlength="15" required >
				</p>
			</div>
			<div class="colum clearfix">
				<p>■住所(市町村以降)</p>
				<p class="ml_15">
					<input type="tel" name="city_address" style="width: 200px;"
						maxlength="15" required >
				</p>
			</div>
			<div class="colum clearfix">
				<p>■電話番号</p>
				<p class="ml_15">
					<input type="tel" name="phone_number" style="width: 200px;"
						maxlength="15" required >
				</p>
			</div>
			<div class="colum">
				<p>■メールアドレス(配信用)</p>
				<p class="ml_15">
					<input type="email" name="delivery_mail_address" style="width: 200px;"
						maxlength="50" required>
				</p>
			</div>
			<div class="colum clearfix">
				<p>■職業</p>
				<p class="ml_15">
					<select name="job" style="width: 200px;" required>
						<option value="100">会社員</option>
						<option value="200">自営業</option>
						<option value="300">学生</option>
						<option value="400">その他</option>
					</select>
				</p>
			</div>
			<div class="colum clearfix">
				<p>■お得な情報を配信しますか</p>
				<p class="float_l ml_15">
					<input type="radio" name="email_delivery" value="1" checked>する
				</p>
				<p class="float_l ml_15">
					<input type="radio" name="email_delivery" value="2">しない
				</p>
			</div>
		</div>
		<input type="hidden" id="post_type" name="post_type" value="Regist" />
</div>
<div class="button_area clearfix">
	<div class="button_area_center">
		<p class="float_l">
			<input type="submit" name="regist" value="更新">
		</p>
		<p class="float_l">
			<input type="reset" name="reset" value="リセット">
		</p>
		<p class="float_l">
			<input type="button" name="back"
				onclick="location.href='/MemberInformation/views/settings.jsp'"
				value="戻る">
		</p>
	</div>
</div>
</form>
</div>
</container>
<script src="/ShoppingSite/js/ajax.js"></script>
<%@include file="../footer.html"%>