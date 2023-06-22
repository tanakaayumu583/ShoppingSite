<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TopPage</title>
<link href="/ShoppingSite/css/home.css" rel="stylesheet">
</head>
<!-- ▼ここからbody -->
<body>
	<div class="background_img">
		<div class="container">
			<div class="main_colum">
				<!-- ▼ロゴ -->
				<div class="head_area">
				<div class="logo">サイト名</div>
				<div class="nav">
				<ul>
				<li><a href="/ShoppingSite/views/users/login.jsp">ログイン</a></li>
				<li><a href="/ShoppingSite/views/users/register.jsp">会員登録</a></li>
				<li><a href="/ShoppingSite/views/users/update.jsp">アカウント編集</a></li>
				<li><a href="/ShoppingSite/views/users/register.jsp">退会</a></li>
				<li><a href="/ShoppingSite/jp.co.aforce.servlet/Logout?status=users">ログアウト</a></li>
				<li><a href="#">お知らせ</a></li>
				<li><a href="#">FAQ</a></li>
				<li><a href="#">ほしいものリスト</a></li>
				<li><a href="/ShoppingSite/views/users/shopping/cart.jsp">カート</a></li>
				<li><a href="/ShoppingSite/views/users/shopping/cart.jsp">注文履歴</a></li>
				</ul>
				</div>
				</div>
				<!-- ▲ロゴ -->
				<!-- ▼各種情報 -->
				<div class="information"></div>
				<!-- ▲各種情報 -->
				<!-- ▼商品一覧 -->
				<div class="products">
					<div class="product-container" id="productContainer"></div>
				</div>
				<div style="margin-top:200px;">
				<a href="/ShoppingSite/jp.co.aforce.servlet/User_product_list">商品一覧</a></div>
				<!-- ▲商品一覧 -->
			</div>
			<div class="button_colum"></div>
		</div>
	</div>
</body>
<!-- ▲ここまでbody -->
<script src="/ShoppingSite/js/home.js"></script>
</html>
