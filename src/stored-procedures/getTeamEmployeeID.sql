-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

CREATE PROCEDURE getTeamEmployeeID
    @S_Date DATE,
    @E_Date DATE,
    @T_Name_1 VARCHAR(50),
    @D_Name_2 VARCHAR(50),
    @O_Name_3 VARCHAR(50),
    @R_Name_1 VARCHAR(50),
    @E_FName_1 VARCHAR(50),
    @E_LName_1 VARCHAR(50),
    @E_DOB_1 DATE,
    @TeamEmployeeID INT OUTPUT
    AS
    DECLARE @T_ID_1 INT, @E_ID_1 INT, @R_ID_1 INT

    EXEC uspGetTeamID
      @T_Name = @T_Name_1,
      @D_Name_1 = @D_Name_2,
      @O_Name_2 = @O_Name_3,
      @T_ID = @T_ID_1 OUTPUT

    IF @T_ID_1 IS NULL
    BEGIN
      PRINT '@T_ID_1 (TeamID) IS NULL and that is a problem'
      RAISERROR ('@T_ID_1 (TeamID) cannot be NULL; check spelling because transaction is failing', 11,1)
      RETURN
    END

    EXEC uspGetEmployeeID
      @E_FName = @E_FName_1,
      @E_LName = @E_LName_1,
      @E_DOB = @E_DOB_1,
      @E_ID = @E_ID_1 OUTPUT

    IF @E_ID_1 IS NULL
    BEGIN
      PRINT '@E_ID_1 (EmployeeID) IS NULL and that is a problem'
      RAISERROR ('@E_ID_1 (EmployeeID) cannot be NULL; check spelling because transaction is failing', 11,1)
      RETURN
    END

    EXEC uspGetRoleID
      @R_Name = @R_Name_1,
      @R_ID = @R_ID_1 OUTPUT

    IF @R_ID_1 IS NULL
    BEGIN
      PRINT '@R_ID_1 (RoleID) IS NULL and that is a problem'
      RAISERROR ('@R_ID_1 (RoleID) cannot be NULL; check spelling because transaction is failing', 11,1)
      RETURN
    END

    BEGIN
        SET @TeamEmployeeID = (SELECT TeamEmployeeID from tblTeam_Employee where TeamID = @T_ID_1 and EmployeeID = @E_ID_1 and RoleID = @R_ID_1 and StartDate = @S_Date and EndDate = @E_Date)
    END
  GO
