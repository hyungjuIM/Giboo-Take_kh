CREATE TABLE "MEMBER" ( -- 멤버 테이블
	"MEMBER_NO"	NUMBER PRIMARY KEY, -- 사용자NO
	"MEMBER_ID"	VARCHAR2(50) NOT NULL -- 사용자 ID
	"MEMBER_PW"	VARCHAR2(200) NOT NULL, -- 사용자 PW
    "MEMBER_EMAIL" VARCHAR2(100) NOT NULL -- 사용자 이메일
	"MEMBER_NAME" VARCHAR2(50) NOT NULL, -- 사용자 이름
	"MEMBER_NICK" VARCHAR2(50) NOT NULL, -- 사용자 닉네임
	"MEMBER_TEL" NUMBER	NOT NULL, -- 사용자 전화번호
	"MEMBER_ADDR" VARCHAR2(200)	NOT NULL, -- 사용자 주소
	"ENROLL_DT"	DATE NOT NULL DEFAULT SYSDATE, -- 가입일
	"SECESSION_FL" CHAR(1) NOT NULL DEFAULT 'N', -- 탈퇴여부
	"PROFILE_IMG" VARCHAR2(200), -- 사용자 프로필 이미지
	"MEMBER_TYPE" CHAR(1) NOT NULL, -- 사용자 구분(사용자, 운영자)
	"POINT_PRICE" NUMBER NOT NULL DEFAULT 0 -- 보유적립금
);

COMMENT ON TABLE MEMBER IS '멤버 테이블';
COMMENT ON COLUMN MEMBER.MEMBER_NO IS '사용자NO (기본키)';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '사용자 ID';
COMMENT ON COLUMN MEMBER.MEMBER_PW IS '사용자 PW';
COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '사용자 이메일';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '사용자 이름';
COMMENT ON COLUMN MEMBER.MEMBER_NICK IS '사용자 닉네임';
COMMENT ON COLUMN MEMBER.MEMBER_TEL IS '사용자 전화번호';
COMMENT ON COLUMN MEMBER.MEMBER_ADDR IS '사용자 주소';
COMMENT ON COLUMN MEMBER.ENROLL_DT IS '사용자 가입일';
COMMENT ON COLUMN MEMBER.SECESSION_FL IS '사용자 탈퇴여부';
COMMENT ON COLUMN MEMBER.PROFILE_IMG IS '사용자 프로필 이미지';
COMMENT ON COLUMN MEMBER.MEMBER_TYPE IS '사용자 구분 (사용자, 운영자)';
COMMENT ON COLUMN MEMBER.POINT_PRICE IS '사용자 보유 적립금';

ALTER TABLE "MEMBER" 
ADD CONSTRAINT MEMBER_CHK CHECK(SECESSION_FL IN ('Y','N'));

ALTER TABLE "MEMBER" 
ADD CONSTRAINT MEMBER_TYPE_CHK CHECK(MEMBER_TYPE IN ('Y','N'));
COMMIT;

CREATE TABLE "MANAGER" ( -- 관리자 테이블
	"MGR_NO" NUMBER	PRIMARY KEY, -- 관리자NO
	"MGR_ID" VARCHAR2(50) NOT NULL, -- 관리자 ID
	"MGR_PW" VARCHAR2(200) NOT NULL, -- 관리자 PW
	"MGR_EMAIL" VARCHAR2(50) NOT NULL, -- 관리자 이메일
	"MGR_NAME" VARCHAR2(50)	NOT NULL, -- 관리자 이름
	"MGR_NICKNAME" VARCHAR2(100) NOT NULL, -- 관리자 닉네임
	"MGR_TEL" CHAR(11) NOT NULL, -- 관리자 전화번호
	"MGR_PERMISSION" CHAR(1) NOT NULL -- 관리자 권한
	"MGR_PROFILE_IMG" VARCHAR2(200) -- 관리자 프로필이미지
);

COMMENT ON TABLE MANAGER IS '관리자 테이블';
COMMENT ON COLUMN MANAGER.MGR_NO IS '관리자NO (기본키)';
COMMENT ON COLUMN MANAGER.MGR_ID IS '관리자 ID';
COMMENT ON COLUMN MANAGER.MGR_PW IS '관리자 PW';
COMMENT ON COLUMN MANAGER.MGR_EMAIL IS '관리자 이메일';
COMMENT ON COLUMN MANAGER.MGR_NAME IS '관리자 이름';
COMMENT ON COLUMN MANAGER.MGR_NICKNAME IS '관리자 닉네임';
COMMENT ON COLUMN MANAGER.MGR_TEL IS '관리자 전화번호';
COMMENT ON COLUMN MANAGER.MGR_PERMISSION IS '관리자 권한';
COMMENT ON COLUMN MANAGER.MGR_PROFILE_IMG IS '관리자 프로필 이미지';

-- ALTER TABLE "MANAGER"
-- ADD CONSTRAINT MGR_PERMISSION_CHK CHECK(MGR_PERMISSION IN ('A', 'B', 'C'));
COMMIT;

CREATE TABLE "DONATION" ( -- 기부 테이블
	"DONATION_NO" NUMBER PRIMARY KEY, -- 기부No
    "TARGET_AMOUN" NUMBER NOT NULL, -- 목표금액
    "LOCATION_X" VARCHAR2(100) NOT NULL, -- 기부지역x좌표
    "LOCATION_Y" VARCHAR2(100) NOT NULL, -- 기부지역Y좌표
    "DONATION_ADDR" VARCHAR2(200) NOT NULL, -- 기부 주소
    "ENROLL_DATE" DATE NOT NULL DEFAULT SYSDATE, -- 등록일
    "START_RECRUIT_DATE" DATE NOT NULL DEFAULT SYSDATE, -- 모집일       
    "END_RECRUIT_DATE" DATE NOT NULL DEFAULT SYSDATE, -- 마감일
    "START_PROGRESS_DATE" DATE NOT NULL DEFAULT SYSDATE, -- 진행일
    "END_PROGRESS_DATE" DATE NOT NULL DEFAULT SYSDATE, --진행마감일
    "DELETE_STATUS" CHAR(1)	NOT NULL DEFAULT 'N', -- 기부삭제여부
    "DCOM_STATUS" CHAR(1) NOT NULL DEFAULT 'N', -- 기부완료여부
    "DONATION_AMOUNT" NUMBER NOT NULL, -- 현재 기부금
    "VIEW_COUNT" NUMBER NOT NULL DEFAULT 0, -- 조회수
    "DONATION_TITLE" VARCHAR2(200) NOT NULL,-- 기부제목
	"DONATION_CONTENT" VARCHAR2(2000) NOT NULL,-- 기부내용
	"DONATION_ATTACHMENT" VARCHAR2(200),-- 기부첨부파일
	"MEMBER_NO"	NUMBER NOT NULL, -- MEMBERNO
	"CATEGORY_NO" NUMBER NOT NULL, --카테코리NO
    "AGENCY_NO" NUMBER NOT NULL -- 기관 NO
);

