-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

CREATE PROCEDURE uspGetDepartmentID
  @D_Name VARCHAR(50),
  @O_Name_1 VARCHAR(50),
  @D_ID INT OUTPUT
  AS
  DECLARE @O_ID_1 INT

  EXEC uspGetOrganizationID
    @O_Name = @O_Name_1,
    @O_ID = @O_ID_1 OUTPUT

  IF @O_ID_1 IS NULL
  BEGIN
      PRINT '@O_ID_1 (OrganizationID) IS NULL and that is a problem'
      RAISERROR ('@O_ID_1 (OrganizationID) cannot be NULL; check spelling because transaction is failing', 11,1)
      RETURN
  END

  BEGIN
      SET @D_ID = (SELECT DepartmentID FROM tblDepartment WHERE DepartmentName = @D_Name AND OrganizationID = @O_ID_1)
  END
GO
