-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

USE Master
GO

IF EXISTS(SELECT Name FROM SysDatabases WHERE Name = 'Proj_INFO_430_A7')
  BEGIN
  ALTER DATABASE [Proj_INFO_430_A7] SET Single_user WITH ROLLBACK Immediate;
  DROP DATABASE Proj_INFO_430_A7;
 END
GO

CREATE DATABASE Proj_INFO_430_A7
GO

USE Proj_INFO_430_A7
GO