-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

CREATE PROCEDURE uspGetTeamID
  @T_Name VARCHAR(50),
  @D_Name_1 VARCHAR(50),
  @O_Name_2 VARCHAR(50),
  @T_ID INT OUTPUT
  AS
  DECLARE @D_ID_1 INT

  EXEC uspGetDepartmentID
    @D_Name = @D_Name_1,
    @O_Name_1 = @O_Name_2,
    @D_ID = @D_ID_1 OUTPUT

  IF @D_ID_1 IS NULL
  BEGIN
      PRINT '@D_ID_1 (DepartmentID) IS NULL and that is a problem'
      RAISERROR ('@D_ID_1 (DepartmentID) cannot be NULL; check spelling because transaction is failing', 11,1)
      RETURN
  END

  BEGIN
      SET @T_ID = (SELECT TeamID FROM tblTeam WHERE TeamName = @T_Name AND DepartmentID = @D_ID_1)
  END
GO
