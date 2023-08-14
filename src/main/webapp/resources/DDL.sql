DROP TABLE users CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE order_detail CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE basket CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;

drop sequence user_no_seq;
drop sequence product_code_seq;
drop sequence basket_no_seq;
drop sequence order_no_seq;
drop sequence order_detail_no_seq;
drop sequence notice_no_seq;
drop sequence faq_no_seq;
drop sequence qna_no_seq;
drop sequence review_file_no_seq;



CREATE SEQUENCE user_no_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE product_code_seq
START WITH 100000
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE basket_no_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE order_no_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE order_detail_no_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE notice_no_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE faq_no_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE qna_no_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE review_file_no_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
NOCACHE
NOORDER;


CREATE TABLE notice (
notice_no  number(10) NOT NULL,
user_no number(20) NOT NULL,
title varchar2(200) NOT NULL,
state varchar2(20) NOT NULL,
write_date date DEFAULT sysdate NOT NULL,
content varchar2(1000) NOT NULL,
kinds number(10) DEFAULT 0 NOT NULL
);

CREATE TABLE basket (
	basket_no	number(20)		NOT NULL,
	product_code	number(10)		NOT NULL,
	user_no	number(20)		NOT NULL,
	product_quantity	number(20)	DEFAULT 0	NOT NULL,
	delivery_charge	number(20)	DEFAULT 3000	NOT NULL,
	price_sum	number(20)	DEFAULT 0	NOT NULL
);

CREATE TABLE users (
	user_no	number(20)		NOT NULL,
	user_grade	varchar2(30)	DEFAULT 'shrimp'	NOT NULL,
	user_name	varchar2(30)		NOT NULL,
	user_id	varchar2(30)		NOT NULL,
	user_pw	varchar2(200)		NOT NULL,
	email	varchar2(200)		NULL,
	birth	date		NOT NULL,
	join_date	timestamp	DEFAULT systimestamp	NOT NULL,
	phone	number(20)		NOT NULL,
	tongsin	varchar2(10)		NOT NULL,
	basic_addr	varchar2(200)		NOT NULL,
	detail_addr	varchar2(200)		NOT NULL,
	buy_sum	number(20)	DEFAULT 0	NOT NULL,
	point	number(20)	DEFAULT 0	NOT NULL,
	admin	varchar2(10)	DEFAULT 'N'	NOT NULL,
    operate varchar2(10)    DEFAULT 'Y' NOT NULL
);

CREATE TABLE orders (
	order_no	number(20)		NOT NULL,
	user_no	number(20)		NOT NULL,
	product_quantity	number(20)		NOT NULL,
	used_point	number(20)	DEFAULT 0	NOT NULL,
	basic_addr	varchar2(200)		NOT NULL,
	detail_addr	varchar2(200)		NOT NULL,
	payment_method	varchar2(20)		NOT NULL,
	order_date	timestamp	DEFAULT systimestamp	NOT NULL,
	delivery_charge	number(20)	DEFAULT 3000	NOT NULL,
	price	number(20)		NOT NULL,
	order_status	number(10)		NOT NULL
);

CREATE TABLE review (
	review_no	number(10)		NOT NULL,
	user_no	number(20)		NOT NULL,
	product_code	number(10)		NOT NULL,
	product_name	varchar2(200)		NOT NULL,
	title	varchar2(200)		NOT NULL,
	rate	number(10)		NOT NULL,
	purpose	number(10)		NOT NULL,
	agegroup	number(10)		NOT NULL,
	rdate	date	DEFAULT sysdate	NOT NULL,
	content	varchar2(1000)		NOT NULL
);

CREATE TABLE FAQ (
	faq_no	number(10)		NOT NULL,
	user_no	number(20)		NOT NULL,
	title	varchar2(200)		NOT NULL,
	state	varchar2(20)		NOT NULL,
	write_date	date	DEFAULT sysdate	NOT NULL,
	content	varchar2(1000)		NOT NULL,
	kinds	number(10)	DEFAULT 0	NOT NULL
);

CREATE TABLE product (
	product_code	number(10)		NOT NULL,
	category_code	VARCHAR2(10)		NOT NULL,
	name	VARCHAR2(200)		NOT NULL,
	content	VARCHAR2(1000)		NOT NULL,
	price	number(10)		NOT NULL,
	stock	number(10)	DEFAULT 0	NOT NULL,
	rdate	timestamp	DEFAULT systimestamp	NOT NULL
);

CREATE TABLE category (
	category_code	VARCHAR2(10)		NOT NULL,
	category_name	VARCHAR2(10)		NOT NULL
);

CREATE TABLE qna (
	qna_no	number(10)		NOT NULL,
	user_no	number(20)		NOT NULL,
	title	varchar2(200)		NOT NULL,
	state	varchar2(20)		NOT NULL,
	write_date	date	DEFAULT sysdate	NOT NULL,
	content	varchar2(1000)		NOT NULL,
	kinds	number(10)	DEFAULT 0	NOT NULL,
	answer	varchar2(1000)		NULL
);

CREATE TABLE order_detail (
	order_detail_no	number(20)		NOT NULL,
	product_code	number(10)		NOT NULL,
	order_no	number(20)		NOT NULL,
	order_detail_price	number(20)		NOT NULL,
	order_detail_quantity	number(20)		NOT NULL
);


ALTER TABLE notice ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
	notice_no
);
ALTER TABLE basket ADD CONSTRAINT PK_BASKET PRIMARY KEY (
	basket_no
);
ALTER TABLE users ADD CONSTRAINT PK_USERS PRIMARY KEY (
	user_no
);
ALTER TABLE orders ADD CONSTRAINT PK_ORDER PRIMARY KEY (
	order_no
);
ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	review_no
);
ALTER TABLE FAQ ADD CONSTRAINT PK_FAQ PRIMARY KEY (
	faq_no
);
ALTER TABLE product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	product_code
);
ALTER TABLE category ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (
	category_code
);
ALTER TABLE qna ADD CONSTRAINT PK_QNA PRIMARY KEY (
	qna_no
);
ALTER TABLE order_detail ADD CONSTRAINT PK_ORDER_DETAIL PRIMARY KEY (
	order_detail_no
);

