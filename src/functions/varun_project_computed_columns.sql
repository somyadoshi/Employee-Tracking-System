CREATE FUNCTION CalcTotalNumberTransferLocation(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(*) AS NumPromotions
    FROM tblTeam_Employee TE
        JOIN tblEmployee_Event E ON TE.TeamEmployeeID = E.TeamEmployeeID
        JOIN tblEvent EV on E.EventID = EV.EventID
        JOIN tblEvent_Type ET on ET.EventTypeID = EV.EventTypeID
    WHERE TE.TeamEmployeeID = @PK and ET.EventTypeName like 'Transfer Location'
)
RETURN @RET
END

CREATE FUNCTION CalcTotalNumberPromotion(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(*) AS NumPromotions
    FROM tblTeam_Employee TE
        JOIN tblEmployee_Event E ON TE.TeamEmployeeID = E.TeamEmployeeID
        JOIN tblEvent EV on E.EventID = EV.EventID
        JOIN tblEvent_Type ET on ET.EventTypeID = EV.EventTypeID
    WHERE TE.TeamEmployeeID = @PK and ET.EventTypeName like 'Promotion'
)
RETURN @RET
END
