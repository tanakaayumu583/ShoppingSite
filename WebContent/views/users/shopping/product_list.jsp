<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="jp.co.aforce.bean.CartBean"%>
<%@ page import="jp.co.aforce.dao.ProductDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>


<link rel="icon"
	href="/ShoppingSite/img/icon/to_top_kinniku_nohaikei.png">
<%@include file="../../to_top.html"%>
<%@include file="../../../css/users/users_keijiban.css"%>
<%@include file="../../../css/users/users_product_list.css"%>
<%@include file="../../../css/users/users_background.css"%>
<!-- <link rel="icon"
	href="/ShoppingSite/img/icon/to_top_kinniku_nohaikei.png"> -->
</head>
<!-- ▼商品一覧取得  -->
<%
List<jp.co.aforce.bean.ProductBean> list = (List<jp.co.aforce.bean.ProductBean>) session
		.getAttribute("search_product_list");
%>
<!-- ▲商品一覧取得  -->
<!-- ▼カート情報取得　-->
<%
CartBean cart = (CartBean) session.getAttribute("cart");
%>
<!-- ▲カート情報取得取得  -->
<!-- ▼ログインステータス取得  -->
<%
boolean is_login;
Object loginCheck = session.getAttribute("s_user_id");
if (loginCheck == null) {
	is_login = false;
} else {
	is_login = true;
}
%>
<!-- ▲ログインステータス取得  -->
<!-- ▼検索条件取得 -->
<%
String get_keyword = "";
String get_order_by = "";
if ((request.getParameter("keyword") != "") && (request.getParameter("keyword") != null)) {
	get_keyword = request.getParameter("keyword");
}
if ((request.getParameter("order_by") != "") && (request.getParameter("order_by") != null)) {
	get_order_by = request.getParameter("order_by");
}
%>
<!-- ▼検索条件取得 -->

<style>
.search_func {
	margin-top: 80px;
	margin-left: 40px;
	left: 30px;
	top: 30px;
	z-index: 10;
	width: 50px;
	height: 50px;
	background-color: white;
	border-radius: 50%;
	display: flex;
	justify-content: center; /* 左右中央に配置 */
	align-items: center; /* 上下中央に配置 */
}

.search_func img {
	width: 40px;
	height: 40px;
}

.search_func:hover {
	background: rgba(220, 230, 76, 0.8);
	cursor: pointer;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	height: 100%;
	width: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #f4f4f4;
	margin: 20% auto;
	width: 50%;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 7px 20px 0
		rgba(0, 0, 0, 0.17);
	animation-name: modalopen;
	animation-duration: 1s;
}

@
keyframes modalopen {
	from {opacity: 0
}

to {
	opacity: 1
}

}
.modal-header h3 {
	margin: 1rem 0;
}

.modal-header {
	background: rgba(220, 230, 76, 0.8);
	padding: 3px 15px;
	display: flex;
	justify-content: space-between;
}

.modalClose {
	font-size: 2rem;
}

.modalClose:hover {
	cursor: pointer;
}

.modal-body {
	padding: 10px 20px;
	color: black;
}

