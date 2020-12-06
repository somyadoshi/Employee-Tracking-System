-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

CREATE PROCEDURE getEventTypeID
  @EventTypeName VARCHAR(50),
  @EventTypeID INT OUTPUT
  AS
  BEGIN
      SET @EventTypeID = (SELECT EventTypeID FROM tblEvent_Type WHERE EventTypeName = @EventTypeName)
  END
GO