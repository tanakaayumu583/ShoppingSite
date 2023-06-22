<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
List<jp.co.aforce.bean.ParticularsBean> list = (List<jp.co.aforce.bean.ParticularsBean>) session
		.getAttribute("search_particulars_list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="../../../../css/admin/product_list.css"%>
</head>
<body>
	<main>
		<jsp:include page="../header_admin.jsp" />
		<container>
		<div class="p-facility_list o-box is-main-content">
			<h2 class="o-title_member-search">明細一覧</h2>
			<!-- ▼検索機能 -->
			<form action="#" method="get" name="myform" id="form-terms"></form>
			<!-- ▲検索機能 -->
			<!-- ▼商品リスト -->
			<div class="p-facility_list_content">
				<div class="flex-list"></div>
				<div class="o-table is-facility_list">
					<table>
						<tbody>
							<tr>
								<th style="width: 5%;" class="gijilist">id</th>
								<th style="width: 10%;" class="gijilist">明細番号</th>
								<th style="width: 5%;" class="gijilist">ユーザid</th>
								<th style="width: 15%;" class="gijilist">商品id</th>
								<th style="width: 15%;" class="gijilist">商品名</th>
								<th style="width: 15%;" class="gijilist">値段</th>
								<th style="width: 15%;" class="gijilist">購入日</th>
								<th style="width: 5%;" class="gijilist">ステータス</th>
							</tr>
							<%
							long pre_particular_id = 0; 
							for (jp.co.aforce.bean.ParticularsBean p : list) {
							%>
							<tr>
								<td class="read"><%=p.getId()%></td>
								<td class="read">
								<%if(pre_particular_id !=p.getParticulars_id()){ %>
								<%=p.getParticulars_id()%>
								<%}else{%>
									---
								<%}
								pre_particular_id = p.getParticulars_id();%>
								</td>
								<td class="read"><%=p.getUser_id()%></td>
								<td class="read"><%=p.getProduct_id()%></td>
								<td class="read"><%=p.getProduct_name()%></td>
								<td class="read"><%=p.getQuantity()%></td>
								<td class="read"><%=p.getDate()%></td>
								<td class="read"><%=p.getStatus()%></td>
							</tr>
							<%}%>
						</tbody>
					</table>
				</div>
				<div class="paging_area"></div>
			</div>
			<!-- ▲商品リスト -->
		</div>
		</container>
	</main>

	<%@include file="../../footer.html"%>