Use master

--Check if DB already exist, if yes then drop it and create a new one
IF EXISTS(SELECT name FROM sys.databases
WHERE name = 'CodeChallenge')
    DROP DATABASE CodeChallenge
GO


CREATE DATABASE CodeChallenge;
GO

USE CodeChallenge

--Create tables for project, user and relationship between tables
CREATE TABLE [Project](
	Id int NOT NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NOT NULL,
	Credits int NOT NULL,
	PRIMARY KEY (Id)
);

CREATE TABLE [User](
	Id int NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,	
	PRIMARY KEY (Id)
);


Create Table UserProject(
	UserId int NOT NULL REFERENCES [User](Id),
	ProjectId int NOT NULL REFERENCES [Project](Id),
	IsActive bit NOT NULL,
	AssignedDate Datetime NOT NULL	
);