tr {
	margin-top: 30px;
	height: 80px;
}
</style>
<!-- ▼BODY部 スタート -->
<body class="index">
<div class="kinnnikuman">
	<!-- 
	<div class="smart-bar-container">
		<div class="smart-bar-content">
			<div class="smart-bar-content-textarea">
				<span class="presentation"></span> <span class="timer"></span>
			</div>
			<div class="button_area">
				<button type="button" class="propaganda_button">
					<span>クリックして購入する。</span>
				</button>
			</div>
		</div>
	</div>
	-->
	<div class="frame_outer">
		<a name="top" id="top"></a>
		<!--▼HEADER-->
		<div id="header_wrap">
			<div id="header" class="clearfix">
				<div id="logo_area">
					<h1>
						<a href="#"><span>EC Shopping</span></a>
					</h1>
				</div>
				<div id="header_utility">
					<div id="headerInternalColumn">

						<!-- ▼総合案内とお知らせ -->
						<span class="thickboxbox">
							<ul>
								<%if (is_login == false) {%>
								<li><a href="/ShoppingSite/views/users/login.jsp">ログイン</a></li>
								<%}%>
								<%if (is_login == false) {%>
								<li><a href="/ShoppingSite/views/users/shopping/cart.jsp">カート</a></li>
								<%}%>
								<li><a href="#">お知らせ</a></li>
								<%
								if (is_login == true) {
								%>
								<li><a
									href="/ShoppingSite/jp.co.aforce.servlet/Logout?status=users">ログアウト</a></li>
								<%}%>
								<%if (is_login == true) {%>
								<input type="checkbox" class="menu-btn" id="menu-btn">
								<label for="menu-btn" class="menu-icon"><span
									class="navicon"></span></label>
								<ul class="menu" style="z-index: 2;">
									<li><label for="menu-btn" id="menu-btn_in"
										class="menu-icon"><span class="navicon"></span></label></li>
									<li><a href="/ShoppingSite/views/users/shopping/cart.jsp">カート</a></li>
									<li><a href="/ShoppingSite/views/users/shopping/cart.jsp">注文履歴</a></li>
									<li><a href="/ShoppingSite/views/users/update.jsp">アカウント編集</a></li>
									<li><a href="#">ほしいものリスト</a></li>
								</ul>
								<%}%>
							</ul> <!-- ▲総合案内とお知らせ -->
					</div>
				</div>
			</div>
		</div>
		<!--▲HEADER-->
		<div id="container" class="clearfix">
			<div id="one_maincolumn" class="main_column">
				<!-- ▼掲示板 -->
				<div class="note-box" id="app" style="margin-top:80px;">
					<%if (is_login == true) {%>
					<p class="osaihu_area">
						お財布： {{ balance.toLocaleString() }}円
						<button v-on:click="upCount" type="button"
							class="btn btn-outline-primary f_r"></button>
					</p>
					<%}%>
					<%
					if (cart != null) {
					%>
					<p class="">
						合計 ：
						<%=cart.getTotal()%>円
					</p>
					<%
					}
					%>
				</div>
				<!-- ▲掲示板 -->
				<!-- ▼検索機能 -->
				<a class="search_func" id="modalOpen"><img
					src="/ShoppingSite/img/users/mushimegane.png"></a>
				<div id="easyModal" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<h3>
								検索条件
								</h1>
								<span class="modalClose">×</span>
						</div>
						<div class="modal-body">
							<form
								action="/ShoppingSite/jp.co.aforce.servlet/User_product_list"
								method="get">
								<table>
									<tr>
										<th>キーワード検索</th>
										<td><input name="keyword" type="text"
											value="<%if (get_keyword != "") {%><%=get_keyword%><%}%>"></td>
									</tr>
									<tr>
										<th>並べ替え</th>
										<td><select name="order_by">
												<option <%if (get_order_by.equals("新着")) {%> selected <%}%>
													value="新着">新着</option>
												<option <%if (get_order_by.equals("価格が高い順")) {%> selected
													<%}%> value="価格が高い順">価格が高い順</option>
												<option <%if (get_order_by.equals("価格が安い順")) {%> selected
													<%}%> value="価格が安い順">価格が安い順</option>
										</select></td>
									</tr>
								</table>
								<div class="submit_area">
									<div class="button">
										<p class="submit_button">
											<input type="submit" id="regist" name="regist" value="検索">
										</p>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- ▲検索機能 -->
				<!-- ▼おすすめ商品 -->
				<div class="bloc_outer clearfix">
					<div id="recommend_area">
						<div class="bloc_body clearfix">
							<%
							for (jp.co.aforce.bean.ProductBean p : list) {
							%>
							<div class="product_item">
								<div class="image_area">
									<div class="productImage">
										<a
											href="/ShoppingSite/jp.co.aforce.servlet/User_product_detail?product_id=<%=p.getProduct_id()%>"><img
											src="/ShoppingSite/img/product_img/<%=p.getProduct_id()%>/<%=p.getP_img()%>"
											style="width: 150px; height: 150px;" alt="商品"
											class="toppicture" /></a>
									</div>
									<div class="picture_frame">
										<img src="/ShoppingSite/img/users/hyoushoudai01_kakou.png"
											style="width: 200px; height: 120px; margin-top: -60px; position: relative; z-index: -1;">
									</div>
								</div>
								<div class="inner_area">
									<div class="name_area">
										<p class="name">
											<strong style="color:white;"><%=p.getName()%></strong>
										</p>
									</div>
									<div class="description_area">
										<p class="description" style="color:white;"><%=p.getDescription()%></p>
									</div>
									<div class="bottom_area">
										<div class="price_area">
											<p class="price" style="color:white;"><%=p.getPrice()%>円
											</p>
										</div>
										<div class="detail_area">
											<button type="button"
												onclick="location.href='/ShoppingSite/jp.co.aforce.servlet/User_product_detail?product_id=<%=p.getProduct_id()%>'">詳細を見る</button>
										</div>
									</div>
								</div>
							</div>
							<div class="clear"></div>
							<%
							}
							%>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				<!-- ▲おすすめ商品 -->
			</div>
		</div>
		<!--▼FOOTER-->
		<!--<div class="clearfix"></div>
		<div id="footer_wrap">
			<div id="footer">
				<div id="footer_menu">
					<a href="#"><div class="abouts"></div></a> <a href="#" class=""><div
							class="order"></div></a> <a href="#" class=""><div
							class="privacy"></div></a> <a href="#" class=""><div
							class="contact"></div></a>
				</div>
				<div id="copyright">Copyright © 2012-2023 Bread Factory
					Nekonote All rights reserved.</div>
			</div>
		</div>-->
		<!--▲FOOTER-->
	</div>
	<div id="mTip-1" class="black mTip mTip-left"
		style="opacity: 0; display: none; position: absolute; z-index: 10000; left: 614px; top: 158px;">トップページへ</div>
		</div>
