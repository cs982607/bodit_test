
-- User Table Create SQL
CREATE TABLE User
(
	user_id       INT         NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '회원ID',
    birth_date    DATE        NOT NULL    COMMENT '생년월일', 
    height        INT         NOT NULL    COMMENT '키', 
    phone         INT         NOT NULL    COMMENT '전화번호', 
    use_YN        TINYINT     NOT NULL    COMMENT '사용여부', 
    create_time   DATETIME    NOT NULL    COMMENT '가입일', 
    update_time   DATETIME    NOT NULL    COMMENT '수정일' 
);

ALTER TABLE User COMMENT '회원정보 테이블';


-- MeasurementHistory Table Create SQL
CREATE TABLE MeasurementHistory
(
    history_id   INT         NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '측정 기록ID', 
    create_time  DATETIME    NOT NULL    COMMENT '측정 날짜', 
    weight       INT         NOT NULL    COMMENT '측정 몸무게', 
    user_id      INT         NOT NULL    COMMENT '회원ID',
	FOREIGN KEY (user_id)
    REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE MeasurementHistory COMMENT '회원 측정 기록 테이블';


-- MeasurementData Table Create SQL
CREATE TABLE MeasurementData
(
    data_id     INT            NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '측정 데이터ID', 
    type        VARCHAR(20)    NOT NULL    COMMENT '종류', 
    value       INT            NOT NULL    COMMENT '수치', 
    history_id  INT            NOT NULL    COMMENT '측정 기록ID', 
    use_YN      TINYINT        NOT NULL    COMMENT '사용여부', 
	FOREIGN KEY (history_id)
    REFERENCES MeasurementHistory(history_id) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE MeasurementData COMMENT '회원 측정 데이터 테이블';

