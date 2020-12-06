-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

CREATE PROCEDURE getRatingID
  @RatingName VARCHAR(50),
  @RatingNum NUMERIC(8, 2),
  @RatingID INT OUTPUT
  AS
  BEGIN
      SET @RatingID = (SELECT RatingID FROM tblRating WHERE RatingName = @RatingName AND RatingNumeric = @RatingNum)
  END
GO