-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

CREATE PROCEDURE uspGetEmployeeID
  @E_FName VARCHAR(50),
  @E_LName VARCHAR(50),
  @E_DOB DATE,
  @E_ID INT OUTPUT
  AS
  BEGIN
      SET @E_ID = (SELECT EmployeeID FROM tblEmployee WHERE FName = @E_FName AND LName = @E_LName AND DOB = @E_DOB)
  END
GO