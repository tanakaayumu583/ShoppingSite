<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="jp.co.aforce.dao.NotificationDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="../../../../css/admin/admin_home.css"%>
<link rel="icon" href="/ShoppingSite/img/icon/favicon_admin.png">
</head>
<!-- ▼新着読み込み -->
<%
NotificationDAO dao = new NotificationDAO();
List<jp.co.aforce.bean.NotificationBean> list = new ArrayList<>();
list = dao.search_new_arrivals_notification();
%>
<!-- ▲新着読み込み -->
<body>
	<jsp:include page="../header_admin.jsp" />

	<c:if test="${s_a_user_id != null }">
		<!-- <strong style="color: green;">${s_a_user_id}</strong> -->
	</c:if>
	<c:remove var="errormsg" />
	<container>
	<div class="innerBox">
		<div id="side_news">
			<p id="side_news_text">新着</p>
			<ul id="side_news_ul">
				<%
				for (jp.co.aforce.bean.NotificationBean n : list) {
				%>
				<li>
					<form action="#">
						<a href="/ShoppingSite/views/admin/authenticated/new_arrivals_detail.jsp?notification_id=<%=n.getNotification_id()%>" class="unread">
							<p class="side_news_day"><%=n.getDate()%></p>
							<p class="side_news_title"><%=n.getLast_name()%>
								<%=n.getFirst_name()%>さんが<%=n.getSum()%>円分購入しました。
							</p> <input type="hidden" name="read_id"
							value="<%=n.getNotification_id()%>">
						</a>
					</form>
				</li>
				<%
				}
				%>
			</ul>
			<p id="side_news_link">
				<a href="/ShoppingSite/views/admin/authenticated/new_arrivals_list.jsp">すべての新着情報を見る</a>
			</p>
		</div>
		<div class="p-mypage p-mypage_left">
			<div class="content-item">
				<h2 class="o-title_mypage">基本機能</h2>
				<div class="p-mypage_content">
					<a href="/ShoppingSite/jp.co.aforce.servlet/Manage_product_list"
						class="p-mypage_content_detail">
						<p class="center">
							<img src="/ShoppingSite/img/icon/basic04.png" alt="商品管理">
						</p>
						<p class="center">商品管理</p>
					</a> <a href="/ShoppingSite/jp.co.aforce.servlet/Select_member_list"
						class="p-mypage_content_detail">
						<p class="center">
							<img src="/ShoppingSite/img/icon/basic01.png" alt="会員データベース">
						</p>
						<p class="center">
							会員<br>データベース
						</p>
					</a> <a
						href="/ShoppingSite/jp.co.aforce.servlet/Select_particulars_list"
						class="p-mypage_content_detail">
						<p class="center">
							<img src="/ShoppingSite/img/icon/basic05.png" alt="注文明細">
						</p>
						<p class="center">注文明細</p>
					</a> 
					<!-- <a href="/ShoppingSite/jp.co.aforce.servlet/Manage_product_list"
						class="p-mypage_content_detail">
						<p class="center">
							<img src="/ShoppingSite/img/icon/basic02.png" alt="メッセージ管理">
						</p>
						<p class="center">
							メッセージ<br>管理
						</p>
					</a> -->
				</div>
				<h2 class="o-title_mypage">その他</h2>
				<div class="p-mypage_content">
					<a href="/ShoppingSite/views/admin/authenticated/new_arrivals_list.jsp"
						class="p-mypage_content_detail">
						<p class="center">
							<img src="/ShoppingSite/img/icon/basic06.png" alt="新着">
						</p>
						<p class="center">新着</p>
					</a> 
					<a href="/ShoppingSite/views/admin/authenticated/new_arrivals_list.jsp"
					class="p-mypage_content_detail"
					style="background-color:gray;"
					>
						<p class="center">
							<img src="/ShoppingSite/img/icon/basic03.png" alt="設定">
						</p>
						<p class="center">設定</p>
					</a>
				</div>
			</div>
		</div>
	</div>
	</container>
	<%@include file="../../footer.html"%>