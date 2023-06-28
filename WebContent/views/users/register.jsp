<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.html"%>
<title>会員情報登録</title>
<%@include file="../../../css/users/users_register.css"%>
<%@include file="../../../css/users/users_background.css"%>
<script src="//code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/jquery.zip2addr.js"></script>
<link rel="icon"
	href="/ShoppingSite/img/icon/to_top_kinniku_nohaikei.png">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- メッセージ -->
<c:if test="${errormsg != null }">
	<strong style="color: green;">${errormsg}</strong>
</c:if>
<c:remove var="errormsg" />
<body class="index">
	<container>
	<div class="letter">
		<div>
			<h2>会員情報登録</h2>
			<form action="/ShoppingSite/jp.co.aforce.servlet/User_settings"
				method="post">
				<!-- ▼試し -->
				<table class="">
					<colgroup>
						<col width=:30%;>
						<col width=:70%;>
					</colgroup>
					<tbody>
						<tr>
							<th>メールアドレス(ログインid)<spqn class="attention">※</spqn></th>
							<td><input type="email" id="inpMail" name="login_id"
								style="width: 200px;" maxlength="50" required> <br>
								<p hidden id="warning" style="color: red; font-size: 10px;">
									このメールアドレスは既に存在しています。<br>
								</p> <input type="email" id="inpMail" name="login_id"
								style="width: 200px;" maxlength="50" required> <br>
								<span>確認のため再入力をお願いします。</span></td>
						</tr>
						<tr>
							<th>パスワード<spqn class="attention">※</spqn></th>
							<td><input type="tel" name="login_password"
								style="width: 200px;" maxlength="15" required></td>
						</tr>
						<tr>
							<th>氏名<spqn class="attention">※</spqn></th>
							<td>
								<p class="f_l">姓</p> <input class="f_l" type="text"
								name="last_name" required style="width: 80px;">
								<p class="f_l">名</p> <input class="f_l" type="text"
								name="first_name" required style="width: 80px;">
								<p class="clear"></p>
							</td>
						</tr>
						<tr>
							<th>性別<spqn class="attention">※</spqn></th>
							<td>
								<p class="float_l ml_15 f_l">
									<input type="radio" name="sex" value="1" id="man" checked>
									<label for="man">男</label>
								</p>
								<p class="float_l ml_15 f_l">
									<input type="radio" name="sex" value="2" id="wo"> <label
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
										<option value="<%=i%>"><%=i%></option>
										<%}%>
									</select>年
								</p>
								<p class="float_l f_l">
									<select name="birth_month" required>
										<option value=""></option>
										<%for (int i = 1; i <= 12; i++) {%>
										<option value="<%=i%>"><%=i%></option>
										<%}%>
									</select>月
								</p>
								<p class="float_l f_l ">
									<select name="birth_day" required>
										<option value=""></option>
										<%for (int i = 1; i <= 31; i++) {%>
										<option value="<%=i%>"><%=i%></option>
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
									<p class="f_l">■郵便番号</p>

									<div class="auto_zip_area f_l">
										<p id="auto_zip" style="margin-left: 5px;">住所検索</p>
									</div>
									<div class="clear"></div>
									<p class="ml_15">
										〒<input id="zip_code_1" type="tel" style="width: 80px;"
											required>-<input id="zip_code_2" type="text"
											style="width: 100px;" required> <input hidden
											type="tel" name="zip_code" class="zip_code" id="zip_code"
											style="width: 200px;" maxlength="15" value="初期値">
									</p>
								</div>
								<div class="colum clearfix">
									<p>■都道府県</p>
									<select name="prefectures" style="">
										<option value="0" selected="selected">都道府県を選択</option>
										<option label="北海道" value="1">北海道</option>
										<option label="青森県" value="2">青森県</option>
										<option label="岩手県" value="3">岩手県</option>
										<option label="宮城県" value="4">宮城県</option>
										<option label="秋田県" value="5">秋田県</option>
										<option label="山形県" value="6">山形県</option>
										<option label="福島県" value="7">福島県</option>
										<option label="茨城県" value="8">茨城県</option>
										<option label="栃木県" value="9">栃木県</option>
										<option label="群馬県" value="10">群馬県</option>
										<option label="埼玉県" value="11">埼玉県</option>
										<option label="千葉県" value="12">千葉県</option>
										<option label="東京都" value="13">東京都</option>
										<option label="神奈川県" value="14">神奈川県</option>
										<option label="新潟県" value="15">新潟県</option>
										<option label="富山県" value="16">富山県</option>
										<option label="石川県" value="17">石川県</option>
										<option label="福井県" value="18">福井県</option>
										<option label="山梨県" value="19">山梨県</option>
										<option label="長野県" value="20">長野県</option>
										<option label="岐阜県" value="21">岐阜県</option>
										<option label="静岡県" value="22">静岡県</option>
										<option label="愛知県" value="23">愛知県</option>
										<option label="三重県" value="24">三重県</option>
										<option label="滋賀県" value="25">滋賀県</option>
										<option label="京都府" value="26">京都府</option>
										<option label="大阪府" value="27">大阪府</option>
										<option label="兵庫県" value="28">兵庫県</option>
										<option label="奈良県" value="29">奈良県</option>
										<option label="和歌山県" value="30">和歌山県</option>
										<option label="鳥取県" value="31">鳥取県</option>
										<option label="島根県" value="32">島根県</option>
										<option label="岡山県" value="33">岡山県</option>
										<option label="広島県" value="34">広島県</option>
										<option label="山口県" value="35">山口県</option>
										<option label="徳島県" value="36">徳島県</option>
										<option label="香川県" value="37">香川県</option>
										<option label="愛媛県" value="38">愛媛県</option>
										<option label="高知県" value="39">高知県</option>
										<option label="福岡県" value="40">福岡県</option>
										<option label="佐賀県" value="41">佐賀県</option>
										<option label="長崎県" value="42">長崎県</option>
										<option label="熊本県" value="43">熊本県</option>
										<option label="大分県" value="44">大分県</option>
										<option label="宮崎県" value="45">宮崎県</option>
										<option label="鹿児島県" value="46">鹿児島県</option>
										<option label="沖縄県" value="47">沖縄県</option>

									</select></span>
								</div>
								<div class="colum clearfix">
									<p>■住所(市町村以降)</p>
									<p class="ml_15">
										<input type="tel" name="city_address" id="city_address"
											style="width: 200px;" maxlength="15" required>
									</p>
								</div>

							</td>
						</tr>
						<tr>
							<th>電話番号<spqn class="attention">※</spqn></th>
							<td><input type="tel" name="phone_number"
								style="width: 200px;" maxlength="15" required></td>
						</tr>
						<tr>
							<th>職業<spqn class="attention">※</spqn></th>
							<td>
								<p>■職業</p>
								<p class="ml_15">
									<select name="job" style="width: 200px;" required>
										<option value="100">会社員</option>
										<option value="200">自営業</option>
										<option value="300">学生</option>
										<option value="400">その他</option>
									</select>
								</p>
							</td>
						</tr>

						<tr>
							<th>メールアドレス(配信用)<spqn class="attention">※</spqn></th>
							<td>
								<p>ログインidと同じ</p> <input id="same_login_id" type="checkbox">
								<input type="email" name="delivery_mail_address"
								id="delivery_mail_address" style="width: 200px;" maxlength="50"
								required>
							</td>
						</tr>
						<tr>
							<th>お得な情報を配信しますか<spqn class="attention">※</spqn></th>
							<td>
								<p class="float_l ml_15">
									<input type="radio" name="email_delivery"
										id="email_delivery_yes" value="1" checked> <label
										for="email_delivery_yes">する</label>
								</p>
								<p class="float_l ml_15">
									<input type="radio" name="email_delivery"
										id="email_delivery_no" value="2"> <label
										for="email_delivery_no">しない</label>
								</p>
								<p class="clear"></p>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="button_area">
					<input type="hidden" id="post_type" name="post_type" value="regist" />
					<p class="f_r" style="margin-top: -45px; margin-right: 8px;">
						<input type="reset" name="reset" value="リセット">
					</p>
					<p class="f_l" style="margin-top: -45px; margin-left: -15px;">
						<input type="button" name="back"
							onclick="location.href='/ShoppingSite/views/users/home.jsp'"
							value="戻る">

					</p>
					<div class="submit_area">
						<div class="button">
							<p class="submit_button">
								<input type="submit" id="regist" name="regist" value="登録">
							</p>
						</div>
					</div>
				</div>
				<!-- ▲試し -->
			</form>
		</div>
	</container>
</body>
<script>
	$(document).on("keyup", "#zip_code_1", function(e) {
		//郵便番号取得を取得
		var zip_input1 = $(this).val();
		var zip_input2 = $("#zip_code_2").val();
		//結合して格納
		$(".zip_code").val("" + zip_input1 + zip_input2);
		console.log($(".zip_code").val());
	});
	$(document).on("keyup", "#zip_code_2", function(e) {
		//郵便番号取得を取得
		var zip_input1 = $("#zip_code_1").val();
		var zip_input2 = $(this).val();
		//結合して格納
		$(".zip_code").val(("" + zip_input1 + zip_input2));
	});
	jQuery('#same_login_id').change(function() {
		if (jQuery(this).prop('checked')) {
			$("#delivery_mail_address").val($("#inpMail").val());
		}
	});
	$(document).on("keyup", "#inpMail", function(e) {
		if ($("#same_login_id").is(':checked')) {
			//郵便番号取得を取得
			var inpMail = $(this).val();
			//結合して格納
			$("#delivery_mail_address").val(inpMail);
		}
	});
	$('#auto_zip').on('click', function() {
		AjaxZip3.zip2addr('zip_code', '', 'prefectures', 'city_address');
	});
</script>
<script src="/ShoppingSite/js/ajax.js"></script>
<%@include file="../footer.html"%>