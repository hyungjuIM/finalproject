﻿
CREATE TABLE "DONATION" (
	"DONATION_NO"	NUMBER	PRIMARY KEY,
	"DAGENCY_NAME"	VARCHAR2(50)	NOT NULL,
	"DAGENCY_TEL"	NUMBER	NOT NULL,
	"DAHEAD_NAME"	VARCHAR2(50)	NOT NULL,
	"DONATION_PERIOD"	DATE	DEFAULT SYSDATE,
	"DONATION_PLACE"	VARCHAR2(100)	NOT NULL,
	"DENROLL_DATE"	DATE	DEFAULT SYSDATE,
	"DELETE_STATUS"	CHAR(1)		DEFAULT 'N',
	"DCOM_STATUS"	CHAR(1)	DEFAULT 'N',
	"DONATION _AMOUNT"	NUMBER	NOT NULL,
	"DMODI_DATE"	DATE	DEFAULT SYSDATE,
	"DONATION_NUM"	NUMBER	NOT NULL,
	"DONATION_VIEW"	NUMBER	DEFAULT 0,
	"DONATION_TITLE"	VARCHAR2(200)	NOT NULL,
	"DONATION_CONTENT"	VARCHAR2(2000)	NOT NULL,
	"DONATION_ATTACHMENT"	VARCHAR2(200)	NULL,
	"MEMBER_NO"	NUMBER	NOT NULL,
	"CATEGORY_NO"	NUMBER	NOT NULL
);
ALTER TABLE "DONATION" 
ADD CONSTRAINTS DONATION_CHK CHECK(DELETE_STATUS IN ('Y','N'));
ALTER TABLE "DONATION" 
ADD CONSTRAINTS DONATION_CHK_2 CHECK(DCOM_STATUS IN ('Y','N'));

COMMIT;


CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER	PRIMARY KEY,
	"MEMBER_ID"	VARCHAR2(50)	NOT NULL,
	"MMEBER_PW"	VARCHAR2(200)	NOT NULL,
	"MEMBER_NAME"	VARCHAR2(50)	NOT NULL,
	"MEMBER_NICK"	VARCHAR2(50)	NOT NULL,
	"MEMBER_TEL"	NUMBER	NOT NULL,
	"MEMBER_ADDR"	VARCHAR2(200)	NOT NULL,
	"SIGNUP_TYPE"	CHAR(1)	NOT NULL,
	"ENROLL_DT"	DATE DEFAULT SYSDATE,
	"SECESSION_FL"	CHAR(1)		DEFAULT 'N',
	"PROFILE_IMG"	VARCHAR2(200)	NULL,
	"DA_TYPE"	CHAR(1)	NOT NULL,
	"SAVED_MONEY"	NUMBER	NULL
);

ALTER TABLE "MEMBER" 
ADD CONSTRAINTS MEMBER_CHK CHECK(SECESSION_FL IN ('Y','N'));


CREATE TABLE "MANAGER" (
	"MGR_NO"	NUMBER	PRIMARY KEY,
	"MGR_NAME"	VARCHAR2(50)	NOT NULL,
	"MGR_EMAIL"	VARCHAR2(50)	NOT NULL,
	"MGR_ID"	VARCHAR2(50)	NOT NULL,
	"MGR_PW"	VARCHAR2(200)	NOT NULL,
	"MGR_NICKNAME"	VARCHAR2(100)	NOT NULL,
	"MGR_TEL"	CHAR(11)	NOT NULL,
	"MGR_PROFILE_IMG"	VARCHAR2(200)	NULL,
	"MGR_PERMISSION"	CHAR(1)	NOT NULL
);

CREATE TABLE "PAYMENT" (
	"PAYMENT_NO"	NUMBER	PRIMARY KEY,
	"PAYMENT_TYPE"	VARCHAR2(20)	NOT NULL,
	"PAYMENT_DATE"	DATE	DEFAULT SYSDATE,
	"PAYMENT_PRICE"	NUMBER	NOT NULL,
	"MEMBER_NO"	NUMBER	NOT NULL,
	"DONATION_NO"	NUMBER	NOT NULL
);

