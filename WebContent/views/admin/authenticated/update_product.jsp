<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
List<jp.co.aforce.bean.ProductBean> list = (List<jp.co.aforce.bean.ProductBean>) session
		.getAttribute("search_product");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="../../../../css/admin/update_product.css"%>
<link rel="icon" href="/ShoppingSite/img/icon/favicon_admin.png">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<main>
		<jsp:include page="../header_admin.jsp" />
		<div class="main">
			<container>
			<div class="p-facility_list o-box is-main-content">
				<h2 class="o-title_member-search">商品編集</h2>
				<!-- ▼商品リスト -->
				<form class="product_add_form"
					action="/ShoppingSite/jp.co.aforce.servlet/Update_product"
					enctype="multipart/form-data" method="post">
					<div class="p-meeting_middle">
						<table>
							<tbody>
								<%
								for (jp.co.aforce.bean.ProductBean p : list) {
								%>
								<tr>
									<th>商品名</th>
									<td><textarea name="name" value="<%=p.getName()%>"><%=p.getName()%></textarea></td>
								</tr>
								<input type="hidden" name="product_id" value="<%=p.getProduct_id()%>">
								<tr>
									<th>商品説明</th>
									<td><textarea name="description"
											value="<%=p.getDescription()%>"><%=p.getDescription()%></textarea></td>
								</tr>
								<tr>
									<th>値段</th>
									<td><textarea name="price" value="<%=p.getPrice()%>"><%=p.getPrice()%></textarea></td>
								</tr>
								<tr>
									<th>商品画像</th>
									<td>
									<ul class="k_temp_ul" >
									<li><a href="/ShoppingSite/img/product_img/<%=p.getProduct_id()%>/<%=p.getP_img()%>"><%=p.getP_img()%></a></li>
									</ul>
									
									<span><label class="k_tempfile"><input
												type="file" name="pict" class="k_tempdummy" >ファイルを選択</label>
											<span>※選択できる画像は１枚までです</span> </span>
											<p style="margin-top:10px;">画像を更新すると更新後のファイルが以下に表示されます。</p>
											<p id="file-name"></p>
											
											</td>
											
								</tr>
								<%}%>
							</tbody>
						</table>
					</div>
					<div class="button_area">
						<input id="product_add_button" type="submit" value="更新">
					</div>
				</form>
				<!-- ▲商品リスト -->
			</div>
			</container>
		</div>
	</main>
	  <script>
    $(document).ready(function() {
      // ファイルが選択された時の処理
      $('input[type="file"]').change(function() {
        var fileName = $(this).val().split('\\').pop(); // ファイル名の取得
        $('#file-name').text(fileName); // ファイル名を表示する要素に設定
      });
    });
  </script>

	<%@include file="../../footer.html"%>