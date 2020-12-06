-- @Author: Ranjith R.

CREATE FUNCTION CalcTotalEscalationAcrossTeam(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(*) AS TotalEscalations
    FROM tblTeam T
        JOIN tblTeam_Employee TE ON T.TeamID = TE.TeamID
        JOIN tblEmployee_Event E ON TE.TeamEmployeeID = E.TeamEmployeeID
        JOIN tblEvent EV ON E.EventID = EV.EventID
        JOIN tblEvent_Type ET ON ET.EventTypeID = EV.EventTypeID
        WHERE T.TeamID = @PK AND ET.EventTypeName LIKE 'Escalation'
)
RETURN @RET
END
GO