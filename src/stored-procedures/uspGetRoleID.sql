-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--


CREATE PROCEDURE uspGetRoleID
  @R_Name VARCHAR(50),
  @R_ID INT OUTPUT
  AS
  BEGIN
      SET @R_ID = (SELECT RoleID FROM tblRole WHERE RoleName = @R_Name)
  END
GO
