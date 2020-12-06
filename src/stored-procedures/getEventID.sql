-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

CREATE PROCEDURE getEventID
  @Eventname VARCHAR(50),
  @Date DATE,
  @EventID INT OUTPUT
  AS
  BEGIN
      SET @EventID = (SELECT EventID FROM tblEVENT WHERE EventName = @Eventname AND EventDate = @Date)
  END
GO