COMMENT ON TABLE DONATION IS '기부 테이블';
COMMENT ON COLUMN DONATION.DONATION_NO IS '기부NO (기본키)';
COMMENT ON COLUMN DONATION.TARGET_AMOUN IS '기부 목표 금액';
COMMENT ON COLUMN DONATION.LOCATION_X IS '기부지역 X좌표';
COMMENT ON COLUMN DONATION.LOCATION_Y IS '기부지역 Y좌표';
COMMENT ON COLUMN DONATION.DONATION_ADDR IS '기부 지역 주소';
COMMENT ON COLUMN DONATION.ENROLL_DATE IS '기부 등록일';
COMMENT ON COLUMN DONATION.START_RECRUIT_DATE IS '기부 모집일';
COMMENT ON COLUMN DONATION.END_RECRUIT_DATE IS '기부 모집마감일';
COMMENT ON COLUMN DONATION.START_PROGRESS_DATE IS '기부 진행일';
COMMENT ON COLUMN DONATION.END_PROGRESS_DATE IS '기부 진행마감일';
COMMENT ON COLUMN DONATION.DELETE_STATUS IS '기부 삭제 여부';
COMMENT ON COLUMN DONATION.DCOM_STATUS IS '기부 완료 여부';
COMMENT ON COLUMN DONATION.DONATION_AMOUNT IS '현재 기부금';
COMMENT ON COLUMN DONATION.VIEW_COUNT IS '기부 조회수';
COMMENT ON COLUMN DONATION.DONATION_TITLE IS '기부 제목';
COMMENT ON COLUMN DONATION.DONATION_CONTENT IS '기부 내용';
COMMENT ON COLUMN DONATION.DONATION_ATTACHMENT IS '기부 첨부파일';
COMMENT ON COLUMN DONATION.MEMBER_NO IS '기부 사용자NO (외래키)';
COMMENT ON COLUMN DONATION.CATEGORY_NO IS '기부 카테고리NO (외래키)';
COMMENT ON COLUMN DONATION.AGENCY_NO IS '기부 기관NO (외래키)';

ALTER TABLE "DONATION" 
ADD CONSTRAINT DONATION_CHK CHECK(DELETE_STATUS IN ('Y','N'));

ALTER TABLE "DONATION" 
ADD CONSTRAINT DONATION_CHK_2 CHECK(DCOM_STATUS IN ('Y','N'));
COMMIT;

CREATE TABLE "VOLUNTEER" ( -- 봉사 테이블
	"VOLUNTEER_NO" NUMBER PRIMARY KEY, -- 봉사NO
	"TARGET_PEOPLE" NUMBER NOT NULL, -- 목표인원
    "LOCATION_X" NUMBER NOT NULL, -- 봉사지역(X좌표)
    "LOCATION_Y" NUMBER NOT NULL, -- 봉사지역(Y좌표)
    "VOLUNTEER_ADDR" VARCHAR2(200) NOT NULL, -- 봉사 주소
    "ENROLL_DATE" DATE NOT NULL DEFAULT SYSDATE, -- 등록일
    "START_RECRUIT_DATE" DATE NOT NULL, -- 모집일
    "END_RECRUIT_DATE" DATE NOT NULL, -- 마감일
    "START_PROGRESS_DATE" DATE NOT NULL, -- 진행일
    "END_PROGRESS_DATE" DATE NOT NULL, -- 진행마감일
    "VOLUNTEER_DELETE_STATUS" CHAR(1) NOT NULL DEFAULT 'N', -- 봉사 삭제 여부
    "VOLUNTEER_COMPLETE_STATUS" CHAR(1) NOT NULL DEFAULT 'N', -- 봉사 완료 여부
    "VOLUNTEER_COUNT" NUMBER NOT NULL, -- 봉사 참여 인원
    "VIEW_COUNT" NUMBER NOT NULL DEFAULT 0, -- 조회수
    "VOLUNTEER_TITLE" VARCHAR2(200) NOT NULL, -- 봉사 제목
    "VOLUNTEER_CONTENT" VARCHAR2(2000) NOT NULL, -- 봉사 내용
    "VOLUNTEER_ATTACHEMENT" VARCHAR2(2000), -- 봉사 첨부파일
    "MEMBER_NO" NUMBER NOT NULL, -- 사용자NO
    "CATEGORY_NO" NUMBER NOT NULL, -- 카테고리NO
    "AGENCY_NO" NUMBER NOT NULL -- 기관NO
);

COMMENT ON TABLE VOLUNTEER IS '봉사테이블';
COMMENT ON COLUMN VOLUNTEER.VOLUNTEER_NO IS '봉사 NO (기본키)';
COMMENT ON COLUMN VOLUNTEER.TARGET_PEOPLE IS '봉사 목표 인원';
COMMENT ON COLUMN VOLUNTEER.LOCATION_X IS '봉사 지역 X좌표';
COMMENT ON COLUMN VOLUNTEER.LOCATION_Y IS '봉사 지역 Y좌표';
COMMENT ON COLUMN VOLUNTEER.VOLUNTEER_ADDR IS '봉사 지역 주소';
COMMENT ON COLUMN VOLUNTEER.ENROLL_DATE IS '봉사 등록일';
COMMENT ON COLUMN VOLUNTEER.START_RECRUIT_DATE IS '봉사 모집일';
COMMENT ON COLUMN VOLUNTEER.END_RECRUIT_DATE IS '봉사 모집마감일';
COMMENT ON COLUMN VOLUNTEER.START_PROGRESS_DATE IS '봉사 진행일';
COMMENT ON COLUMN VOLUNTEER.END_PROGRESS_DATE IS '봉사 진행마감일';
COMMENT ON COLUMN VOLUNTEER.VOLUNTEER_DELETE_STATUS IS '봉사 삭제 여부';
COMMENT ON COLUMN VOLUNTEER.VOLUNTEER_COMPLETE_STATUS IS '봉사 완료 여부';
COMMENT ON COLUMN VOLUNTEER.VOLUNTEER_COUNT IS '봉사 참여 인원';
COMMENT ON COLUMN VOLUNTEER.VIEW_COUNT IS '봉사 조회수';
COMMENT ON COLUMN VOLUNTEER.VOLUNTEER_TITLE IS '봉사 제목';
COMMENT ON COLUMN VOLUNTEER.VOLUNTEER_CONTENT IS '봉사 내용';
COMMENT ON COLUMN VOLUNTEER.VOLUNTEER_ATTACHEMENT IS '봉사 첨부파일';
COMMENT ON COLUMN VOLUNTEER.MEMBER_NO IS '봉사 사용자NO (외래키)';
COMMENT ON COLUMN VOLUNTEER.CATEGORY_NO IS '봉사 카테고리NO (외래키)';
COMMENT ON COLUMN VOLUNTEER.AGENCY_NO IS '봉사 기관NO(외래키)';