CREATE TABLE "EMAIL_CERTIFICATION" (
	"MEMBER_NO"	NUMBER	NOT NULL,
	"CERTIFICATION_NO"	VARCHAR2(10)	NOT NULL,
	"ISSUE_DT"	DATE	DEFAULT SYSDATE
);

CREATE TABLE "CATEGORY" (
	"CATEGORY_NO"	NUMBER	PRIMARY KEY,
	"CATEGORY_NAME"	VARCHAR2(50)	NOT NULL,
	"CATEGORY_ID"	CHAR	NULL,
	"CATEGORY_LEV"	NUMBER	NULL,
	"CATEGORY_NM"	VARCHAR2(5)	NULL,
	"CATEGORY_PARENT_LEV"	NUMBER	REFERENCES CATEGORY
	
);

CREATE TABLE "NOTICE" (
	"NOTICE_NO"	NUMBER	PRIMARY KEY,
	"NOTICE_TITLE"	VARCHAR2(200)	NOT NULL,
	"NOTICE_CONTENT"	VARCHAR2(2000)	NOT NULL,
	"ENROLL_DT"	DATE	DEFAULT SYSDATE,
	"MODI_DATE"	DATE	DEFAULT SYSDATE,
	"NOTICE_VIEWS"	NUMBER		DEFAULT 0,
	"DELETE_STATUS"	CHAR(1)		DEFAULT 'N',
	"MGR_NO"	NUMBER	NOT NULL
);
ALTER TABLE "NOTICE" 
ADD CONSTRAINTS NOTICE_CHK CHECK(DELETE_STATUS IN ('Y','N'));

COMMIT;

CREATE TABLE "VOLUNTEER" (
	"VOLUNTEER_NO"	NUMBER	PRIMARY KEY,
	"VAGENCY_NAME"	VARCHAR2(100)	NOT NULL,
	"VAGENCY_TEL"	CHAR(11)	NOT NULL,
	"VHEAD_NAME"	VARCHAR2(100)	NOT NULL,
	"VOLUNTEER_PERIOD"	DATE	NOT NULL,
	"VOLUNTEER_PLACE"	VARCHAR2(100)	NOT NULL,
	"VENROLL_DATE"	DATE	DEFAULT SYSDATE,
	"VDELETE_STATUS"	CHAR(1)	DEFAULT 'N',
	"VCOM_STATUS"	CHAR(1)	DEFAULT 'N',
	"VMODI_DATE"	DATE	DEFAULT SYSDATE,
	"VOLUNTEER_NUM"	NUMBER	NOT NULL,
	"VREAD_COUNT"	NUMBER	DEFAULT 0,
	"VOLUNTEER_TITLE"	VARCHAR2(100)	NOT NULL,
	"VOLUNTEER_CONTENT"	VARCHAR2(2000)	NOT NULL,
	"VOLUNTEER_ATTACHEMENT"	VARCHAR2(500)	NULL,
	"MEMBER_NO"	NUMBER	NOT NULL,
	"CATEGORY_NO"	NUMBER	NOT NULL
);

ALTER TABLE "VOLUNTEER" 
ADD CONSTRAINTS VDELETE_STATUS_CHK CHECK(VDELETE_STATUS IN ('Y','N'));
ALTER TABLE "VOLUNTEER" 
ADD CONSTRAINTS VCOM_STATUS_CHK CHECK(VCOM_STATUS IN ('Y','N'));
COMMIT;

