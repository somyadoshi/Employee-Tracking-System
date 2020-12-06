-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

CREATE PROCEDURE uspInsertNewTeamEmployee_Wrapper
@RUN INT
AS
DECLARE  @team_range INT = (SELECT COUNT(*) FROM tblTeam)
DECLARE @employee_range INT = (SELECT COUNT(*) FROM tblEmployee)
DECLARE @role_range INT = (SELECT COUNT(*) FROM tblRole)
DECLARE @dept_range INT = (SELECT COUNT(*) FROM tblDepartment)
DECLARE @org_range INT = (SELECT COUNT(*) FROM tblOrganization)

DECLARE @TeamPk INT, 
@EmpPK INT, 
@RolePk INT, 
@DeptPk INT,
@startDate DATE,
@endDate DATE,
@T_Name VARCHAR(50),
@D_Name VARCHAR(50),
@O_Name VARCHAR(50),
@R_Name VARCHAR(50),
@E_FName VARCHAR(50),
@E_LName VARCHAR(50),
@E_DOB DATE

WHILE @RUN > 0
BEGIN
	SET @TeamPk = (RAND() * @team_range + 1)
    SET @EmpPk = (RAND() * @employee_range + 1)
    SET @RolePk = (RAND() * @role_range + 1)
    SET @DeptPk = (RAND() * @dept_range + 1)
    SET @OrgPk = (RAND() * @org_range + 1)
    SET @startDate = (SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 3650), '2000-01-01'))
    SET @endDate = (SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 3650), @startDate))
    SET @T_Name = (SELECT TeamName FROM tblTeam WHERE TeamID = @TeamPk)
    SET @D_Name = (SELECT DepartmentName FROM tblDepartment WHERE DepartmentID = @DeptPk)
    SET @O_Name = (SELECT OrganizationName FROM tblOrganization WHERE OrganizationID = @OrgPk)
    SET @R_Name = (SELECT RoleName FROM tblRole WHERE RoleID = @RolePk)
    SET @E_FName = (SELECT FName FROM tblEmployee WHERE EmployeeID = @EmpPk)
    SET @E_LName = (SELECT LName FROM tblEmployee WHERE EmployeeID = @EmpPk)
    SET @E_DOB = (SELECT DOB FROM tblEmployee WHERE EmployeeID = @EmpPk)

EXEC uspGetTeam_Employee_ID
@S_Date = @startDate,
@E_Date = @endDate,
@T_Name_1 = @T_Name,
@D_Name_2 = @D_Name,
@O_Name_3 = @O_Name,
@R_Name_1 = @R_Name,
@E_FName_1 = @E_FName,
@E_LName_1 = @E_LName,
@E_DOB_1 = @E_DOB

SET @RUN = @RUN - 1
PRINT @RUN
END
GO

-- Test out synthetic tx
EXECUTE uspInsertNewTeamEmployee_Wrapper @RUN=100