ALTER TABLE "VOLUNTEER" 
ADD CONSTRAINT VOLUNTEER_DELETE_STATUS_CHK CHECK(VOLUNTEER_DELETE_STATUS IN ('Y','N'));

ALTER TABLE "VOLUNTEER" 
ADD CONSTRAINT VOLUNTEER_COMPLETE_STATUS_CHK CHECK(VOLUNTEER_COMPLETE_STATUS IN ('Y','N'));
COMMIT;

CREATE TABLE "AGENCY" ( -- 기관 테이블
    "AGENCY_NO" NUMBER PRIMARY KEY, -- 기관NO
    "AGENCY_NAME" VARCHAR2(100) NOT NULL, -- 기관명
    "MEMBER_NO" NUMBER NOT NULL -- 사용자NO
);

COMMENT ON TABLE AGENCY IS '기관 테이블';
COMMENT ON COLUMN AGENCY.AGENCY_NO IS '기관 NO (기본키)';
COMMENT ON COLUMN AGENCY.AGENCY_NAME IS '기관명';
COMMENT ON COLUMN AGENCY.MEMBER_NO IS '기관 사용자NO (외래키)';
COMMIT;

CREATE TABLE "NOTICE" ( -- 공지사항 테이블
	"NOTICE_NO" NUMBER PRIMARY KEY, -- 공지사항NO
	"NOTICE_TITLE" VARCHAR2(200) NOT NULL, -- 공지사항 제목
	"NOTICE_CONTENT" VARCHAR2(2000) NOT NULL, -- 공지사항 내용
    "ATTACHMENT" VARCHAR2(2000), -- 첨부파일
	"ENROLL_DT" DATE NOT NULL DEFAULT SYSDATE, -- 작성일
	"VIEW_COUNT" NUMBER NOT NULL DEFAULT 0, -- 조회수
	"DELETE_STATUS" CHAR(1) NOT NULL DEFAULT 'N', -- 삭제유무
	"MGR_NO" NUMBER NOT NULL -- 관리자NO
);

COMMENT ON TABLE NOTICE IS '공지사항 테이블';
COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지사항NO (기본키)';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '공지사항 제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '공지사항 내용';
COMMENT ON COLUMN NOTICE.ATTACHMENT IS '공지사항 첨부파일';
COMMENT ON COLUMN NOTICE.ENROLL_DT IS '공지사항 작성일';
COMMENT ON COLUMN NOTICE.VIEW_COUNT IS '공지사항 조회수';
COMMENT ON COLUMN NOTICE.DELETE_STATUS IS '공지사항 삭제여부';
COMMENT ON COLUMN NOTICE.MGR_NO IS '공지사항 관리자NO (외래키)';
COMMIT;

ALTER TABLE "NOTICE" 
ADD CONSTRAINT DELETE_STATUS_CHK CHECK(DELETE_STATUS IN ('Y','N'));
COMMIT;

CREATE TABLE "CUSTOMER_SERVICE" ( -- 거객센터 테이블
	"CS_NO" NUMBER PRIMARY KEY, -- 고객센터NO
	"CHAT_CONTENT" VARCHAR2(2000) NOT NULL, -- 채팅 내용
	"ENROLL_DT" DATE NOT NULL DEFAULT SYSDATE,-- 채팅 생성일
	"CHAT_END_DT" DATE DEFAULT SYSDATE, -- 채팅 종료일
	"CHAT_ROMM_STATUS" CHAR(1) NOT NULL DEFAULT 'N', -- 채팅방 상태
	"MGR_NO" NUMBER NOT NULL, -- 관리자NO
	"MEMBER_NO" NUMBER NOT NULL-- MEMBERNO
);

COMMENT ON TABLE CUSTOMER_SERVICE IS '고객센터 테이블';
COMMENT ON COLUMN CUSTOMER_SERVICE.CS_NO IS '고객센터 NO (기본키)';
COMMENT ON COLUMN CUSTOMER_SERVICE.CHAT_CONTENT IS '고객센터 1대1 채팅 내용';
COMMENT ON COLUMN CUSTOMER_SERVICE.ENROLL_DT IS '고객센터 1대1 채팅 생성일';
COMMENT ON COLUMN CUSTOMER_SERVICE.CHAT_END_DT IS '고객센터 1대1 채팅 종료일';
COMMENT ON COLUMN CUSTOMER_SERVICE.CHAT_ROMM_STATUS IS '고객센터 1대1 채팅 종료 여부';
COMMENT ON COLUMN CUSTOMER_SERVICE.MGR_NO IS '고객센터 관리자NO (외래키)';
COMMENT ON COLUMN CUSTOMER_SERVICE.MEMBER_NO IS '고겍센터 사용자NO (외래키)';
COMMIT;

ALTER TABLE "CUSTOMER_SERVICE" 
ADD CONSTRAINT CHAT_ROMM_STATUS_CHK CHECK(CHAT_ROMM_STATUS IN ('Y','N'));
COMMIT;

CREATE TABLE "FAQ" ( -- 자주 찾는 질문 테이블
	"FAQ_NO" NUMBER PRIMARY KEY, -- 자주 찾는 질문 NO
	"FAQ_CATEGORY" VARCHAR2(50) NOT NULL, -- 자주 찾는 질문 카테고리
	"FAQ_TITLE" VARCHAR2(200) NOT NULL, -- 자주 찾는 질문 제목
	"FAQ_CONTENT" VARCHAR2(2000) NOT NULL -- 자주 찾는 질문 내용
);

COMMENT ON TABLE FAQ IS '자주 찾는 질문 테이블';
COMMENT ON COLUMN FAQ.FAQ_NO IS '자주 찾는 질문 NO (기본키)';
COMMENT ON COLUMN FAQ.FAQ_CATEGORY IS '자주 찾는 질문 카테고리';
COMMENT ON COLUMN FAQ.FAQ_TITLE IS '자주 찾는 질문 제목';
COMMENT ON COLUMN FAQ.FAQ_CONTENT IS '자주 찾는 질문 내용';
COMMIT;

