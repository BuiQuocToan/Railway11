DROP DATABASE IF EXISTS Fresher;

CREATE DATABASE IF NOT EXISTS Fresher;

USE Fresher;

CREATE TABLE Trainee (
	
	TraineeID			SMALLINT AUTO_INCREMENT PRIMARY KEY,
    FullName				NVARCHAR(50),
    BrithDate				DATE,
    Gender				ENUM('Male', 'Female', 'Unknow'),
    ET_IQ					INT CHECK (0 <= ET_IQ <= 20),
    ET_Gmart			INT CHECK (0 <= ET_Gmart <= 20),
    ET_English			INT CHECK (0 <= ETIQ <= 50),
    TrainingClass		CHAR(50),
    EvalutionNotes	TEXT
);

ALTER TABLE Trainee
ADD VTIAccount 	CHAR(50) NOT NULL UNIQUE KEY;