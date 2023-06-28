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
<%@include file="../../../../css/admin/new_arrivals_list.css"%>
<link rel="icon" href="/ShoppingSite/img/icon/favicon_admin.png">
<!-- ▼新着読み込み -->
<%
NotificationDAO dao = new NotificationDAO();
List<jp.co.aforce.bean.NotificationBean> list = new ArrayList<>();
list = dao.search_notification();
%>
<!-- ▲新着読み込み -->
</head>
<body>
	<main>
		<jsp:include page="../header_admin.jsp" />
		<container>
		<div class="p-facility_list o-box is-main-content">
			<h2 class="o-title_member-search">新着情報一覧</h2>
			<!-- ▼情報リスト -->
			<table class="k_table">
				<tbody>
					<%
					for (jp.co.aforce.bean.NotificationBean n : list) {
					%>
					<tr>
						<td
							class="
						<%if (n.getRead() == 0) {%>
						unread
						<%} else {%>
						read
						<%}%>
						"><form>
								<a
									href="/ShoppingSite/views/admin/authenticated/new_arrivals_detail.jsp?notification_id=<%=n.getNotification_id()%>"><%=n.getLast_name()%>
									<%=n.getFirst_name()%>さんが<%=n.getSum()%>円分購入しました。</a> <input
									type="hidden">
							</form></td>
						<td
							class="
						<%if (n.getRead() == 0) {%>
						unread
						<%} else {%>
						read
						<%}%>
						"><%=n.getDate()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<!-- ▲情報リスト -->
		</div>
		</container>
	</main>

	<%@include file="../../footer.html"%>