CREATE TABLE "EVENT" ( -- 이벤트 테이블
	"EVENT_NO" NUMBER PRIMARY KEY, -- 이벤트 NO
	"EVENT_TITLE" VARCHAR2(200) NOT NULL, -- 이벤트 제목
	"EVENT_CONTENT" VARCHAR2(2000) NOT NULL, -- 이벤트 내용
    "TARGET_PEOPLE" NUMBER NOT NULL, -- 목표인원
	"ENROLL_DATE" DATE NOT NULL DEFAULT SYSDATE,  -- 등록일  
	"END_RECRUIT_DATE" DATE NOT NULL,-- 마감일
	"MODI_STATUS" CHAR(1) NOT NULL DEFAULT 'N', -- 삭제유무 
	"ATTACHMENT" VARCHAR2(200), -- 첨부파일
	"MGR_NO" NUMBER NOT NULL -- 관리자NO
);

COMMENT ON TABLE EVENT IS '이벤트 테이블';
COMMENT ON COLUMN EVENT.EVENT_NO IS '이벤트 NO (기본키)';
COMMENT ON COLUMN EVENT.EVENT_TITLE IS '이벤트 제목';
COMMENT ON COLUMN EVENT.EVENT_CONTENT IS '이벤트 내용';
COMMENT ON COLUMN EVENT.TARGET_PEOPLE IS '이벤트 목표인원';
COMMENT ON COLUMN EVENT.ENROLL_DATE IS '이벤트 등록일';
COMMENT ON COLUMN EVENT.END_RECRUIT_DATE IS '이벤트 마감일';
COMMENT ON COLUMN EVENT.MODI_STATUS IS '이벤트 삭제여부';
COMMENT ON COLUMN EVENT.ATTACHMENT IS '이벤트 첨부파일';
COMMENT ON COLUMN EVENT.MGR_NO IS '이벤트 관리자NO (외래키)';

ALTER TABLE "EVENT" 
ADD CONSTRAINT MODI_STATUS_CHK CHECK(MODI_STATUS IN ('Y','N'));
COMMIT;

CREATE TABLE "STAMP"( -- 스탬프 테이블
    "STAMP_NO" NUMBER PRIMARY KEY, -- 스탬프NO
    "STAMP_COUNT" NUMBER NOT NULL, -- 스탬프 갯수
    "EVENT_NO"  NUMBER NOT NULL, -- 이벤트NO
    "MEMBER_NO" NUMBER NOT NULL -- 사용자NO
);

COMMENT ON TABLE STAMP IS '스탬프 테이블';
COMMENT ON COLUMN STAMP.STAMP_NO IS '스탬프 NO (기본키)';
COMMENT ON COLUMN STAMP.STAMP_COUNT IS '스탬프 갯수';
COMMENT ON COLUMN STAMP.EVENT_NO IS '스탬프 이벤트 NO (외래키)';
COMMENT ON COLUMN STAMP.MEMBER_NO IS '스탬프 사용자 NO (외래키)';
COMMIT;

CREATE TABLE "EVENT_PERSON" ( -- 이벤트 참여자 테이블
	"EVEVT_PERSON_NO" NUMBER PRIMARY KEY, --이벤트참여자NO
    "CERTIFICATION_STATUS" CHAR(1) DEFAULT 'N', --인증 여부
	"MEMBER_NO" NUMBER NOT NULL,-- MEMBERNO
	"EVENT_NO" NUMBER NOT NULL -- 아벤트NO
);

COMMENT ON TABLE EVENT_PERSON IS '이벤트 참여자 테이블';
COMMENT ON COLUMN EVENT_PERSON.EVEVT_PERSON_NO IS '이벤트 참여자 NO (기본키)';
COMMENT ON COLUMN EVENT_PERSON.CERTIFICATION_STATUS IS '이벤트 참여자 인증 여부';
COMMENT ON COLUMN EVENT_PERSON.MEMBER_NO IS '이벤트 참여자 사용자 NO (외래키)';
COMMENT ON COLUMN EVENT_PERSON.EVENT_NO IS '이벤트 참여자 이벤트NO (외래키)';

ALTER TABLE "EVENT_PERSON" 
ADD CONSTRAINT CERTIFICATION_STATUS_CHK CHECK(CERTIFICATION_STATUS IN ('Y','N'));
COMMIT;

CREATE TABLE "EVENT_CERTIFICATION"( -- 이벤트 인증 테이블
    "EVENT_CERTIFICATION_NO" NUMBER PRIMARY KEY, -- 이벤트 인증 NO
    "EVENT_CERTIFICATION_CONTENT" VARCHAR(50) NOT NULL, -- 이벤트 인증 내용
    "EVENT_CERTIFICATION_ATTACHMENT" VARCHAR2(200), -- 이벤트 인증 첨부파일
    "EVENT_PERSON_NO" NUMBER(50) NOT NULL -- 이벤트 참여자
);

COMMENT ON TABLE EVENT_CERTIFICATION IS '이벤트 인증 테이블';
COMMENT ON COLUMN EVENT_CERTIFICATION.EVENT_CERTIFICATION_NO IS '이벤트 인증 NO (기본키)';
COMMENT ON COLUMN EVENT_CERTIFICATION.EVENT_CERTIFICATION_CONTENT IS '이벤트 인증 내용';
COMMENT ON COLUMN EVENT_CERTIFICATION.EVENT_CERTIFICATION_ATTACHMENT IS '이벤트 인증 첨부파일';
COMMENT ON COLUMN EVENT_CERTIFICATION.EVENT_PERSON_NO IS '이벤트 인증 이벤트 참여자 NO (외래키)';

CREATE TABLE "EMAIL_CERTIFICATION" ( -- 이메일 인증 테이블
	"EMAIL" VARCHAR2(50) PRIMARY KEY, -- 이메일 주소
	"CERTIFICATION_NO" VARCHAR2(10) NOT NULL, -- 인증번호
	"ISSUE_DT" DATE NOT NULL DEFAULT SYSDATE -- 요청시간
);

COMMENT ON TABLE EMAIL_CERTIFICATION IS '이메일 인증 테이블';
COMMENT ON COLUMN EMAIL_CERTIFICATION.EMAIL IS '이메일 주소 (기본키)';
COMMENT ON COLUMN EMAIL_CERTIFICATION.CERTIFICATION_NO IS '이메일 인증번호';
COMMENT ON COLUMN EMAIL_CERTIFICATION.ISSUE_DT IS '이메일 요청시간';
COMMIT;

