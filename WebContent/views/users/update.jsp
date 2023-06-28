<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<link rel="icon" href="/ShoppingSite/img/icon/to_top_kinniku_nohaikei.png">
<title>会員情報登録</title>
<%@include file="../../../css/users/users_register.css"%>
<%@include file="../../../css/users/users_background.css"%>
<script src="//code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
</head>

<%
//▼ユーザ情報取得
List<jp.co.aforce.bean.User_informationBean> list = (List<jp.co.aforce.bean.User_informationBean>) session
		.getAttribute("search_member");
//▲ユーザ情報取得
%>
<!-- メッセージ -->
<c:if test="${errormsg != null }">
	<strong style="color: green;">${errormsg}</strong>
</c:if>
<c:remove var="errormsg" />
<style>
.letter{
height:700px;
}

</style>
<body class="index">
	<container>
	<div class="letter">
		<div>
			<h2>会員情報更新</h2>
			<form action="/ShoppingSite/jp.co.aforce.servlet/User_settings"
				method="post">
				<table class="">
					<colgroup>
						<col width=:30%;>
						<col width=:70%;>
					</colgroup>
					<tbody>
						<%
						for (jp.co.aforce.bean.User_informationBean p : list) {
						%>
						<tr>
							<th>メールアドレス(ログインid)<spqn class="attention">※</spqn></th>
							<td><input type="email" id="inpMail" name="login__id"
								style="width: 200px;" maxlength="50"
								value="<%=p.getLogin_id()%>" disabled><br>
						</tr>
						<input type="hidden" name="login_id" value="<%=p.getLogin_id()%>">
						<input type="hidden" name="user_id" value="<%=p.getUser_id()%>">
						<tr>
							<th>パスワード<spqn class="attention">※</spqn></th>
							<td><input type="tel" name="login_password"
								style="width: 200px;" value="<%=p.getLogin_password()%>"
								maxlength="15" required></td>
						</tr>
						<tr>
							<th>氏名<spqn class="attention">※</spqn></th>
							<td>
								<p class="f_l">姓</p> <input class="f_l" type="text"
								name="last_name" value="<%=p.getLast_name()%>" required
								style="width: 80px;">
								<p class="f_l">名</p> <input class="f_l" type="text"
								name="first_name" value="<%=p.getFirst_name()%>" required
								style="width: 80px;">
								<p class="clear"></p>
							</td>
						</tr>
						<tr>
							<th>性別<spqn class="attention">※</spqn></th>
							<td>
								<p class="float_l ml_15 f_l">
									<input type="radio" name="sex" value="1" id="man"
										<%if (p.getSex() == 1) {%> checked <%}%>> <label
										for="man">男</label>
								</p>
								<p class="float_l ml_15 f_l">
									<input type="radio" name="sex" value="2" id="wo"
										<%if (p.getSex() == 2) {%> checked <%}%>> <label
										for="wo">女</label>
								</p>
								<p class="clear"></p>
							</td>
						</tr>
						<tr>
							<th>生年月日<spqn class="attention">※</spqn></th>
							<td>
								<p class="float_l ml_15 f_l">
									<select name="birth_year" required>
										<option value=""></option>
										<%for (int i = 1920; i <= 2020; i++) {%>
										<option value="<%=i%>" <%if (i == p.getBirth_year()) {%>
											selected <%}%>><%=i%></option>
										<%}%>
									</select>年
								</p>
								<p class="float_l f_l">
									<select name="birth_month" required>
										<option value=""></option>
										<%for (int i = 1; i <= 12; i++) {%>
										<option value="<%=i%>" <%if (i == p.getBirth_month()) {%>
											selected <%}%>><%=i%></option>
										<%}%>
									</select>月
								</p>
								<p class="float_l f_l ">
									<select name="birth_day" required>
										<option value=""></option>
										<%for (int i = 1; i <= 31; i++) {%>
										<option value="<%=i%>" <%if (i == p.getBirth_day()) {%>
											selected <%}%>><%=i%></option>
										<%}%>
									</select>日
								</p>
								<p class="clear"></p>
							</td>
						</tr>
						<tr>
							<th>住所<spqn class="attention">※</spqn></th>
							<td>

								<div class="colum clearfix">
									<p>■郵便番号</p>
									<p class="ml_15">
										〒<input id="zip_code_1" type="tel" style="width: 80px;"
											required value="<%=Integer.toString(p.getZip_code()).substring(0, Math.min(Integer.toString(p.getZip_code()).length(), 3))
											%>">-<input
											id="zip_code_2" type="text" style="width: 100px;" required
											value="<%=Integer.toString(p.getZip_code()).substring(Math.max(Integer.toString(p.getZip_code()).length() - 4, 0))%>"> <input hidden
											type="tel" name="zip_code" class="zip_code" id="zip_code"
											style="width: 200px;" maxlength="15"
											value="<%=p.getZip_code()%>">
									</p>
								</div>
								<div class="colum clearfix">
									<p>■都道府県</p>
									<select name="prefectures" style="" value="">
										<option value="" selected="selected">都道府県を選択</option>
										<option label="北海道" value="1" <%if(p.getPrefectures() == 1){%>selected<%} %>>北海道</option>
										<option label="青森県" value="2" <%if(p.getPrefectures() == 2){%>selected<%} %>>青森県</option>
										<option label="岩手県" value="3" <%if(p.getPrefectures() == 3){%>selected<%} %>>岩手県</option>
										<option label="宮城県" value="4" <%if(p.getPrefectures() == 4){%>selected<%} %>>宮城県</option>
										<option label="秋田県" value="5" <%if(p.getPrefectures() == 5){%>selected<%} %>>秋田県</option>
										<option label="山形県" value="6" <%if(p.getPrefectures() == 6){%>selected<%} %>>山形県</option>
										<option label="福島県" value="7" <%if(p.getPrefectures() == 7){%>selected<%} %>>福島県</option>
										<option label="茨城県" value="8" <%if(p.getPrefectures() == 8){%>selected<%} %>>茨城県</option>
										<option label="栃木県" value="9" <%if(p.getPrefectures() == 9){%>selected<%} %>>栃木県</option>
										<option label="群馬県" value="10" <%if(p.getPrefectures() == 10){%>selected<%} %>>群馬県</option>
										<option label="埼玉県" value="11" <%if(p.getPrefectures() == 11){%>selected<%} %>>埼玉県</option>
										<option label="千葉県" value="12" <%if(p.getPrefectures() == 12){%>selected<%} %>>千葉県</option>
										<option label="東京都" value="13" <%if(p.getPrefectures() == 13){%>selected<%} %>>東京都</option>
										<option label="神奈川県" value="14"<%if(p.getPrefectures() == 14){%>selected<%} %>>神奈川県</option>
										<option label="新潟県" value="15"<%if(p.getPrefectures() == 15){%>selected<%} %>>新潟県</option>
										<option label="富山県" value="16"<%if(p.getPrefectures() == 16){%>selected<%} %>>富山県</option>
										<option label="石川県" value="17"<%if(p.getPrefectures() == 17){%>selected<%} %>>石川県</option>
										<option label="福井県" value="18"<%if(p.getPrefectures() == 18){%>selected<%} %>>福井県</option>
										<option label="山梨県" value="19"<%if(p.getPrefectures() == 19){%>selected<%} %>>山梨県</option>
										<option label="長野県" value="20"<%if(p.getPrefectures() == 20){%>selected<%} %>>長野県</option>
										<option label="岐阜県" value="21"<%if(p.getPrefectures() == 21){%>selected<%} %>>岐阜県</option>
										<option label="静岡県" value="22"<%if(p.getPrefectures() == 22){%>selected<%} %>>静岡県</option>
										<option label="愛知県" value="23"<%if(p.getPrefectures() == 23){%>selected<%} %>>愛知県</option>
										<option label="三重県" value="24"<%if(p.getPrefectures() == 24){%>selected<%} %>>三重県</option>
										<option label="滋賀県" value="25"<%if(p.getPrefectures() == 25){%>selected<%} %>>滋賀県</option>
										<option label="京都府" value="26"<%if(p.getPrefectures() == 26){%>selected<%} %>>京都府</option>
										<option label="大阪府" value="27"<%if(p.getPrefectures() == 27){%>selected<%} %>>大阪府</option>
										<option label="兵庫県" value="28"<%if(p.getPrefectures() == 28){%>selected<%} %>>兵庫県</option>
										<option label="奈良県" value="29"<%if(p.getPrefectures() == 29){%>selected<%} %>>奈良県</option>
										<option label="和歌山県" value="30"<%if(p.getPrefectures() == 30){%>selected<%} %>>和歌山県</option>
										<option label="鳥取県" value="31"<%if(p.getPrefectures() == 31){%>selected<%} %>>鳥取県</option>
										<option label="島根県" value="32"<%if(p.getPrefectures() == 32){%>selected<%} %>>島根県</option>
										<option label="岡山県" value="33"<%if(p.getPrefectures() == 33){%>selected<%} %>>岡山県</option>
										<option label="広島県" value="34"<%if(p.getPrefectures() == 34){%>selected<%} %>>広島県</option>
										<option label="山口県" value="35"<%if(p.getPrefectures() == 35){%>selected<%} %>>山口県</option>
										<option label="徳島県" value="36"<%if(p.getPrefectures() == 36){%>selected<%} %>>徳島県</option>
										<option label="香川県" value="37"<%if(p.getPrefectures() == 37){%>selected<%} %>>香川県</option>
										<option label="愛媛県" value="38"<%if(p.getPrefectures() == 38){%>selected<%} %>>愛媛県</option>
										<option label="高知県" value="39"<%if(p.getPrefectures() == 39){%>selected<%} %>>高知県</option>
										<option label="福岡県" value="40"<%if(p.getPrefectures() == 40){%>selected<%} %>>福岡県</option>
										<option label="佐賀県" value="41"<%if(p.getPrefectures() == 41){%>selected<%} %>>佐賀県</option>
										<option label="長崎県" value="42"<%if(p.getPrefectures() == 42){%>selected<%} %>>長崎県</option>
										<option label="熊本県" value="43"<%if(p.getPrefectures() == 43){%>selected<%} %>>熊本県</option>
										<option label="大分県" value="44"<%if(p.getPrefectures() == 44){%>selected<%} %>>大分県</option>
										<option label="宮崎県" value="45"<%if(p.getPrefectures() == 45){%>selected<%} %>>宮崎県</option>
										<option label="鹿児島県" value="46"<%if(p.getPrefectures() == 46){%>selected<%} %>>鹿児島県</option>
										<option label="沖縄県" value="47"<%if(p.getPrefectures() == 47){%>selected<%} %>>沖縄県</option>
									</select></span>
								</div>
								<div class="colum clearfix">
									<p>■住所(市町村以降)</p>
									<p class="ml_15">
										<input type="tel" name="city_address" id="city_address"
											style="width: 200px;" maxlength="15"
											value="<%=p.getCity_address()%>" required>
									</p>
								</div>

							</td>
						</tr>
						<tr>
							<th>電話番号<spqn class="attention">※</spqn></th>
							<td><input type="tel" name="phone_number"
								style="width: 200px;" maxlength="15"
								value="<%=p.getPhone_number()%>" required></td>
						</tr>
						<tr>
							<th>職業<spqn class="attention">※</spqn></th>
							<td>
								<p>■職業</p>
								<p class="ml_15">
									<select name="job" style="width: 200px;" required>
										<option value="100" <%if (100 == p.getJob()) {%> selected
											<%}%>>会社員</option>
										<option value="200" <%if (200 == p.getJob()) {%> selected
											<%}%>>自営業</option>
										<option value="300" <%if (300 == p.getJob()) {%> selected
											<%}%>>学生</option>
										<option value="400" <%if (400 == p.getJob()) {%> selected
											<%}%>>その他</option>
									</select>
								</p>
							</td>
						</tr>
						<tr>
							<th>メールアドレス(配信用)<spqn class="attention">※</spqn></th>
							<td><input type="email" name="delivery_mail_address"
								id="delivery_mail_address" style="width: 200px;"
								value="<%=p.getDelivery_mail_address()%>" maxlength="50"
								required></td>
						</tr>
						<tr>
							<th>お得な情報を配信しますか<spqn class="attention">※</spqn></th>
							<td>
								<p class="float_l ml_15">
									<input type="radio" name="email_delivery"
										id="email_delivery_yes" value="1"
										<%if (p.getEmail_delivery() == 1) {%> checked <%}%>> <label
										for="email_delivery_yes">する</label>
								</p>
								<p class="float_l ml_15">
									<input type="radio" name="email_delivery"
										id="email_delivery_no" value="2"
										<%if (p.getEmail_delivery() == 2) {%> checked <%}%>> <label
										for="email_delivery_no">しない</label>
								</p>
								<p class="clear"></p>
							</td>
						</tr>
						<%
}
%>
					</tbody>
				</table>
				<!-- <div class="button_area">
					<input type="hidden" id="post_type" name="post_type" value="update" />
					<p class="float_l">
						<input type="submit" name="update" value="更新">
					</p>
					<p class="float_l">
						<input type="reset" name="reset" value="リセット">
					</p>
					<p class="float_l">
						<input type="button" name="back"
							onclick="location.href='/MemberInformation/views/settings.jsp'"
							value="戻る">
					</p>
				</div> -->
									<div class="button_area">
						<input type="hidden" id="post_type" name="post_type"
							value="update" />
						<p class="f_r" style="margin-top: -45px; margin-right: 8px;">
													<a onclick="window.location.reload(false);" style="cursor:pointer"><span>操作前に戻す</span>
</a>
						</p>
						<p class="f_l" style="margin-top: -45px; margin-left: -15px;">
							<input type="button" name="back"
								onclick="location.href='/ShoppingSite/views/users/home.jsp'"
								value="戻る">
						</p>
				    <div class="submit_area">
					   <div class="button">
						<p class="submit_button">
							<input type="submit" id="update" name="update" value="更新"    onclick="return confirm('画面遷移しますか？'); ">
						</p>
						</div>
					</div>
				</div>
			</form>
		</div>
	</container>
</body>
<%@include file="../footer.html"%>