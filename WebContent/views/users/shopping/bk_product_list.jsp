<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>商品一覧</title>
<%@include file="../../header.html"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
List<jp.co.aforce.bean.ProductBean> list = (List<jp.co.aforce.bean.ProductBean>) session
		.getAttribute("search_product_list");
%>
<container>
<div>
	<h2>商品一覧</h2>
	<%
	for (jp.co.aforce.bean.ProductBean p : list) {
	%>
	<div class="product_area" style="clear: both;">
		<h3>
			<a href="/ShoppingSite/jp.co.aforce.servlet/User_product_detail?product_id=<%=p.getProduct_id()%>">商品名：<%=p.getName()%></a></h3>
		<p style="float: left;">
			プロダクトid：<%=p.getProduct_id()%></p>
		<p style="float: left;">
			商品説明：<%=p.getDescription()%></p>
		<p style="float: left;">
			画像パス：<%=p.getP_img()%></p>
	</div>
	<%}%>
</div>
</container>
<%@include file="../../footer.html"%>