CREATE TABLE "CATEGORY" ( -- 대분류 테이블
	"CATEGORY_NO" NUMBER PRIMARY KEY, -- 대븐류 NO
	"CATEGORY_NAME" VARCHAR2(50) NOT NULL, -- 대분류 이름
);

COMMENT ON TABLE CATEGORY IS '대분류 테이블';
COMMENT ON COLUMN CATEGORY.CATEGORY_NO IS '대분류 NO (기본키)';
COMMENT ON COLUMN CATEGORY.CATEGORY_NAME IS '대분류 이름';
COMMIT;

CREATE TABLE "PARENT_CATEGORY" ( -- 중분류 테이블
	"PARENT_CATEGORY_NO" NUMBER PRIMARY KEY, -- 중분류 NO
	"PARENT_CATEGORY_NAME" VARCHAR2(50) NOT NULL, -- 중분류 이름
	"CATEGORY_NO" NUMBER NOT NULL -- 대분류 NO
);

COMMENT ON TABLE PARENT_CATEGORY IS '중분류 테이블';
COMMENT ON COLUMN PARENT_CATEGORY.PARENT_CATEGORY_NO IS '중분류 NO (기본키)';
COMMENT ON COLUMN PARENT_CATEGORY.PARENT_CATEGORY_NAME IS '중분류 이름';
COMMENT ON COLUMN PARENT_CATEGORY.SUB_CATEGORY_NO IS '대분류 NO (외래키)';
COMMIT;

CREATE TABLE "SUB_CATEGORY" ( -- 소분류 테이블
	"SUB_CATEGORY_NO" NUMBER PRIMARY KEY, -- 소분류 NO
	"SUB_CATEGORY_NAME" VARCHAR2(50) NOT NULL -- 소분류 이름
	"PARENT_CATEGORY_NO" NUMBER NOT NULL -- 중분류 NO
);

COMMENT ON TABLE SUB_CATEGORY IS '소분류 테이블';
COMMENT ON COLUMN SUB_CATEGORY.SUB_CATEGORY_NO IS '소분류 NO (기본키)';
COMMENT ON COLUMN SUB_CATEGORY.SUB_CATEGORY_NAME IS '소분류 이름';
COMMENT ON COLUMN SUB_CATEGORY.PARENT_CATEGORY_NO IS '중분류 NO (외래키)';
COMMIT;

CREATE TABLE "FAVORITES" (
	"FAVORITE_NO" NUMBER PRIMARY KEY, -- 즐겨찾기NO
	"FAVORITE_STATUS" CHAR(1) DEFAULT 'N', -- 즐겨찾기 여부
	"MEMBER_NO" NUMBER NOT NULL, -- MEMBERNO
	"DONATION_NO" NUMBER NOT NULL, -- 기부NO
	"VOLUNTEER_NO" NUMBER NOT NULL -- 봉사NO
);

COMMENT ON TABLE FAVORITES IS '즐겨찾기 테이블';
COMMENT ON COLUMN FAVORITES.FAVORITE_NO IS '즐겨찾기 NO (기본키)';
COMMENT ON COLUMN FAVORITES.FAVORITE_STATUS IS '즐겨찾기 여부';
COMMENT ON COLUMN FAVORITES.MEMBER_NO IS '즐겨찾기 사용자 NO (외래키)';
COMMENT ON COLUMN FAVORITES.DONATION_NO IS '즐겨찾기 기부 NO (외래키)';
COMMENT ON COLUMN FAVORITES.VOLUNTEER_NO IS '즐겨찾기 봉사 NO (외래키)';

ALTER TABLE "FAVORITES" 
ADD CONSTRAINT FAVORITE_STATUS_CHK CHECK(FAVORITE_STATUS IN ('Y','N'));

COMMIT;

CREATE TABLE "MYACTIVE" ( -- 나의 활동 테이블
	"MYACTIVE_NO" NUMBER PRIMARY KEY, -- 나의활동NO
	"DONATION_NO" NUMBER NOT NULL, -- 기부NO
	"VOLUNTEER_NO" NUMBER NOT NULL,-- 봉사NO
	"MEMBER_NO" NUMBER NOT NULL, -- MEMBERNO
	"EVENT_NO" NUMBER NOT NULL -- 이벤트NO
);

COMMENT ON TABLE MYACTIVE IS '나의 활동 테이블';
COMMENT ON COLUMN MYACTIVE.MYACTIVE_NO IS '나의 활동 NO (기본키)';
COMMENT ON COLUMN MYACTIVE.DONATION_NO IS '나의 활동 기부 NO (외래키)';
COMMENT ON COLUMN MYACTIVE.VOLUNTEER_NO IS '나의 활동 봉사 NO (외래키)';
COMMENT ON COLUMN MYACTIVE.MEMBER_NO IS '나의 활동 사용자 NO (외래키)';
COMMENT ON COLUMN MYACTIVE.EVENT_NO IS '나의 활동 이벤트 NO (외래키)';

ALTER TABLE "MYACTIVE" 
ADD CONSTRAINT VOLCOM_STATUS_CHK CHECK(VOLCOM_STATUS IN ('Y','N'));

COMMIT;

CREATE TABLE "POINT"( -- 적립금 테이블
    "POINT_NO" NUMBER PRIMARY KEY, --적립금NO
    "POINT_INCREASE" VARCHAR2(200) NOT NULL, -- 적립증감
    "POINT_INCREASE_DATE" DATE NOT NULL DEFAULT SYSDATE,  -- 적립증감일
    "POINT_CONTENT" VARCHAR2(1000) NOT NULL, -- 적립내용
    "MEMBER_NO" NUMBER NOT NULL, -- MEMBERNO
    "DONATION_NO" NUMBER NOT NULL, -- 기부NO
    "EVENT_NO" NUMBER NOT NULL -- 이벤트NO
);

COMMENT ON TABLE POINT IS '적립금 테이블';
COMMENT ON COLUMN POINT.POINT_NO IS '적립금 NO (기본키)';
COMMENT ON COLUMN POINT.POINT_INCREASE IS '적립금 증감액';
COMMENT ON COLUMN POINT.POINT_INCREASE_DATE IS '적립금 증감일';
COMMENT ON COLUMN POINT.POINT_CONTENT IS '적립금 증감 내용';
COMMENT ON COLUMN POINT.MEMBER_NO IS '적립금 사용자 NO (외래키)';
COMMENT ON COLUMN POINT.DONATION_NO IS '적립금 기부 NO (외래키)';
COMMENT ON COLUMN POINT.EVENT_NO IS '적립금 이벤트 NO (외래키)';
COMMIT;

