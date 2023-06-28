<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="jp.co.aforce.bean.CartBean"%>
<%@ page import="java.util.List"%>
<%@ page import="jp.co.aforce.dao.ProductDAO"%>
<!DOCTYPE html>
<!-- <html> -->
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<%@include file="../../../css/users/users_home.css"%>
<%@include file="../../../css/users/users_keijiban.css"%>
<%@include file="../../../css/users/users_background.css"%>
<link rel="icon" href="/ShoppingSite/img/icon/to_top_kinniku_nohaikei.png">
</head>
<!-- ▼おすすめ商品取得  -->
<%
ProductDAO dao = new ProductDAO();
List<jp.co.aforce.bean.ProductBean> list = new ArrayList<>();
list = dao.search_recommend_product_list();
%>
<!-- ▲おすすめ商品取得  -->
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
									<li><a href="/ShoppingSite/jp.co.aforce.servlet/Select_order_history">注文履歴</a></li>
									<li><a
										href="/ShoppingSite/jp.co.aforce.servlet/User_settings?post_type=search">アカウント編集</a></li>
									<li><a href="#">ほしいものリスト</a></li>
									
								</ul>
								<%}%>
							</ul>
						</span>
						<!-- ▲総合案内とお知らせ -->
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
				<!-- ▼おすすめ商品 -->
				<div class="bloc_outer clearfix">
					<div id="recommend_area">
						<div class="bloc_body clearfix">
							<%
							int i = 1;
							for (jp.co.aforce.bean.ProductBean p : list) {
							%>
							<div class="product_item clearfix">
								<div class="productImage">
									<a href="/ShoppingSite/jp.co.aforce.servlet/User_product_detail?product_id=<%=p.getProduct_id()%>"><img
										src="/ShoppingSite/img/product_img/<%=p.getProduct_id()%>/<%=p.getP_img()%>"
										style="width: 150px; height: 150px;" alt="商品"
										class="toppicture" /></a>
								</div>
								<div class="picture_frame">
									<img src="/ShoppingSite/img/users/hyoushoudai01_kakou.png"
										style="width: 200px; height: 120px; margin-top: -60px; position: relative; z-index: -1;">
								</div>
							</div>
							<%
							if (i % 3 == 0) {
							%>
							<div clas="clear"></div>
							<%
							}
							i++;
							}
							%>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				<div style="text-align: right;">
					<a
						style="cursor: pointer; z-index: 2; position: relative; text-decoration: underline;"
						href="/ShoppingSite/jp.co.aforce.servlet/User_product_list">商品一覧
						</a>
				</div>
				<!-- ▲おすすめ商品 -->
			</div>
		</div>
		<!--▼FOOTER-->
		<!-- <div class="clearfix"></div>
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
    </script>
</html>