CREATE TABLE "ALARM" (
	"ALARM_NO"	NUMBER	PRIMARY KEY,
	"ALARM_CONTENT"	VARCHAR2(2000)	NOT NULL,
	"ALARM_DATE"	DATE	DEFAULT SYSDATE,
	"ALARM_STATUS"	VARCHAR2(20) DEFAULT 'N',
	"MEMBER_NO"	NUMBER	NOT NULL,
	"DONATION_NO"	NUMBER	NOT NULL,
	"VOLUNTEER_NO"	NUMBER	NOT NULL,
	"REVIEW_NO"	NUMBER	NOT NULL,
	"USAGE_NO"	NUMBER	NOT NULL,
	"RATE_NO"	NUMBER	NOT NULL,
	"EVENT_NO"	NUMBER	NOT NULL,
	"CS_NO"	NUMBER	NOT NULL,
	"PAYMENT_NO"	NUMBER	NOT NULL,
	"NOTICE_NO"	NUMBER	NOT NULL,
	"ASK_NO"	NUMBER	NOT NULL
);

ALTER TABLE "ALARM" 
ADD CONSTRAINTS ALARM_STATUS_CHK CHECK(ALARM_STATUS IN ('Y','N'));

COMMIT;

CREATE TABLE "EVENT" (
	"EVENT_NO"	NUMBER	PRIMARY KEY,
	"EVENT_TITLE"	VARCHAR2(200)	NOT NULL,
	"EVENT_CONTENT"	VARCHAR2(2000)	NOT NULL,
	"ENROLL_DT"	DATE	DEFAULT SYSDATE,
	"MODI_DT"	DATE	DEFAULT SYSDATE,
	"EVENT_VIEWS"	NUMBER		DEFAULT 0,
	"DELETE_STATUS"	CHAR(1)		DEFAULT 'N',
	"EVENT_IMG"	VARCHAR2(200)	NULL,
	"MGR_NO"	NUMBER NOT NULL
);

ALTER TABLE "EVENT" 
ADD CONSTRAINTS DELETE_STATUS_CHK CHECK(DELETE_STATUS IN ('Y','N'));

COMMIT;

CREATE TABLE "FAVORITES" (
	"FAV_NO"	NUMBER	PRIMARY KEY,
	"FAV_STATUS"	CHAR(1)		DEFAULT 'N',
	"MEMBER_NO"	NUMBER	NOT NULL,
	"DONATION_NO"	NUMBER	NOT NULL,
	"VOLUNTEER_NO"	NUMBER	NOT NULL
);
ALTER TABLE "FAVORITES" 
ADD CONSTRAINTS FAV_STATUS_CHK CHECK(FAV_STATUS IN ('Y','N'));

COMMIT;

CREATE TABLE "ASK" (
	"ASK_NO"	NUMBER	PRIMARY KEY,
	"ASK_TITLE"	VARCHAR2(100)	NOT NULL,
	"ASK_CONTENT"	VARCHAR2(1000)	NOT NULL,
	"AENROLL_DATE"	DATE	DEFAULT SYSDATE,
	"AMODI_DATE"	DATE	DEFAULT SYSDATE,
	"ASL_STATUS"	VARCHAR2(20)	DEFAULT 'N',
	"ASK_FILE"	VARCHAR2(200)	NULL,
	"MEMBER_NO"	NUMBER	NOT NULL
);

ALTER TABLE "ASK" 
ADD CONSTRAINTS ASL_STATUS_CHK CHECK(ASL_STATUS IN ('Y','N'));

COMMIT;

CREATE TABLE "MYACTIVE" (
	"MYACT_NO"	NUMBER	PRIMARY KEY,
	"VOLCOM_STATUS"	CHAR	DEFAULT 'N',
	"DONATION_NO"	NUMBER	NOT NULL,
	"VOLUNTEER_NO"	NUMBER	NOT NULL,
	"MEMBER_NO"	NUMBER	NOT NULL,
	"EVENT_NO"	NUMBER	NOT NULL
);

ALTER TABLE "MYACTIVE" 
ADD CONSTRAINTS VOLCOM_STATUS_CHK CHECK(VOLCOM_STATUS IN ('Y','N'));

COMMIT;


CREATE TABLE "EVENT_REGISTER" (
	"EVENT_REGITER_NO"	NUMBER	PRIMARY KEY,
	"MEMBER_NO"	NUMBER	NOT NULL,
	"EVENT_NO"	NUMBER	NOT NULL
);