CREATE TABLE "REVIEW" (
	"REVIEW_NO" NUMBER PRIMARY KEY, -- 리뷰NO
	"REVIEW_CONTENT" VARCHAR2(1000) NOT NULL, -- 리뷰 내용
	"ENROLL_DATE" DATE NOT NULL DEFAULT SYSDATE, -- 리뷰 작성일
	"SECESSION_FL" CHAR(1) NOT NULL DEFAULT 'N', -- 리뷰 삭제 여부
	"MEMBER_NO" NUMBER NOT NULL, -- MEMBERNO
	"DONATION_NO" NUMBER NOT NULL, -- 기부NO
	"VOLUNTEER_NO" NUMBER NOT NULL -- 봉사NO
);

COMMENT ON TABLE REVIEW IS '리뷰 테이블';
COMMENT ON COLUMN REVIEW.REVIEW_NO IS '리뷰 NO (기본키)';
COMMENT ON COLUMN REVIEW.REVIEW_CONTENT IS '리뷰 내용';
COMMENT ON COLUMN REVIEW.ENROLL_DATE IS '리뷰 작성일';
COMMENT ON COLUMN REVIEW.SECESSION_FL IS '리뷰 삭제 여부';
COMMENT ON COLUMN REVIEW.MEMBER_NO IS '리뷰 사용자 NO (외래키)';
COMMENT ON COLUMN REVIEW.DONATION_NO IS '리뷰 기부 NO (외래키)';
COMMENT ON COLUMN REVIEW.VOLUNTEER_NO IS '리뷰 봉사 NO (외래키)';

ALTER TABLE "REVIEW" 
ADD CONSTRAINT SECESSION_FL_CHK CHECK(REVIEW_STATUS IN ('Y','N'));

COMMIT;

CREATE TABLE "RATE" (
	"RATE_NO" NUMBER PRIMARY KEY, -- 등급NO
	"RATE_NAME" VARCHAR2(20) NOT NULL, -- 등급명
	"RENEWAL_DATE" DATE NOT NULL DEFAULT SYSDATE, -- 등급 갱신 날짜
	"MEMBER_NO" NUMBER NOT NULL, -- MEMBERNO
	"MYACTIVE_NO" NUMBER NOT NULL -- 나의 활동NO
);

COMMENT ON TABLE RATE IS '등급 테이블';
COMMENT ON COLUMN RATE.RATE_NO IS '등급 NO (기본키)';
COMMENT ON COLUMN RATE.RATE_NAME IS '등급명';
COMMENT ON COLUMN RATE.RENEWAL_DATE IS '등급 갱신 날짜';
COMMENT ON COLUMN RATE.MEMBER_NO IS '등급 사용자 NO (외래키)';
COMMENT ON COLUMN RATE.MYACTIVE_NO IS '등급 나의 활동 NO (외래키)';
COMMIT;

CREATE TABLE "ASK" (
	"ASK_NO" NUMBER PRIMARY KEY, -- 문의NO
	"ASK_TITLE" VARCHAR2(100) NOT NULL, -- 문의 제목
	"ASK_CONTENT" VARCHAR2(1000) NOT NULL,-- 문의 내용
	"ENROLL_DATE" DATE NOT NULL DEFAULT SYSDATE, -- 문의 등록일
	"ASk_STATUS" CHAR(1) NOT NULL DEFAULT 'N', -- 문의 삭제여부
	"ASK_ATTACHMENT" VARCHAR2(200), -- 문의 첨부파일
	"MEMBER_NO" NUMBER NOT NULL -- MEMBERNO
);

COMMENT ON TABLE ASK IS '문의 테이블';
COMMENT ON COLUMN ASK.ASK_NO IS '문의 NO (기본키)';
COMMENT ON COLUMN ASK.ASK_TITLE IS '문의 제목';
COMMENT ON COLUMN ASK.ASK_CONTENT IS '문의 내용';
COMMENT ON COLUMN ASK.ENROLL_DATE IS '문의 등록일';
COMMENT ON COLUMN ASK.ASk_STATUS IS '문의 삭제 여부';
COMMENT ON COLUMN ASK.ASK_ATTACHMENT IS '문의 첨부파일';
COMMENT ON COLUMN ASK.MEMBER_NO IS '문의 사용자 NO (외래키)';

ALTER TABLE "ASK" 
ADD CONSTRAINT ASk_STATUS_CHK CHECK(ASk_STATUS IN ('Y','N'));

COMMIT;

CREATE TABLE "ALARM" (
	"ALARM_NO" NUMBER PRIMARY KEY, -- 알람NO
	"ALARM_CONTENT"	VARCHAR2(2000) NOT NULL, -- 알람내용
	"ALARM_DATE" DATE NOT NULL DEFAULT SYSDATE, -- 알람날짜
	"READ_STATUS" CHAR(1) NOT NULL DEFAULT 'N', -- 읽음여부
	"MEMBER_NO" NUMBER NOT NULL, -- MEMBERNO
	"DONATION_NO" NUMBER NOT NULL, -- 기부NO
	"VOLUNTEER_NO" NUMBER NOT NULL, -- 봉사NO
	"REVIEW_NO" NUMBER NOT NULL, --리뷰NO
	"POINT_NO" NUMBER NOT NULL, --포인트NO
	"EVENT_NO" NUMBER NOT NULL, --이벤트NO
    "NOTICE_NO" NUMBER NOT NULL, --공지사항NO
	"ASK_NO" NUMBER NOT NULL -- 문의NO
);

COMMENT ON TABLE ALARM IS '알림 테이블';
COMMENT ON COLUMN ALARM.ALARM_NO IS '알림 NO (기본키)';
COMMENT ON COLUMN ALARM.ALARM_CONTENT IS '알림 내용';
COMMENT ON COLUMN ALARM.ALARM_DATE IS '알림 날짜';
COMMENT ON COLUMN ALARM.READ_STATUS IS '알림 읽음 여부';
COMMENT ON COLUMN ALARM.MEMBER_NO IS '알림 사용자 NO (외래키)';
COMMENT ON COLUMN ALARM.DONATION_NO IS '알림 기부 NO (외래키)';
COMMENT ON COLUMN ALARM.VOLUNTEER_NO IS '알림 봉사 NO (외래키)';
COMMENT ON COLUMN ALARM.REVIEW_NO IS '알림 리뷰 NO (외래키)';
COMMENT ON COLUMN ALARM.POINT_NO IS '알림 적립금 NO (외래키)';
COMMENT ON COLUMN ALARM.EVENT_NO IS '알림 이벤트 NO (외래키)';
COMMENT ON COLUMN ALARM.NOTICE_NO IS '알림 공지사항 NO (외래키)';
COMMENT ON COLUMN ALARM.ASK_NO IS '알림 문의 NO (외래키)';

