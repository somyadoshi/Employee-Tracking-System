-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

CREATE PROCEDURE uspGetOrganizationID
  @O_Name VARCHAR(50),
  @O_ID INT OUTPUT
  AS
  BEGIN
      SET @O_ID = (SELECT OrganizationID FROM tblOrganization WHERE OrganizationName = @O_Name)
  END
GO