CREATE TABLE "RESERVES" (
	"USAGE_NO"	NUMBER	PRIMARY KEY,
	"USAGE_PRICE"	VARCHAR2(1000)	NULL,
	"USAGE_DATE"	DATE	DEFAULT SYSDATE,
	"MEMBER_NO"	NUMBER	NOT NULL,
	"DONATION_NO"	NUMBER	NOT NULL
);

CREATE TABLE "RATE" (
	"RATE_NO"	NUMBER	PRIMARY KEY,
	"RATE_NAME"	VARCHAR2(20)	NOT NULL,
	"RENEWAL_DATE"	DATE	DEFAULT SYSDATE,
	"DONATION_RATE"	VARCHAR2(20)	NOT NULL,
	"VOLUNTEER_RATE"	VARCHAR2(20)	NOT NULL,
	"MEMBER_NO"	NUMBER	NOT NULL
);

CREATE TABLE "CUSTOMER_SERVICE" (
	"CS_NO"	NUMBER	PRIMARY KEY,
	"CHAT_CONTENT"	VARCHAR2(2000)	NOT NULL,
	"ENROLL_DT"	DATE	DEFAULT SYSDATE,
	"CHAT_END_DT"	DATE	DEFAULT SYSDATE,
	"CHAT_ROMM_STATUS"	CHAR(1)	DEFAULT 'N',
	"MGR_NO"	NUMBER	NOT NULL,
	"MEMBER_NO"	NUMBER	NOT NULL
);

ALTER TABLE "CUSTOMER_SERVICE" 
ADD CONSTRAINTS CHAT_ROMM_STATUS_CHK CHECK(CHAT_ROMM_STATUS IN ('Y','N'));

COMMIT;


CREATE TABLE "REVIEW" (
	"REVIEW_NO"	NUMBER	PRIMARY KEY,
	"REVIEW_CONTENT"	VARCHAR2(1000)	NOT NULL,
	"REVIEW_DATE"	DATE	DEFAULT SYSDATE,
	"REV_UPDATE_DATE"	DATE	DEFAULT SYSDATE,
	"REVIEW_STATUS"	CHAR	DEFAULT 'N',
	"REVIEW_TITLE"	VARCHAR2(50)	NOT NULL,
	"MEMBER_NO"	NUMBER	NOT NULL,
	"DONATION_NO"	NUMBER	NOT NULL,
	"VOLUNTEER_NO"	NUMBER	NOT NULL
);

ALTER TABLE "REVIEW" 
ADD CONSTRAINTS REVIEW_STATUS_CHK CHECK(REVIEW_STATUS IN ('Y','N'));

COMMIT;

CREATE TABLE "MAP" (
	"MAP_NO"	NUMBER	PRIMARY KEY,
	"DONATION_NO"	NUMBER	NOT NULL,
	"CATEGORY_NO"	NUMBER	NOT NULL,
	"VOLUNTEER_NO"	NUMBER	NOT NULL
);



-- 시퀀스 생성
CREATE SEQUENCE SEQ_ALARM_NO;
CREATE SEQUENCE SEQ_ASK_NO;
CREATE SEQUENCE SEQ_CATEGORY_NO;
CREATE SEQUENCE SEQ_CS_NO;
CREATE SEQUENCE SEQ_DONATION_NO;
CREATE SEQUENCE SEQ_EVENT_NO;
CREATE SEQUENCE SEQ_EVENT_REGITER_NO;
CREATE SEQUENCE SEQ_FAV_NO;
CREATE SEQUENCE SEQ_MGR_NO;
CREATE SEQUENCE SEQ_MAP_NO;
CREATE SEQUENCE SEQ_MEMBER_NO;
CREATE SEQUENCE SEQ_MYACT_NO;
CREATE SEQUENCE SEQ_NOTICE_NO;
CREATE SEQUENCE SEQ_PAYMENT_NO;
CREATE SEQUENCE SEQ_RATE_NO;
CREATE SEQUENCE SEQ_USAGE_NO;
CREATE SEQUENCE SEQ_REVIEW_NO;

CREATE SEQUENCE SEQ_VOLUNTEER_NO;