ALTER TABLE "ALARM" 
ADD CONSTRAINT READ_STATUS_CHK CHECK(READ_STATUS IN ('Y','N'));

COMMIT;

CREATE TABLE "PAYMENT" ( -- 결제 테이블
	"PAYMENT_NO" NUMBER PRIMARY KEY, -- 결제NO
	"PAYMENT_TYPE" VARCHAR2(20) NOT NULL, -- 결제 수단
	"PAYMENT_DATE" DATE NOT NULL DEFAULT SYSDATE, -- 결제일
	"PAYMENT_PRICE" NUMBER NOT NULL, -- 결제금액
	"MEMBER_NO" NUMBER NOT NULL, -- 사용자NO
	"DONATION_NO" NUMBER NOT NULL -- 기부NO
);

COMMENT ON TABLE PAYMENT IS '결제 테이블';
COMMENT ON COLUMN PAYMENT.PAYMENT_NO IS '결제 NO (기본키)';
COMMENT ON COLUMN PAYMENT.PAYMENT_TYPE IS '결제 수단';
COMMENT ON COLUMN PAYMENT.PAYMENT_DATE IS '결제일';
COMMENT ON COLUMN PAYMENT.PAYMENT_PRICE IS '결제 금액';
COMMENT ON COLUMN PAYMENT.MEMBER_NO IS '결제 사용자 NO (외래키)';
COMMENT ON COLUMN PAYMENT.DONATION_NO IS '결제 기부 NO (외래키)';
COMMIT;

CREATE TABLE "MAP" (
	"MAP_NO" NUMBER PRIMARY KEY, -- 지도NO
	"DONATION_NO" NUMBER NOT NULL, -- 기부NO
	"CATEGORY_NO" NUMBER NOT NULL,-- 카테고리NO
	"VOLUNTEER_NO" NUMBER NOT NULL -- 봉사NO
);

COMMENT ON TABLE MAP IS '지도 테이블';
COMMENT ON COLUMN MAP.MAP_NO IS '지도 NO (기본키)';
COMMENT ON COLUMN MAP.DONATION_NO IS '지도 기부 NO (외래키)';
COMMENT ON COLUMN MAP.CATEGORY_NO IS '지도 카테고리 NO (외래키)';
COMMENT ON COLUMN MAP.VOLUNTEER_NO IS '지도 봉사 NO (외래키)';
COMMIT;

-- 시퀀스 생성
CREATE SEQUENCE SEQ_MEMBER_NO;
CREATE SEQUENCE SEQ_MGR_NO;
CREATE SEQUENCE SEQ_DONATION_NO;
CREATE SEQUENCE SEQ_VOLUNTEER_NO;
CREATE SEQUENCE SEQ_AGENCY_NO;
CREATE SEQUENCE SEQ_NOTICE_NO;
CREATE SEQUENCE SEQ_CS_NO;
CREATE SEQUENCE SEQ_FAQ_NO;
CREATE SEQUENCE SEQ_EVENT_NO;
CREATE SEQUENCE SEQ_STAMP_NO;
CREATE SEQUENCE SEQ_EVENT_PERSON_NO;
CREATE SEQUENCE SEQ_EVENT_CERTIFICATION_NO;
CREATE SEQUENCE SEQ_EMAIL_CERTIFICATION_NO;
CREATE SEQUENCE SEQ_CATEGORY_NO;
CREATE SEQUENCE SEQ_PARENT_CATEGORY_NO;
CREATE SEQUENCE SEQ_SUB_CATEGORY_NO;
CREATE SEQUENCE SEQ_FAVORITE_NO;
CREATE SEQUENCE SEQ_MYACTIVE_NO;
CREATE SEQUENCE SEQ_POINT_NO;
CREATE SEQUENCE SEQ_REVIEW_NO;
CREATE SEQUENCE SEQ_RATE_NO;
CREATE SEQUENCE SEQ_ASK_NO;
CREATE SEQUENCE SEQ_ALARM_NO;
CREATE SEQUENCE SEQ_PAYMENT_NO;
CREATE SEQUENCE SEQ_MAP_NO;

COMMIT;

-- 외래키 설정

-- 기부
ALTER TABLE DONATION
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

ALTER TABLE DONATION
ADD CONSTRAINT FK_CATEGORY_NO FOREIGN KEY(CATEGORY_NO) REFERENCES CATEGORY(CATEGORY_NO) ON DELETE CASCADE;

ALTER TABLE DONATION
ADD CONSTRAINT FK_AGENCY_NO FOREIGN KEY(AGENCY_NO) REFERENCES AGENCY(AGENCY_NO) ON DELETE CASCADE;

-- 봉사
ALTER TABLE VOLUNTEER
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

ALTER TABLE VOLUNTEER
ADD CONSTRAINT FK_CATEGORY_NO FOREIGN KEY(CATEGORY_NO) REFERENCES CATEGORY(CATEGORY_NO) ON DELETE CASCADE;

ALTER TABLE VOLUNTEER
ADD CONSTRAINT FK_AGENCY_NO FOREIGN KEY(AGENCY_NO) REFERENCES AGENCY(AGENCY_NO) ON DELETE CASCADE;

-- 기관
ALTER TABLE AGENCY
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

-- 공지사항
ALTER TABLE NOTICE
ADD CONSTRAINT FK_MGR_NO FOREIGN KEY(MGR_NO) REFERENCES MANAGER(MGR_NO) ON DELETE CASCADE;

-- 고객센터
ALTER TABLE CUSTOMER_SERVICE
ADD CONSTRAINT FK_MGR_NO FOREIGN KEY(MGR_NO) REFERENCES MANAGER(MGR_NO) ON DELETE CASCADE;

ALTER TABLE CUSTOMER_SERVICE
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

ALTER TABLE CUSTOMER_SERVICE
ADD CONSTRAINT FK_MGR_NO FOREIGN KEY(MGR_NO) REFERENCES MANAGER(MGR_NO) ON DELETE CASCADE;

-- 스탬프
ALTER TABLE STAMP
ADD CONSTRAINT FK_EVENT_NO FOREIGN KEY(EVENT_NO) REFERENCES EVENT(EVENT_NO) ON DELETE CASCADE;

