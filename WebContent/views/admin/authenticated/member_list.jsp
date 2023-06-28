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
<link rel="icon" href="/ShoppingSite/img/icon/favicon_admin.png">
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
							</tr>
							<%
							for (jp.co.aforce.bean.User_informationBean p : list) {
							%>
							<tr>
								<td class="read"><%=p.getUser_id()%></td>
								<td class="read"><%=p.getLast_name()%> <%=p.getFirst_name()%></td>
								<td class="read">
								<%if(p.getSex()==1){%>
								男
								<%}else{ %>
								女
                                <%} %>
								</td>
								<td class="read"><%=p.getBirth_year()%>/<%=p.getBirth_month()%>/<%=p.getBirth_day()%></td>
								<td class="read">
								<%if(p.getPrefectures()==1){%>北海道<%} %>
<%if(p.getPrefectures()==2){%>青森県<%} %>
<%if(p.getPrefectures()==3){%>岩手県<%} %>
<%if(p.getPrefectures()==4){%>宮城県<%} %>
<%if(p.getPrefectures()==5){%>秋田県<%} %>
<%if(p.getPrefectures()==6){%>山形県<%} %>
<%if(p.getPrefectures()==7){%>福島県<%} %>
<%if(p.getPrefectures()==8){%>茨城県<%} %>
<%if(p.getPrefectures()==9){%>栃木県<%} %>
<%if(p.getPrefectures()==10){%>群馬県<%} %>
<%if(p.getPrefectures()==11){%>埼玉県<%} %>
<%if(p.getPrefectures()==12){%>千葉県<%} %>
<%if(p.getPrefectures()==13){%>東京都<%} %>
<%if(p.getPrefectures()==14){%>神奈川県<%} %>
<%if(p.getPrefectures()==15){%>新潟県<%} %>
<%if(p.getPrefectures()==16){%>富山県<%} %>
<%if(p.getPrefectures()==17){%>石川県<%} %>
<%if(p.getPrefectures()==18){%>福井県<%} %>
<%if(p.getPrefectures()==19){%>山梨県<%} %>
<%if(p.getPrefectures()==20){%>長野県<%} %>
<%if(p.getPrefectures()==21){%>岐阜県<%} %>
<%if(p.getPrefectures()==22){%>静岡県<%} %>
<%if(p.getPrefectures()==23){%>愛知県<%} %>
<%if(p.getPrefectures()==24){%>三重県<%} %>
<%if(p.getPrefectures()==25){%>滋賀県<%} %>
<%if(p.getPrefectures()==26){%>京都府<%} %>
<%if(p.getPrefectures()==27){%>大阪府<%} %>
<%if(p.getPrefectures()==28){%>兵庫県<%} %>
<%if(p.getPrefectures()==29){%>奈良県<%} %>
<%if(p.getPrefectures()==30){%>和歌山県<%} %>
<%if(p.getPrefectures()==31){%>鳥取県<%} %>
<%if(p.getPrefectures()==32){%>島根県<%} %>
<%if(p.getPrefectures()==33){%>岡山県<%} %>
<%if(p.getPrefectures()==34){%>広島県<%} %>
<%if(p.getPrefectures()==35){%>山口県<%} %>
<%if(p.getPrefectures()==36){%>徳島県<%} %>
<%if(p.getPrefectures()==37){%>香川県<%} %>
<%if(p.getPrefectures()==38){%>愛媛県<%} %>
<%if(p.getPrefectures()==39){%>高知県<%} %>
<%if(p.getPrefectures()==40){%>福岡県<%} %>
<%if(p.getPrefectures()==41){%>佐賀県<%} %>
<%if(p.getPrefectures()==42){%>長崎県<%} %>
<%if(p.getPrefectures()==43){%>熊本県<%} %>
<%if(p.getPrefectures()==44){%>大分県<%} %>
<%if(p.getPrefectures()==45){%>宮崎県<%} %>
<%if(p.getPrefectures()==46){%>鹿児島県<%} %>
<%if(p.getPrefectures()==47){%>沖縄県<%} %>
								<br>
								<%=p.getCity_address()%>
								</td>
								<td class="read"><%=p.getLogin_id()%></td>
								<td class="read"><%=p.getLogin_password()%></td>
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