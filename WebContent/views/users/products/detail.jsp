<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="jp.co.aforce.dao.ProductDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="../../../css/users/users_product_detail.css"%>
<%@include file="../../../css/users/users_background.css"%>
</head>
<!-- ▼商品詳細取得　-->
<%
List<jp.co.aforce.bean.ProductBean> list = (List<jp.co.aforce.bean.ProductBean>) session
		.getAttribute("search_product");
%>
<!-- ▲商品詳細取得  -->
<!-- ▼ログインステータス取得  -->
<%
boolean is_login;
Object loginCheck = session.getAttribute("s_user_id");
if (loginCheck == null) {
	is_login = false;
} else {
	is_login = true;
}
%>
<!-- ▲ログインステータス取得  -->
<!-- ▼BODY部 スタート -->
<body class="index">
	<div class="frame_outer">
		<a name="top" id="top"></a>
		<!--▼HEADER-->
		<div id="header_wrap">
			<div id="header" class="clearfix">
				<div id="logo_area">
					<h1>
						<a href="#"><span>ホームタイトル</span></a>
					</h1>
				</div>
				<div id="header_utility">
					<div id="headerInternalColumn"></div>
				</div>
			</div>
		</div>
		<!--▲HEADER-->
		<div id="container" class="clearfix">
			<div id="one_maincolumn" class="main_column">
				<!-- ▼商品詳細 -->
				<%
				for (jp.co.aforce.bean.ProductBean p : list) {
				%>
				<div class="undercolumn letter">
					<form class="product_detail_area" action="/ShoppingSite/jp.co.aforce.servlet/Set_cart"
			method="post">
						<div class="detail_photo">
							<div class="photo">
								<img src="/ShoppingSite/img/product_img/<%=p.getProduct_id()%>/<%=p.getP_img()%>" class="picture"
								style="width:260px; height:260px;">
							</div>
						</div>
						<div class="detail_text">
							<div class="product_id">
								商品コード：<%=p.getProduct_id()%></div>
							<h2>
								商品名<%=p.getName()%></h2>
							<dl>
								<dt>販売価格(税込み)</dt>
								<dd><%=p.getPrice()%>円
								</dd>
							</dl>
							<div class="main_comment"><%=p.getDescription()%></div>
							<div class="cart clearfix">
								<input hidden name="product_id" value="<%=p.getProduct_id()%>">
								<input hidden name="name" value="<%=p.getName()%>"> <input
									hidden name="price" value="<%=p.getPrice()%>">
								<p>
									数量<input type="text" name="quantity">
								</p>
								<p>
									<input style="float:right;" id="cart_button" type="submit" value="カートに入れる">
								</p>
							</div>
						</div>
					</form>
					<div class="clearfix"></div>
					<div class="back_button_area ">
						<a href="javascript:history.back();">戻る</a>
					</div>
				</div>
				<%}%>
				<!-- ▲商品詳細 -->
			</div>
		</div>
		<!--▼FOOTER-->
		<div class="clearfix"></div>
		<div id="footer_wrap">
			<div id="footer">
				<div id="footer_menu">
					<a href="#"><div class="abouts"></div></a> <a href="#" class=""><div
							class="order"></div></a> <a href="#" class=""><div
							class="privacy"></div></a> <a href="#" class=""><div
							class="contact"></div></a>
				</div>
				<div id="copyright">Copyright © 2012-2023 Bread Factory
					Nekonote All rights reserved.</div>
			</div>
		</div>
		<!--▲FOOTER-->
	</div>
	<div id="mTip-1" class="black mTip mTip-left"
		style="opacity: 0; display: none; position: absolute; z-index: 10000; left: 614px; top: 158px;">トップページへ</div>
</body>
<!-- ▲BODY部 エンド -->
</html>