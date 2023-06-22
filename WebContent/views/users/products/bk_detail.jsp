<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>商品詳細</title>
<%@include file="../../header.html"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
List<jp.co.aforce.bean.ProductBean> list = (List<jp.co.aforce.bean.ProductBean>) session
		.getAttribute("search_product");
%>
<container>
<div>
	<h2>商品詳細</h2>
	<%
	for (jp.co.aforce.bean.ProductBean p : list) {
	%>
	<div class="product_area" style="clear: both;">
		<h3>
			<a
				href="/ShoppingSite/jp.co.aforce.servlet/User_product_detail?product_id=<%=p.getProduct_id()%>">商品名：<%=p.getName()%></a>
		</h3>
		<ul>
			<li>
				<p>
					プロダクトid：<%=p.getProduct_id()%></p>
			</li>
			<li><p>
					価格：<%=p.getPrice()%>円
				</p></li>
			<li><p>
					商品説明：<%=p.getDescription()%></p></li>
			<li><p>
					画像パス：<%=p.getP_img()%></p></li>
		</ul>
	</div>
	<div class="submit_area">

		<form action="/ShoppingSite/jp.co.aforce.servlet/Set_cart"
			method="post">
			<input hidden name="product_id" value="<%=p.getProduct_id()%>">
			<input hidden name="name" value="<%=p.getName()%>">
			<input hidden name="price" value="<%=p.getPrice()%>">

			<p>数量</p>
			<p><input type="text" name="quantity"></p>
			<p>
				<input id="cart_button" type="submit" value="カートに入れる">
			</p>
			<p>
				<a href="#">戻る</a>
			</p>
		</form>
	</div>
	<%}%>
</div>
</container>
<%@include file="../../footer.html"%>