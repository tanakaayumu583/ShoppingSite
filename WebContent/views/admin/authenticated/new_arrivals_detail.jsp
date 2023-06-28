<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="jp.co.aforce.dao.NotificationDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="../../../../css/admin/new_arrivals_detail.css"%>
<link rel="icon" href="/ShoppingSite/img/icon/favicon_admin.png">
<!-- ▼新着読み込み -->
<%
NotificationDAO dao = new NotificationDAO();
List<jp.co.aforce.bean.NotificationBean> list = new ArrayList<>();
list = dao.search_notification();
%>
<!-- ▲新着読み込み -->
<!-- ▼GETデータ取得 -->
<%
int get_notification_id = Integer.parseInt(request.getParameter("notification_id"));
%>
<!-- ▼GETデータ取得 -->
</head>
<body>
	<main>
		<jsp:include page="../header_admin.jsp" />
		<%
		for (jp.co.aforce.bean.NotificationBean n : list) {
		%>
		<%
		if (n.getNotification_id() == get_notification_id) {
		%>
		<!-- ▼ -->
		<%
		
int is_success = dao.update_notification(get_notification_id);
%>
		<!-- ▲ -->

		<container>
		<div class="p-facility_list o-box is-main-content">
			<h2 class="o-title_member-search">新着情報</h2>
			<!-- ▼情報リスト -->
			<div class="k_wbox">
				<div class="info_title">商品が購入されました</div>
				<div class="info_date"><%=n.getDate()%></div>
				<div class="info_content">
					<%=n.getLast_name()%>
					<%=n.getFirst_name()%>さんが<%=n.getSum()%>円分購入しました。<br> <br>
					商品発送の準備をしましょう。 <br> <br> <a
						href="/ShoppingSite/jp.co.aforce.servlet/Select_particulars_list">明細一覧はこちら</a>
				</div>
			</div>
			<!-- ▲情報リスト -->
		</div>
		</container>
		<%
		}
		%>
		<%
		}
		%>
		</tbody
	</main>

	<%@include file="../../footer.html"%>