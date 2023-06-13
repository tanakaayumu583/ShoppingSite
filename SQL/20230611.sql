CREATE DATABASE tanaka_login_db;
USE tanaka_login_db;

--ユーザ情報
CREATE TABLE k_users
(user_id     INT auto_increment primary key comment '会員番号',
 last_name    VARCHAR(32) NOT NULL comment '名前_姓',
 first_name VARCHAR(32) NOT NULL comment '名前_名',
 sex  INT(1) NOT NULL comment '性別',
 birth_year  INT(4) NOT NULL comment '生年月日_年',
 birth_month   INT(2) NOT NULL comment '生年月日_月',
 birth_day  INT(2) NOT NULL comment '生年月日_日',
 job      INT(3) NOT NULL comment '職業',
 zip_code     INT(7) NOT NULL comment '郵便番号',
 prefectures     INT(4) NOT NULL comment '都道府県',
 city_address     VARCHAR(128) NOT NULL comment '市町村以降',
 phone_number INT(11) NOT NULL comment '電話番号',
 mail_address     VARCHAR(128) NOT NULL comment 'メールアドレス',
 email_delivery INT(1) NOT NULL comment 'メール配信',
 index(user_id)
);

--ログイン情報
DROP TABLE IF EXISTS `authorization`;
CREATE TABLE `authorization` (
  `user_id` int NOT NULL  comment 'ユーザテーブルへの外部キー',
  `login_id` varchar(100) NOT NULL primary key comment 'ログインid(主キー)',
  `login_password` varchar(100) NOT NULL comment 'パスワード',
  CONSTRAINT fk_user_id
    FOREIGN KEY (user_id) 
    REFERENCES k_users (user_id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

  


