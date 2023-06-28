<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="jp.co.aforce.dao.ParticularsDAO"%>
<%@ page import="jp.co.aforce.bean.ParticularsBean"%>
<!-- ▼ステータス変更 -->
<%
String get_particulars_id = request.getParameter("particulars_id");
String get_select = request.getParameter("select");
int check_ok = 0;
ParticularsDAO dao = new ParticularsDAO();
if((get_particulars_id != null)&&(get_select != null)){
	check_ok = dao.update_status(get_particulars_id, get_select);
	
	
	List<ParticularsBean> list = new ArrayList<>();
	list = dao.search_particulars_list();
	session.setAttribute("search_particulars_list", list);
}

%>
<!-- ▲ステータス変更 -->
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
<link rel="icon" href="/ShoppingSite/img/icon/favicon_admin.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
								<th style="width: 5%;" class="gijilist">ステータス</th>
								<th style="width: 5%;" class="gijilist">ユーザid</th>
								<th style="width: 5%;" class="gijilist">商品id</th>
								<th style="width: 15%;" class="gijilist">商品名</th>
								<th style="width: 15%;" class="gijilist">単価(円)</th>
								<th style="width: 15%;" class="gijilist">個数(個)</th>
								<th style="width: 15%;" class="gijilist">合計(円)</th>
								<th style="width: 20%;" class="gijilist">購入日</th>

							</tr>
							<%
							long pre_particular_id = 0;
							for (jp.co.aforce.bean.ParticularsBean p : list) {
							%>
							<tr>
								<td class="read"><%=p.getId()%></td>
								<td class="read">
									<%
									if (pre_particular_id != p.getParticulars_id()) {
									%> <%=p.getParticulars_id()%> <%
 } else {
 %> --- <%
 }
 %>
								</td>
								<td class="read">
									<%
									if (pre_particular_id != p.getParticulars_id()) {
									%> <select>
										<option class="<%=p.getParticulars_id()%>"
											<%if (p.getStatus() == 1) {%> selected <%}%>>未発送</option>
										<option class="<%=p.getParticulars_id()%>"
											<%if (p.getStatus() == 2) {%> selected <%}%>>発送済み</option>
										<option class="<%=p.getParticulars_id()%>"
											<%if (p.getStatus() == 3) {%> selected <%}%>>受け取り済み</option>
										<option class="<%=p.getParticulars_id()%>"
											<%if (p.getStatus() == 4) {%> selected <%}%>>キャンセル済み</option>
								</select> <%
 } else {
 %> --- <%
 }
 pre_particular_id = p.getParticulars_id();
 %>
								</td>
								<td class="read"><%=p.getUser_id()%></td>
								<td class="read"><%=p.getProduct_id()%></td>
								<td class="read"><%=p.getProduct_name()%></td>
								<td class="read"><%=p.getProduct_price()%></td>
								<td class="read"><%=p.getQuantity()%></td>
								<td class="read"><%=p.getQuantity()*p.getProduct_price()%></td>
								<td class="read"><%=p.getDate()%></td>

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
	<script>
		$(function() {

			//セレクトボックスが切り替わったら発動
			$('select')
					.change(
							function() {

								//選択したvalue値を変数に格納
								var val = $(this).val();
								var id = $(this).attr('class');
								var selectedClass = $('option:selected', this).attr('class');
								//画面遷移
								window.location.href = "/ShoppingSite/views/admin/authenticated/particulars_list.jsp?particulars_id="
										+ selectedClass + "&select=" + val;
							});
		});
	</script>

	<%@include file="../../footer.html"%>