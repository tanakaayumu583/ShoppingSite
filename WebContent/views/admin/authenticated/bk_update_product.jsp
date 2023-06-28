<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>Home</title>
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
	<h2>商品編集</h2>
	<div></div>
	<%
	for (jp.co.aforce.bean.ProductBean p : list) {
	%>
	<form action="/ShoppingSite/jp.co.aforce.servlet/Update_product"
		method="post">
		<p>商品id：<%=p.getProduct_id()%></p>
		<input hidden name="product_id" value="<%=p.getProduct_id()%>">
		<p>
			<input type="text" name="name" placeholder="商品名" 
			value="<%=p.getName()%>"
			>
		</p>
		<p>
			<input type="text" name="description" placeholder="説明"
			value="<%=p.getDescription()%>"
			>
		</p>
		<div class="button">
			<input id="login" type="submit" value="確定">
		</div>
	</form>
	<%}%>
</div>
</container>
<%@include file="../../footer.html"%>