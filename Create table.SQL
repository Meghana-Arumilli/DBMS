DROP DATABASE CRIME_MANAGEMENT;
DROP TABLE PETITIONER CASCADE ;
DROP TABLE ACCUSED CASCADE;
DROP TABLE CRIME CASCADE;
DROP TABLE EVIDENCE CASCADE;
DROP TABLE OFFICER CASCADE;
DROP TABLE VICTIM CASCADE;
DROP TABLE INVESTIGATION CASCADE;
DROP TABLE POSTMORTOM CASCADE;
DROP TABLE CHARGE_SHEET CASCADE;
DROP TABLE SECTION_OF_LAW CASCADE;
DROP TABLE OUTCOME CASCADE; 
DROP TABLE FIR CASCADE;
DROP TABLE COMPLAINT	;
CREATE DATABASE CRIME_MANAGEMENT;

\C CRIME_MANAGEMENT;
CREATE TABLE COMPLAINT (
				NAME VARCHAR(20),
				COMPLAINT_NO INT NOT NULL  ,
				TYPE VARCHAR(20),
				DESCRIPTION VARCHAR(100),
PRIMARY KEY (COMPLAINT_NO) );

CREATE TABLE PETITIONER (
				NAME VARCHAR(20),
				AGE INT,
				GENDER CHAR,
				ADDRESS VARCHAR(60),
				COMPLAINT_NO INT,
FOREIGN KEY (COMPLAINT_NO) REFERENCES COMPLAINT(COMPLAINT_NO));

CREATE TABLE ACCUSED (
				NAME VARCHAR(20),
				AGE INT,
				GENDER CHAR,
				ADDRESS VARCHAR(60),
COMPLAINT_NO INT,
FOREIGN KEY (COMPLAINT_NO) REFERENCES COMPLAINT(COMPLAINT_NO));

CREATE TABLE CRIME (
			COMPLAINT_NO INT NOT NULL,
			PLACE VARCHAR(60),
TIME TIME,
DATE DATE,
CASE_TYPE VARCHAR(20) ,
FOREIGN KEY(COMPLAINT_NO) REFERENCES COMPLAINT(COMPLAINT_NO));

CREATE TABLE FIR (
			FIR_NO INT NOT NULL ,
			TIME TIME,
			VICTIM_TYPE VARCHAR(20),
			DATE DATE,
COMPLAINT_NO INT NOT NULL,
PRIMARY KEY(FIR_NO),
	FOREIGN KEY (COMPLAINT_NO) REFERENCES COMPLAINT(COMPLAINT_NO));

CREATE TABLE INVESTIGATION (
			ID INT NOT NULL,
			COMPLAINT_NUMBER INT NOT NULL,
			DATE_OF_START DATE,
			DATE_OF_END DATE,
PLACE VARCHAR(60),
PRIMARY KEY(ID),
FOREIGN KEY (COMPLAINT_NUMBER) REFERENCES COMPLAINT(COMPLAINT_NO));

CREATE TABLE EVIDENCE (
ID INT NOT NULL  ,
			TYPE VARCHAR(20) DEFAULT 'NULL',
			DESCRIPTION VARCHAR(200) DEFAULT 'NULL',
PLACE VARCHAR(60) DEFAULT 'NULL',
FOREIGN KEY (ID) REFERENCES COMPLAINT(COMPLAINT_NO));

CREATE TABLE OFFICER (
				NAME VARCHAR(20),
				AGE INT,
				GENDER CHAR,
				SHIFT VARCHAR(10),
			    	COMPLAINT_NO INT  ,
				OFF_NO CHAR(10) ,
PRIMARY KEY (OFF_NO),
FOREIGN KEY (COMPLAINT_NO) REFERENCES COMPLAINT(COMPLAINT_NO));

CREATE TABLE VICTIM (
				NAME VARCHAR(20),
				AGE INT,
				GENDER CHAR,
				ADDRESS VARCHAR(60) DEFAULT 'NULL',
				COMPLAINT_NO INT NOT NULL,
FOREIGN KEY (COMPLAINT_NO) REFERENCES COMPLAINT(COMPLAINT_NO));

CREATE TABLE POSTMORTOM (
				FIR_NO INT NOT NULL ,
				ID VARCHAR(20) NOT NULL,
				GENDER CHAR(10),
				DOCT_NAME VARCHAR(20),
				COMPLAINT_NO INT,
				PRIMARY KEY(ID),
FOREIGN KEY (FIR_NO) REFERENCES FIR(FIR_NO),
FOREIGN KEY (COMPLAINT_NO) REFERENCES COMPLAINT(COMPLAINT_NO));

CREATE TABLE CHARGE_SHEET(
				FIR_NO INT NOT NULL,
				ACCUSED_NAME VARCHAR(20),
				TYPE VARCHAR(20),
				ID CHAR(10) NOT NULL,
				DESCRIPTION VARCHAR(20) DEFAULT 'NULL',
				WITNESS VARCHAR(20),
				COMPLAINT_NO INT ,
				PRIMARY KEY(FIR_NO),
FOREIGN KEY (COMPLAINT_NO) REFERENCES COMPLAINT(COMPLAINT_NO),
FOREIGN KEY (FIR_NO) REFERENCES FIR(FIR_NO) );

CREATE TABLE SECTION_OF_LAW(
				SENTENCE VARCHAR(10) DEFAULT 'NULL',
				SECTION VARCHAR(10) DEFAULT 'NULL' ,
				COMPLAINT_NO INT,
FOREIGN KEY (COMPLAINT_NO) REFERENCES COMPLAINT(COMPLAINT_NO));

CREATE TABLE OUTCOME(
				STATUS VARCHAR(20) DEFAULT 'NULL',
				COMPLAINT_NO INT,
FOREIGN KEY (COMPLAINT_NO) REFERENCES COMPLAINT(COMPLAINT_NO)  );									
