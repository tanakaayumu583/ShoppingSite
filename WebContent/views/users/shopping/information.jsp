<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.html"%>
<title>会員情報登録</title>
<link href="/ShoppingSite/css/member_regist.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- メッセージ -->
<c:if test="${errormsg != null }">
	<strong style="color: green;">${errormsg}</strong>
</c:if>
<c:remove var="errormsg" />
<container>
<div></div>
</container>
<script src="/ShoppingSite/js/ajax.js"></script>
<%@include file="../footer.html"%>