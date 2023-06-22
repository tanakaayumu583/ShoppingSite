<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="
	jp.co.aforce.bean.CartBean,
	jp.co.aforce.bean.ProductBean,
	java.util.*"%>
<!DOCTYPE html>
<%@include file="../../header.html"%>
<title>カート</title>
<link href="/ShoppingSite/css/member_regist.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- メッセージ -->
<c:if test="${errormsg != null }">
	<strong style="color: green;">${errormsg}</strong>
</c:if>
<c:remove var="errormsg" />
<%
CartBean cart = (CartBean) session.getAttribute("cart");
%>
<container>
<div>
	<%
	if (cart != null) {
	%>
	<div class="alert alert-secondary float-right" role="alert">
		<%=String.format("合計:%,d円", cart.getTotal())%>
	</div>
	<table class="table table-striped mt-4">
		<tr>
			<th>商品名</th>
			<th>価格</th>
		</tr>
		<%
		for (ProductBean p : cart.getList()) {
		%>
		<tr>
			<th><%=p.getName()%></th>
			<td><%=String.format("%,d円", p.getPrice())%>×<%=String.format("%,d個", p.getQuantity())%>=<%=String.format("%,d円", p.getPrice() * p.getQuantity())%></td>
		</tr>
		<%
		}
		%>
	</table>
	<%
	}
	%>
</div>
<div class="submit_area">
<p><a href="/ShoppingSite/jp.co.aforce.servlet/User_product_list">買い物を続ける</a></p>
<p><a href="/ShoppingSite/jp.co.aforce.servlet/Purchase">購入手続き</a></p>
↑一旦このボタンで購入処理が走るようにする。

</div>
</container>
<script src="/ShoppingSite/js/ajax.js"></script>
<%@include file="../../footer.html"%>