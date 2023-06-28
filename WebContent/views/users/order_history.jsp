<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<title>購入履歴</title>
<link rel="icon" href="/ShoppingSite/img/icon/to_top_kinniku_nohaikei.png">
<%@include file="../to_top.html"%>
<%@include file="../../../css/users/order_history.css"%>
<%@include file="../../../css/users/users_background.css"%>
<script src="//code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<!-- ▼履歴取得 -->
<%
List<jp.co.aforce.bean.ParticularsBean> list = (List<jp.co.aforce.bean.ParticularsBean>) session
		.getAttribute("search_order_history");
%>
<!-- ▲履歴取得 -->
<!-- メッセージ -->
<c:if test="${errormsg != null }">
	<strong style="color: green;">${errormsg}</strong>
</c:if>
<c:remove var="errormsg" />
<body class="index">
	<container>
	<div class="letter">
		<div>
			<h2>注文履歴</h2>
			<h3>未発送の商品</h3>

						<!-- ▼商品リスト -->
			<div class="p-facility_list_content">
				<div class="flex-list"></div>
				<div class="o-table is-facility_list">
					<table>
						<tbody>
							<tr>
								
								<th style="width: 10%;" class="gijilist">明細番号</th>
								<th style="width: 10%;" class="gijilist">キャンセル</th>
								<th style="width: 5%;" class="gijilist">id</th>
								<th style="width: 10%;" class="gijilist">商品名</th>
								<th style="width: 10%;" class="gijilist">値段(円)</th>
								<th style="width: 10%;" class="gijilist">個数(個)</th>
								<th style="width: 10%;" class="gijilist">購入日</th>
							</tr>
							<%
							long pre_particular_id_1 = 0; 
							for (jp.co.aforce.bean.ParticularsBean p : list) {
							%>
							<%if(p.getStatus() == 1){ %>
							<tr>
								
								<td class="read">
								<%if(pre_particular_id_1 !=p.getParticulars_id()){ %>
								<%=p.getParticulars_id()%>
								<%}else{%>
									---
								<%}%>
								</td>
								<td class="read">
								<%if(pre_particular_id_1 !=p.getParticulars_id()){ %>
								<a href="/ShoppingSite/jp.co.aforce.servlet/Cancel_order?particulars_id=<%=p.getParticulars_id()%>" onclick="return confirm('本当にキャンセルしますか？');">キャンセル</a>
								<%}else{%>
									---
								<%}
								pre_particular_id_1 = p.getParticulars_id();%>
								
								</td>
								<td class="read"><%=p.getId()%></td>
								<td class="read"><%=p.getProduct_name()%></td>
								<td class="read"><%=p.getProduct_price()%></td>
								<td class="read"><%=p.getQuantity()%></td>
								<td class="read"><%=p.getDate()%></td>
							</tr>
							<%} %>
							<%}%>
						</tbody>
					</table>
				</div>
				<div class="paging_area"></div>
			</div>
			<!-- ▲商品リスト -->
						<h3>発送済み商品</h3>

									<!-- ▼商品リスト -->
			<div class="p-facility_list_content">
				<div class="flex-list"></div>
				<div class="o-table is-facility_list">
					<table>
						<tbody>
							<tr>
								
								<th style="width: 10%;" class="gijilist">明細番号</th>
								<th style="width: 5%;" class="gijilist">id</th>
								<th style="width: 15%;" class="gijilist">商品名</th>
								<th style="width: 15%;" class="gijilist">値段(円)</th>
								<th style="width: 10%;" class="gijilist">個数(個)</th>
								<th style="width: 10%;" class="gijilist">購入日</th>
							</tr>
							<%
							long pre_particular_id_2 = 0; 
							for (jp.co.aforce.bean.ParticularsBean p : list) {
							%>
							<%if(p.getStatus() == 2){ %>
							<tr>
								
								<td class="read">
								<%if(pre_particular_id_2 !=p.getParticulars_id()){ %>
								<%=p.getParticulars_id()%>
								<%}else{%>
									---
								<%}
								pre_particular_id_2 = p.getParticulars_id();%>
								</td>
								<td class="read"><%=p.getId()%></td>
								<td class="read"><%=p.getProduct_name()%></td>
								<td class="read"><%=p.getProduct_price()%></td>
								<td class="read"><%=p.getQuantity()%></td>
								<td class="read"><%=p.getDate()%></td>
							</tr>
							<%} %>
							<%}%>
						</tbody>
					</table>
				</div>
				<div class="paging_area"></div>
			</div>
			<!-- ▲商品リスト -->
						<h3>受け取り済み商品</h3>
									<!-- ▼商品リスト -->
			<div class="p-facility_list_content">
				<div class="flex-list"></div>
				<div class="o-table is-facility_list">
					<table>
						<tbody>
							<tr>
								
								<th style="width: 10%;" class="gijilist">明細番号</th>
								<th style="width: 5%;" class="gijilist">id</th>
								<th style="width: 15%;" class="gijilist">商品名</th>
								<th style="width: 15%;" class="gijilist">値段(円)</th>
								<th style="width: 10%;" class="gijilist">個数(個)</th>
								<th style="width: 10%;" class="gijilist">購入日</th>
							</tr>
							<%
							long pre_particular_id_3 = 0; 
							for (jp.co.aforce.bean.ParticularsBean p : list) {
							%>
							<%if(p.getStatus() == 3){ %>
							<tr>
								
								<td class="read">
								<%if(pre_particular_id_3 !=p.getParticulars_id()){ %>
								<%=p.getParticulars_id()%>
								<%}else{%>
									---
								<%}
								pre_particular_id_3 = p.getParticulars_id();%>
								</td>
								<td class="read"><%=p.getId()%></td>
								<td class="read"><%=p.getProduct_name()%></td>
								<td class="read"><%=p.getProduct_price()%></td>
								<td class="read"><%=p.getQuantity()%></td>
								<td class="read"><%=p.getDate()%></td>
							</tr>
							<%}%>
							<%}%>
						</tbody>
					</table>
				</div>
				<div class="paging_area"></div>
			</div>
			<!-- ▲商品リスト -->
		</div>
	</container>
</body>
<script src="/ShoppingSite/js/ajax.js"></script>
<%@include file="../footer.html"%>