ALTER TABLE STAMP
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

-- 이벤트 참여자
ALTER TABLE EVENT_PERSON
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

ALTER TABLE EVENT_PERSON
ADD CONSTRAINT FK_EVENT_NO FOREIGN KEY(EVENT_NO) REFERENCES EVENT(EVENT_NO) ON DELETE CASCADE;

-- 이벤트 인증
ALTER TABLE EVENT_CERTIFICATION
ADD CONSTRAINT FK_EVENT_PERSON_NO FOREIGN KEY(EVENT_PERSON_NO) REFERENCES EVENT_PERSON(EVENT_PERSON_NO) ON DELETE CASCADE;

-- 중분류
ALTER TABLE PARENT_CATEGORY
ADD CONSTRAINT FK_CATEGORY_NO FOREIGN KEY(CATEGORY_NO) REFERENCES CATEGORY(CATEGORY_NO) ON DELETE CASCADE;

-- 소분류
ALTER TABLE SUB_CATEGORY
ADD CONSTRAINT FK_PARENT_CATEGORY_NO FOREIGN KEY(PARENT_CATEGORY_NO) REFERENCES PARENT_CATEGORY(PARENT_CATEGORY_NO) ON DELETE CASCADE;

-- 즐겨 찾기
ALTER TABLE FAVORITES
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

ALTER TABLE FAVORITES
ADD CONSTRAINT FK_DONATION_NO FOREIGN KEY(DONATION_NO) REFERENCES DONATION(DONATION_NO) ON DELETE CASCADE;

ALTER TABLE FAVORITES
ADD CONSTRAINT FK_VOLUNTEER_NO FOREIGN KEY(VOLUNTEER_NO) REFERENCES VOLUNTEER(VOLUNTEER_NO) ON DELETE CASCADE;

-- 나의 활동
ALTER TABLE MYACTIVE
ADD CONSTRAINT FK_DONATION_NO FOREIGN KEY(DONATION_NO) REFERENCES DONATION(DONATION_NO) ON DELETE CASCADE;

ALTER TABLE MYACTIVE
ADD CONSTRAINT FK_VOLUNTEER_NO FOREIGN KEY(VOLUNTEER_NO) REFERENCES VOLUNTEER(VOLUNTEER_NO) ON DELETE CASCADE;

ALTER TABLE MYACTIVE
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

ALTER TABLE MYACTIVE
ADD CONSTRAINT FK_EVENT_NO FOREIGN KEY(EVENT_NO) REFERENCES EVENT(EVENT_NO) ON DELETE CASCADE;

-- 적립금
ALTER TABLE POINT
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

ALTER TABLE POINT
ADD CONSTRAINT FK_DONATION_NO FOREIGN KEY(DONATION_NO) REFERENCES DONATION(DONATION_NO) ON DELETE CASCADE;

ALTER TABLE POINT
ADD CONSTRAINT FK_EVENT_NO FOREIGN KEY(EVENT_NO) REFERENCES EVENT(EVENT_NO) ON DELETE CASCADE;

-- 리뷰
ALTER TABLE REVIEW
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

ALTER TABLE REVIEW
ADD CONSTRAINT FK_DONATION_NO FOREIGN KEY(DONATION_NO) REFERENCES DONATION(DONATION_NO) ON DELETE CASCADE;

ALTER TABLE REVIEW
ADD CONSTRAINT FK_VOLUNTEER_NO FOREIGN KEY(VOLUNTEER_NO) REFERENCES VOLUNTEER(VOLUNTEER_NO) ON DELETE CASCADE;

-- 등급
ALTER TABLE RATE
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

ALTER TABLE RATE
ADD CONSTRAINT FK_MYACTIVE_NO FOREIGN KEY(MYACTIVE_NO) REFERENCES MYACTIVE(MYACTIVE_NO) ON DELETE CASCADE;

-- 문의
ALTER TABLE ASK
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

-- 알림
ALTER TABLE ALARM
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

ALTER TABLE ALARM
ADD CONSTRAINT FK_DONATION_NO FOREIGN KEY(DONATION_NO) REFERENCES DONATION(DONATION_NO) ON DELETE CASCADE;

ALTER TABLE ALARM
ADD CONSTRAINT FK_VOLUNTEER_NO FOREIGN KEY(VOLUNTEER_NO) REFERENCES VOLUNTEER(VOLUNTEER_NO) ON DELETE CASCADE;

ALTER TABLE ALARM
ADD CONSTRAINT FK_REVIEW_NO FOREIGN KEY(REVIEW_NO) REFERENCES REVIEW(REVIEW_NO) ON DELETE CASCADE;

ALTER TABLE ALARM
ADD CONSTRAINT FK_POINT_NO FOREIGN KEY(POINT_NO) REFERENCES POINT(POINT_NO) ON DELETE CASCADE;

ALTER TABLE ALARM
ADD CONSTRAINT FK_EVENT_NO FOREIGN KEY(EVENT_NO) REFERENCES EVENT(EVENT_NO) ON DELETE CASCADE;

ALTER TABLE ALARM
ADD CONSTRAINT FK_NOTICE_NO FOREIGN KEY(NOTICE_NO) REFERENCES NOTICE(NOTICE_NO) ON DELETE CASCADE;

ALTER TABLE ALARM
ADD CONSTRAINT FK_ASK_NO FOREIGN KEY(ASK_NO) REFERENCES ASK(ASK_NO) ON DELETE CASCADE;

-- 결제
ALTER TABLE PAYMENT
ADD CONSTRAINT FK_MEMBER_NO FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE;

ALTER TABLE PAYMENT
ADD CONSTRAINT FK_DONATION_NO FOREIGN KEY(MEMBER_NO) REFERENCES DONATION(DONATION_NO) ON DELETE CASCADE;

-- 지도
ALTER TABLE MAP
ADD CONSTRAINT FK_DONATION_NO FOREIGN KEY(DONATION_NO) REFERENCES DONATION(DONATION_NO) ON DELETE CASCADE;

ALTER TABLE MAP
ADD CONSTRAINT FK_CATEGORY_NO FOREIGN KEY(CATEGORY_NO) REFERENCES CATEGORY(CATEGORY_NO) ON DELETE CASCADE;

ALTER TABLE MAP
ADD CONSTRAINT FK_VOLUNTEER_NO FOREIGN KEY(VOLUNTEER_NO) REFERENCES VOLUNTEER(VOLUNTEER_NO) ON DELETE CASCADE;

COMMIT;