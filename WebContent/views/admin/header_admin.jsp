<%@page contentType="text/html; charset=UTF-8"%>
<header class="header">
	<div class="logo">
		<!-- ロゴ画像を表示するための要素 -->
		<img src="logo.png" alt="ロゴ">
	</div>
	<div class="user-info">
		<!-- ユーザアイコン -->
		<div class="user-icon">
			<img src="user-icon.png" alt="ユーザアイコン">
		</div>
		<!-- ユーザ名 -->
		<div class="user-name">
			田中 歩夢
			<ul class="dropdown-menu">
				<li><a class="no_de" href="/ShoppingSite/jp.co.aforce.servlet/Manage_product_list">アカウント</a></li>
				<li><a class="no_de" href="/ShoppingSite/jp.co.aforce.servlet/Logout?status=admin">ログアウト</a></li>
			</ul>
		</div>
		<!-- ベルマーク -->
		<div class="notification-icon">
			<img src="bell-icon.png" alt="ベルマーク">
		</div>
	</div>
</header>
<style type="text/css">


.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #0075c8; /* 青色の背景 */
	color: #fff; /* 文字色 */
	padding: 25px 20px; /* 適宜調整 */
}

.logo img {
	height: 40px; /* 適宜調整 */
}

.user-info {
	display: flex;
	align-items: center;
	position: relative;
}

.user-info .user-icon img {
	height: 30px; /* 適宜調整 */
	margin-right: 10px;
}

.user-info .user-name {
	font-weight: bold;
	margin-right: 10px;
	cursor: pointer;
}

.user-info .dropdown-menu {
	position: absolute;
	top: 100%;
	right: 0;
	background-color: #fff;
	padding: 10px;
	display: none;
	padding-top:30px;
	margin-right: 90px;
}
.no_de:link, .no_de:visited, .no_de:hover, .no_de:active {
  color: white;
  text-decoration: none;
}

.user-info .dropdown-menu li {
	list-style: none;
	padding: 5px 0;
}

.user-name:hover .dropdown-menu {
	display: block;
	color:white;
	background-color: #0075c8;
	z-index:2;
}
.dropdown-menu:hover .dropdown-menu {
	display: block;
	decoration:none;
	background-color: #0075c8;
}

.user-info .notification-icon img {
	height: 25px; /* 適宜調整 */
}
</style>