<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
List<jp.co.aforce.bean.ProductBean> list = (List<jp.co.aforce.bean.ProductBean>) session
		.getAttribute("search_product_list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="../../../../css/admin/product_list.css"%>
<link rel="icon" href="/ShoppingSite/img/icon/favicon_admin.png">
</head>
<body>
	<main>
		<jsp:include page="../header_admin.jsp" />
		<container>
		<div class="p-facility_list o-box is-main-content">
			<h2 class="o-title_member-search">メッセージ設定</h2>
			<!-- ▼商品追加 -->
			<p class="product_add_button_area"><a class="product_add_button" href="/ShoppingSite/views/admin/authenticated/add_product.jsp">商品登録</a></p>
			<!-- ▲商品追加 -->
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
								<th style="width: 10%;" class="gijilist">画像</th>
								<th style="width: 10%;" class="gijilist">商品id</th>
								<th style="width: 30%;" class="gijilist">商品名</th>
								<th style="width: 15%;" class="gijilist">値段</th>
								<th style="width: 15%;" class="gijilist">詳細/編集</th>
								<th style="width: 10%;" class="gijilist">削除</th>
							</tr>
							<%
							for (jp.co.aforce.bean.ProductBean p : list) {
							%>
							<tr>
								<td class="read"><img
									src="/ShoppingSite/img/product_img/<%=p.getProduct_id()%>/<%=p.getP_img()%>"
									style="width: 50px; height: 50px;"></td>
								<td class="read"><%=p.getProduct_id()%></td>
								<td class="read"><%=p.getName()%></td>
								<td class="read"><%=p.getPrice()%></td>
								<td class="read">
									<p style="width: 50%; margin: 0px auto;">
										<a
											href="/ShoppingSite/jp.co.aforce.servlet/Update_product?product_id=<%=p.getProduct_id()%>">詳細/編集</a>
									</p>
								</td>
								<td class="read">
									<p style="width: 60%; margin: 0px auto;">
										<a
											href="/ShoppingSite/jp.co.aforce.servlet/Delete_product?product_id=<%=p.getProduct_id()%>">削除</a>
									</p>
								</td>
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