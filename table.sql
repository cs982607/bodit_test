-- User Table Create SQL
CREATE TABLE User
(
    user_id      VARCHAR(20)      NOT NULL    COMMENT '회원ID', 
    birth_date   DATE             NOT NULL    COMMENT '생년월일', 
    height       DECIMAL(3, 1)    NOT NULL    COMMENT '키', 
    phone        VARCHAR(13)      NOT NULL    COMMENT '전화번호', 
    USE_YN       VARCHAR(1)       NOT NULL DEFAULT'Y' COMMENT '사용여부', 
    create_time  DATETIME         NOT NULL    COMMENT '가입일', 
    update_time  DATETIME         NOT NULL    COMMENT '수정일', 
    name         VARCHAR(20)      NOT NULL    COMMENT '이름', 
    PRIMARY KEY (user_id)
);

ALTER TABLE User COMMENT '회원정보 테이블';


-- MeasurementHistory Table Create SQL
CREATE TABLE MeasurementHistory
(
    ms_id        VARCHAR(20)      NOT NULL    COMMENT '측정 기록ID', 
    create_time  DATETIME         NOT NULL    COMMENT '측정 날짜', 
    weight       DECIMAL(3, 1)    NOT NULL    COMMENT '측정 몸무게', 
    user_id      VARCHAR(20)      NOT NULL    COMMENT '회원ID', 
    PRIMARY KEY (ms_id)
);

ALTER TABLE MeasurementHistory COMMENT '회원 측정 기록 테이블';

ALTER TABLE MeasurementHistory
    ADD CONSTRAINT FK_MeasurementHistory_user_id_User_user_id FOREIGN KEY (user_id)
        REFERENCES User (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- MeasurementCode Table Create SQL
CREATE TABLE MeasurementCode
(
    code_id    VARCHAR(20)    NOT NULL    COMMENT '측정코드ID', 
    ms_name    VARCHAR(50)    NOT NULL    COMMENT '종류', 
    min_value  INT            NOT NULL    COMMENT '최소 수치', 
    max_value  INT            NOT NULL    COMMENT '최대 수치', 
    USE_YN     VARCHAR(1)     NOT NULL DEFAULT'Y' COMMENT '사용여부', 
    PRIMARY KEY (code_id)
);

ALTER TABLE MeasurementCode COMMENT '측정 코드 테이블';


-- MeasurementData Table Create SQL
CREATE TABLE MeasurementData
(
    data_id  VARCHAR(20)    NOT NULL    COMMENT '측정 데이터ID', 
    code_id  VARCHAR(20)    NOT NULL    COMMENT '측정코드ID', 
    ms_id    VARCHAR(20)    NOT NULL    COMMENT '측정 기록ID', 
    USE_YN   VARCHAR(1)     NOT NULL DEFAULT'Y' COMMENT '사용여부', 
    PRIMARY KEY (data_id)
);

ALTER TABLE MeasurementData COMMENT '회원 측정 데이터 테이블';

ALTER TABLE MeasurementData
    ADD CONSTRAINT FK_MeasurementData_ms_id_MeasurementHistory_ms_id FOREIGN KEY (ms_id)
        REFERENCES MeasurementHistory (ms_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MeasurementData
    ADD CONSTRAINT FK_MeasurementData_code_id_MeasurementCode_code_id FOREIGN KEY (code_id)
        REFERENCES MeasurementCode (code_id) ON DELETE RESTRICT ON UPDATE RESTRICT;


