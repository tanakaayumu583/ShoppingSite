<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>Home</title>
<%@include file="../../header.html"%>

<c:if test="${s_a_user_id != null }">
<strong style="color:green; ">${s_a_user_id}</strong>
</c:if>
<c:remove var="errormsg" />
<container>
<div>
	<h2>Home</h2>
	<div>home</div>
	<p><a href="/ShoppingSite/jp.co.aforce.servlet/Product_list">商品管理</a></p>
	<p><a href="/ShoppingSite/jp.co.aforce.servlet/Logout?status=admin">ログアウト</a></p>
</div>
</container>
<%@include file="../../footer.html"%>