-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

CREATE TABLE tblTeam
(TeamID INTEGER IDENTITY(1,1) PRIMARY KEY,
DepartmentID INTEGER NOT NULL,
TeamName VARCHAR(50) NOT NULL,
TeamDesc VARCHAR(200) NOT NULL);
GO

CREATE TABLE tblTeam_Employee
(TeamEmployeeID INTEGER IDENTITY(1,1) PRIMARY KEY,
TeamID INTEGER NOT NULL,
EmployeeID INTEGER NOT NULL,
RoleID INTEGER NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL);
GO

CREATE TABLE tblEmployee
(EmployeeID INTEGER IDENTITY(1,1) PRIMARY KEY,
FName VARCHAR(50) NOT NULL,
LName VARCHAR(50) NOT NULL,
DOB DATE NOT NULL);
GO

CREATE TABLE tblRole
(RoleID INTEGER IDENTITY(1,1) PRIMARY KEY,
RoleName VARCHAR(50) NOT NULL,
RoleDesc VARCHAR(200) NOT NULL);
GO

CREATE TABLE tblEvent_Type
(EventTypeID INTEGER IDENTITY(1,1) PRIMARY KEY,
EventTypeName VARCHAR(50) NOT NULL,
EventTypeDesc VARCHAR(200) NOT NULL);
GO

CREATE TABLE tblEvent
(EventID INTEGER IDENTITY(1,1) PRIMARY KEY,
EventTypeID INTEGER NOT NULL,
EventName VARCHAR(50) NOT NULL,
EventDesc VARCHAR(200) NOT NULL,
EventDate DATE NOT NULL);
GO

CREATE TABLE tblEmployee_Event
(EmployeeEventID INTEGER IDENTITY(1,1) PRIMARY KEY,
EventID INTEGER NOT NULL,
TeamEmployeeID INTEGER NOT NULL,
BeginDate DATE NOT NULL,
EndDate DATE NULL);
GO

CREATE TABLE tblReview
(ReviewID INTEGER IDENTITY(1,1) PRIMARY KEY,
EmployeeEventID INTEGER NOT NULL,
RatingID INTEGER NOT NULL,
ReviewDate DATE NOT NULL,
ReviewBody VARCHAR(500) NOT NULL);
GO

CREATE TABLE tblRating
(RatingID INTEGER IDENTITY(1,1) PRIMARY KEY,
RatingName VARCHAR(50) NOT NULL,
RatingNumeric INTEGER NOT NULL);
GO

CREATE TABLE tblDepartment
(DepartmentID INTEGER IDENTITY(1,1) PRIMARY KEY,
OrganizationID INT NOT NULL,
DepartmentName VARCHAR(50) NOT NULL,
DepartmentDesc VARCHAR(500) NOT NULL);
GO

CREATE TABLE tblOrganization
(OrganizationID INTEGER IDENTITY(1,1) PRIMARY KEY,
OrganizationName VARCHAR(50) NOT NULL,
OrganizationDesc VARCHAR(500) NOT NULL);
GO

-- Add foreign key constraints 

ALTER TABLE tblTeam
ADD CONSTRAINT FK_tblTeam_DepartmentID
FOREIGN KEY (DepartmentID)
REFERENCES tblDepartment (DepartmentID);
GO

ALTER TABLE tblTeam_Employee
ADD CONSTRAINT FK_tblTeam_Employee_TeamID
FOREIGN KEY (TeamID)
REFERENCES tblTeam (TeamID),
  CONSTRAINT FK_tblTeam_Employee_EmployeeID
FOREIGN KEY (EmployeeID)
REFERENCES tblEmployee (EmployeeID),
  CONSTRAINT FK_tblTeam_Employee_RoleID
FOREIGN KEY (RoleID)
REFERENCES tblRole (RoleID);
GO

ALTER TABLE tblEvent
ADD CONSTRAINT FK_tblEvent_EventTypeID
FOREIGN KEY (EventTypeID)
REFERENCES tblEvent_Type (EventTypeID);
GO

ALTER TABLE tblEmployee_Event
ADD CONSTRAINT FK_tblEmployeeEvent_EventID
FOREIGN KEY (EventID)
REFERENCES tblEvent (EventID),
  CONSTRAINT FK_tblEmployeeEvent_TeamEmployeeID
FOREIGN KEY (TeamEmployeeID)
REFERENCES tblTeam_Employee (TeamEmployeeID);
GO

ALTER TABLE tblReview
ADD CONSTRAINT FK_tblReview_EmployeeEventID
FOREIGN KEY (EmployeeEventID)
REFERENCES tblEmployee_Event (EmployeeEventID),
  CONSTRAINT FK_tblReview_RatingID
FOREIGN KEY (RatingID)
REFERENCES tblRating (RatingID);
GO

ALTER TABLE tblDepartment
ADD CONSTRAINT FK_tblDepartment_OrganizationID
FOREIGN KEY (OrganizationID)
REFERENCES tblOrganization(OrganizationID);
GO