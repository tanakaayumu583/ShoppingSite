<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="
	jp.co.aforce.bean.CartBean,
	jp.co.aforce.bean.ProductBean,
	java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="../../../css/users/users_cart.css"%>
<%@include file="../../../css/users/users_background.css"%>
<link rel="icon" href="/ShoppingSite/img/icon/to_top_kinniku_nohaikei.png">
</head>
<%@include file="../../to_top.html"%>
<!-- ▼カート情報取得　-->
<%
CartBean cart = (CartBean) session.getAttribute("cart");
%>
<!-- ▲カート情報取得取得  -->
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
<style>


</style>
<!-- ▼BODY部 スタート -->
<body class="index">
	<div class="frame_outer">
		<a name="top" id="top"></a>
		<!--▼HEADER-->
		<div id="header_wrap">
			<div id="header" class="clearfix">
				<div id="logo_area">
					<h1>
						<a href="#"><span>EC Shopping</span></a>
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
				<div class="undercolumn letter">
					<div id="undercolumn_cart">
						<h2 class="title">現在のカゴの中</h2>
						<% if(cart != null){ %>

						<!--★ポイント案内★-->
						<div class="point_announce">

						</div>
						<p class="totalmoney_area"></p>
						<div class="form_area">
							<form name="form1" id="form1" method="post" action="httpcart/?">
								<input type="hidden" name="transactionid" value="01f" /> <input
									type="hidden" name="mode" value="confirm" /> <input
									type="hidden" name="cart_no" value="" /> <input type="hidden"
									name="cartKey" value="1" /> <input type="hidden"
									name="category_id" value="" />


								<table summary="商品情報">
									<colgroup>
										<col width="10%" />
										<col width="155px" />
										<col width="30%" />
										<col width="14%" />
										<col width="10%" />
										<col width="15%" />
									</colgroup>
									<tbody>
										<tr>
											<th class="alignC">削除</th>
											<th class="alignC">商品写真</th>
											<th class="alignC">商品名</th>
											<th class="alignC">単価</th>
											<th class="alignC">数量</th>
											<th class="alignC">小計</th>
										</tr>
										<%
										if(cart != null){
										for (ProductBean p : cart.getList()) {
										%>
										<tr class="frame130">
											<td class="alignC"><a
												href="/ShoppingSite/jp.co.aforce.servlet/Delete_cart_one_product?product_id=<%=p.getProduct_id()%>"
												onclick="return confirm('本当に削除しますか？');">削除</a></td>
											<td class="alignC frame130"><a class="expansion"
												target="_blank" href="#"> <img
													src="/ShoppingSite/img/product_img/<%=p.getProduct_id()%>/<%=p.getP_img()%>"
													alt="<%=p.getName()%>" style="width: 50px; height: 50px;"
													class="img130" />
											</a></td>
											<td><a href="#"><strong><%=p.getName()%></strong></a></td>
											<td class="alignR"><%=p.getPrice()%>円</td>
											<td class="alignC"><p class="f_l"><%=p.getQuantity()%></p>
												<ul id="quantity_level" class="f_r" style="margin-right:35px;">
													<li><a
														href="/ShoppingSite/jp.co.aforce.servlet/Update_cart_quantity?product_id=<%=p.getProduct_id()%>&quantity_level=1"
														onclick=""><img src="/ShoppingSite/img/users/plus.png"
															width="16" height="16" alt="＋" /></a></li>
													<li><a <%if(p.getQuantity() <=1) {%>
														class="a_tag_nopoint" <%} %>
														href="/ShoppingSite/jp.co.aforce.servlet/Update_cart_quantity?product_id=<%=p.getProduct_id()%>&quantity_level=-1"
														onclick=""><img
															src="/ShoppingSite/img/users/minus.png" width="16"
															height="16" alt="-" /></a></li>
												</ul></td>
											<td class="alignR"><%=p.getPrice() * p.getQuantity()%>円</td>
										</tr>
										<%
										}}
										%>
										<tr>
											<th colspan="5" class="alignR">小計</th>
											<td class="alignR">
												<% if(cart != null){%><%=cart.getTotal()%>
												<% }else{%>0<%} %>円
											</td>
										</tr>
										<tr>
											<th colspan="5" class="alignR">合計</th>
											<td class="alignR"><span class="price">
													<% if(cart != null){%><%=cart.getTotal()%>
													<% }else{%>0<%} %>円
											</span></td>
										</tr>
										<tr>
											<th colspan="5" class="alignR">今回加算ポイント</th>
											<td class="alignR">
												<% if(cart != null){%><%=cart.getTotal()/100%>pt
												<% }else{%>0<%} %>
											</td>
										</tr>
									</tbody>
								</table>
								<p class="alignC">上記内容でよろしければ「購入手続きへ」ボタンをクリックしてください。</p>
								<div class="btn_area">
									<ul>
										<li><a
											href="/ShoppingSite/jp.co.aforce.servlet/User_product_list">買い物を続ける</a>
										</li>
										<li><a href="/ShoppingSite/jp.co.aforce.servlet/Purchase" onclick="alert('購入が完了しました。');">購入手続き</a></li>
									</ul>
								</div>
							</form>
						</div>
						<%}else{ %>
						<div>カートの中は空です。</div>
						<%} %>
					</div>
				</div>
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