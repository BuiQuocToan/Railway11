DROP DATABASE IF EXISTS QuanLyBaiThi;

CREATE DATABASE IF NOT EXISTS QuanLyBaiThi;

USE QuanLyBaiThi;

CREATE TABLE Department (
	DepartmentID 				SMALLINT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 		NVARCHAR(100) NOT NULL UNIQUE KEY
);

CREATE TABLE `Position`(
	PositionID 					TINYINT AUTO_INCREMENT PRIMARY KEY,
    PositionName 				ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);

CREATE TABLE `Account`(
	AccountID 					SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Email 							VARCHAR(100) NOT NULL UNIQUE KEY,
    Username 					VARCHAR(100) NOT NULL UNIQUE KEY,
    Fullname 					VARCHAR(100) NOT NULL UNIQUE KEY,
    DepartmentID 				SMALLINT ,
    PositionID 					TINYINT NOT NULL,
    CreatDate 					DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position` (PositionID)
);

CREATE TABLE `Group` (
	GroupID 						TINYINT AUTO_INCREMENT PRIMARY KEY,
    GroupName 				VARCHAR(100) NOT NULL UNIQUE KEY,
    CreatorID 					SMALLINT NOT NULL,
    CreateDate 					DATE,
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);

CREATE TABLE GroupAccount (
	GroupID 						TINYINT NOT NULL,
    AccountID 					SMALLINT NOT NULL,
    JointDate 					DATE,
    PRIMARY KEY(GroupID, AccountID),
    FOREIGN KEY (GroupID) REFERENCES `Group` (GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account` (AccountID)
);

CREATE TABLE TypeQuestion (
	TypeID 						TINYINT AUTO_INCREMENT PRIMARY KEY,
    TypeName 					ENUM ('Esaay', 'Multiple Choice')
);

CREATE TABLE CategoryQuestion (
	CategoryID 					TINYINT AUTO_INCREMENT PRIMARY KEY,
    CategoryName 			NVARCHAR(100)
);

CREATE TABLE Question (
	QuestionID 					SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Content 						TEXT,
    CategoryID 					TINYINT ,
    TypeID 						TINYINT ,
    CreatorID 					SMALLINT ,
    CreatDate 					DATE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID),
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);

CREATE TABLE Answer (
	AnswerID 					SMALLINT AUTO_INCREMENT PRIMARY KEY,
    Content 						TEXT,
    QuestionID 					SMALLINT ,
    isCorrect 						BOOLEAN,
	FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);

CREATE TABLE Exam (
	ExamID 						SMALLINT AUTO_INCREMENT PRIMARY KEY,
    `Code` 						CHAR(50) NOT NULL,
    Title 							NVARCHAR(100) NOT NULL,
    CategoryID 					TINYINT ,
    Duration 						TINYINT UNIQUE NOT NULL,
    CreatorID 					SMALLINT ,
    CreaterDate 				DATE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);

CREATE TABLE ExamQuestion (
	ExamID 						SMALLINT  NOT NULL,
    QuestionID 					SMALLINT  NOT NULL,
    PRIMARY KEY(ExamID, QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam (ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);