</body>
<!-- ▲BODY部 エンド -->
<script>
      const app = new Vue({
        el: "#app",
        data: {
          branchName: "",
          accountTypeName: "",
          accountNo: "",
          balance: "",
        },
        methods: {
          upCount: async function (event) {
            //ボタンがクリックされたら実行
            let response;
            try {
              response = axios({
                method: "GET",
                url: "https://developer.api.bk.mufg.jp/btmu/retail/trial/v2/me/accounts/",
                headers: {
                  "X-IBM-Client-Id": "7fb497db-b5f6-40a4-91b2-0bd9434bdcbc",
                  "X-BTMU-Seq-No": "20220620-111122223333aaaa",
                  Accept: "application/json",
                  accept: "application/json",
                },
              }).then((response) => {
                console.log(response.data);
                this.branchName = response.data.accounts[19].branchName;
                this.accountTypeName =
                  response.data.accounts[19].accountTypeName;
                this.accountNo = response.data.accounts[19].accountNo;
                this.balance = response.data.accounts[19].balance + 2465;
              });
            } catch (error) {
              console.error(error);
            }
          },
        },
      });
      
      //▼モーダルウィンドウ
      const buttonOpen = document.getElementById('modalOpen');
const modal = document.getElementById('easyModal');
const buttonClose = document.getElementsByClassName('modalClose')[0];

// ボタンがクリックされた時
buttonOpen.addEventListener('click', modalOpen);
function modalOpen() {
  modal.style.display = 'block';
}

// バツ印がクリックされた時
buttonClose.addEventListener('click', modalClose);
function modalClose() {
  modal.style.display = 'none';
}

// モーダルコンテンツ以外がクリックされた時
addEventListener('click', outsideClose);
function outsideClose(e) {
  if (e.target == modal) {
    modal.style.display = 'none';
  }
}
      //▲モーダルウィンドウ
    </script>
</html>