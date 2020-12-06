-- @Author: Ranjith R.

CREATE FUNCTION CalcTotalEscalationPerEmployee(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(*) AS NumEscalations
    FROM tblTeam_Employee TE
        JOIN tblEmployee_Event E ON TE.TeamEmployeeID = E.TeamEmployeeID
        JOIN tblEvent EV on E.EventID = EV.EventID
        JOIN tblEvent_Type ET on ET.EventTypeID = EV.EventTypeID
    WHERE TE.TeamEmployeeID = @PK and ET.EventTypeName LIKE 'Escalation'
)
RETURN @RET
END
GO
