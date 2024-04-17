IF DB_ID('Hospital_2') IS NULL
BEGIN
  CREATE DATABASE HospitalSecond
END

USE Hospital_2

CREATE TABLE Departments (
  ID int NOT NULL PRIMARY KEY identity(1, 1),
  Building int NOT NULL CHECK (Building BETWEEN 1 AND 5),
  Financing money NOT NULL CHECK (Financing >= 0) DEFAULT 0,
  Floor int NOT NULL CHECK (Floor >= 1),
  Name nvarchar(100) NOT NULL CHECK (Name != ' '),
  CONSTRAINT UC_Departments UNIQUE (Name)
)


CREATE TABLE Diseases (
  ID int NOT NULL PRIMARY KEY identity(1, 1),
  Name nvarchar(100) NOT NULL CHECK (Name != ' '),
  Severity int NOT NULL CHECK (Severity >= 1) DEFAULT 1,
  CONSTRAINT UC_Diseases UNIQUE (Name)
)


CREATE TABLE Doctors (
  ID int NOT NULL PRIMARY KEY identity(1, 1),
  Name nvarchar(max) NOT NULL CHECK (Name != ' '),
  Phone char(10),
  Premium money NOT NULL CHECK (Premium >= 0) DEFAULT 0,
  Salary money NOT NULL CHECK (Salary > 0),
  Surname nvarchar(max) NOT NULL CHECK (Surname != ' ')
)

CREATE TABLE Examinations (
  ID int NOT NULL PRIMARY KEY identity(1, 1),
  DayOfWeek int NOT NULL CHECK (DayOfWeek BETWEEN 1 AND 7),
  EndTime time NOT NULL CHECK (EndTime > '08:00'),
  Name nvarchar(100) NOT NULL CHECK (Name != ' '),
  StartTime time NOT NULL CHECK (StartTime BETWEEN '08:00' AND '18:00'),
  CONSTRAINT UC_Examinations UNIQUE (Name)
)

CREATE TABLE Wards (
  ID int NOT NULL PRIMARY KEY identity(1, 1),
  Building int NOT NULL CHECK (Building BETWEEN 1 AND 5),
  Floor int NOT NULL CHECK (Floor >= 1),
  Name nvarchar(20) NOT NULL CHECK (Name != ' '),
  CONSTRAINT UC_Wards UNIQUE (Name)
)
