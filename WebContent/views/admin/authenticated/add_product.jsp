<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="../../../../css/admin/add_product.css"%>
<link rel="icon" href="/ShoppingSite/img/icon/favicon_admin.png">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<main>

		<jsp:include page="../header_admin.jsp" />
		<div class="main">
			<container>
			<div class="p-facility_list o-box is-main-content">
				<h2 class="o-title_member-search">商品追加</h2>
				<!-- ▼商品リスト -->
				<form class="product_add_form"
					action="/ShoppingSite/jp.co.aforce.servlet/Add_product"
					enctype="multipart/form-data" method="post">
					<div class="p-meeting_middle">
						<table>
							<tbody>
								<tr>
									<th>商品名</th>
									<td><textarea name="name"></textarea></td>
								</tr>
								<tr>
									<th>商品説明</th>
									<td><textarea name="description"></textarea></td>
								</tr>
								<tr>
									<th>値段</th>
									<td><textarea name="price"></textarea></td>
								</tr>
								<tr>
									<th>商品画像</th>
									<td><span><label class="k_tempfile"><input
												type="file" name="pict" class="k_tempdummy">ファイルを選択</label>
											<span>※選択できる画像は１枚までです</span> </span>
										<p style="margin-top: 10px;">画像を更新すると更新後のファイルが以下に表示されます。</p>
										<p id="file-name"></p></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="button_area">
						<input id="product_add_button" type="submit" value="登録">
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