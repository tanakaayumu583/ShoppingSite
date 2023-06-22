<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
List<jp.co.aforce.bean.User_informationBean> list = (List<jp.co.aforce.bean.User_informationBean>) session
		.getAttribute("search_member_list");
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
			<h2 class="o-title_member-search">会員一覧</h2>
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
								<th style="width: 10%;" class="gijilist">名前</th>
								<th style="width: 5%;" class="gijilist">性別</th>
								<th style="width: 15%;" class="gijilist">生年月日</th>
								<th style="width: 15%;" class="gijilist">住所</th>
								<th style="width: 15%;" class="gijilist">ログイン<br>id</th>
								<th style="width: 15%;" class="gijilist">ログイン<br>password</th>
								<th style="width: 10%;" class="gijilist">削除</th>
							</tr>
							<%
							for (jp.co.aforce.bean.User_informationBean p : list) {
							%>
							<tr>
								<td class="read"><%=p.getUser_id()%></td>
								<td class="read"><%=p.getLast_name()%> <%=p.getFirst_name()%></td>
								<td class="read"><%=p.getSex()%></td>
								<td class="read"><%=p.getBirth_year()%>/<%=p.getBirth_month()%>/<%=p.getBirth_day()%></td>
								<td class="read"><%=p.getZip_code()%></td>
								<td class="read"><%=p.getLogin_id()%></td>
								<td class="read"><%=p.getLogin_password()%></td>
								<td class="read">
									<p style="width: 60%; margin: 0px auto;">
										<a
											href="/ShoppingSite/jp.co.aforce.servlet/Delete_product?product_id=">削除</a>
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