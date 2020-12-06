CREATE FUNCTION EmpEventBeginDateBeforeEndDate()
RETURNS INT
AS
BEGIN
DECLARE @RET = 0
IF EXISTS(
	SELECT *
	FROM tblEmployee_Event
	WHERE BeginDate > EndDate
)
BEGIN
SET @RET = 1
END
RETURN @RET
END

ALTER TABLE tblEmployee_Event
ADD CONSTRAINT CK_EMPLOYEE_EVENT_DATE
CHECK (dbo.EmpEventBeginDateBeforeEndDate() = 0)
GO

CREATE FUNCTION RatingNumericInRange()
RETURNS INT
AS
BEGIN
DECLARE @RET INT
IF EXISTS(
	SELECT *
	FROM tblRating
	WHERE RatingNumeric < 0 or RatingNumeric > 5
)
BEGIN
SET @RET = 1
END
RETURN @RET
END

ALTER TABLE tblRating
ADD CONSTRAINT CK_RatingNumericRange
CHECK (dbo.RatingNumericInRange() = 0)
GO
