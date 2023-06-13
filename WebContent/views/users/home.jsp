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
				<li><a href="#">お知らせ</a></li>
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
				<!-- ▲商品一覧 -->
			</div>
			<div class="button_colum"></div>
		</div>
	</div>
</body>
<!-- ▲ここまでbody -->
<script src="/ShoppingSite/js/home.js"></script>
</html>
