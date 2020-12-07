WITH CTE_HighestEmployeeRating(EmployeeID, rating, Dranky)
AS (
    SELECT E.EmployeeID, RatingNumeric,
    Dense_Rank() OVER (ORDER BY SUM(R.RatingNumeric) desc) as DenseRank
    FROM tblEmployee E
    JOIN tblTeam_Employee TE on E.EmployeeID = TE.EmployeeID
    JOIN tblEmployee_Event EE on EE.TeamEmployeeID = TE.TeamEmployeeID
    JOIN tblReview RW on RW.EmployeeEventID = EE.EmployeeEventID
    JOIN tblRating R on R.RatingID = RW.RatingID
    JOIN tblRole RO on RO.RoleID = TE.RoleID
    where RO.RoleName like 'Manager'
    GROUP BY E.EmployeeID, R.RatingNumeric
),
yearIn90s(EmployeeID)
AS (
    SELECT E.EmployeeID
    FROM tblEmployee E
    JOIN tblTeam_Employee TE on E.EmployeeID = TE.EmployeeID
    JOIN tblEmployee_Event EE on EE.TeamEmployeeID = TE.TeamEmployeeID
    JOIN tblReview RW on RW.EmployeeEventID = EE.EmployeeEventID
    where RW.ReviewDate like '%199%'
)
SELECT *
FROM CTE_HighestEmployeeRating
WHERE DRanky = 1;

WITH CTE_MostPromotions(EmployeeID, countPromotions, Dranky)
AS (
    SELECT E.EmployeeID, COUNT(*) as countPromotions,
    Dense_Rank() OVER (ORDER BY COUNT(*) desc) as DenseRank
    FROM tblEmployee E
    JOIN tblTeam_Employee TE on E.EmployeeID = TE.EmployeeID
    JOIN tblEmployee_Event EE on EE.TeamEmployeeID = TE.TeamEmployeeID
    JOIN tblEvent EV on EV.EventID = EE.EventID
    JOIN tblEvent_Type ET on ET.EventTypeID = EV.EventTypeID
    where ET.EventTypeName like 'Promotion'
    GROUP BY E.EmployeeID
),
yearIn90s(EmployeeID)
AS (
    SELECT E.EmployeeID
    FROM tblEmployee E
    JOIN tblTeam_Employee TE on E.EmployeeID = TE.EmployeeID
    JOIN tblEmployee_Event EE on EE.TeamEmployeeID = TE.TeamEmployeeID
    JOIN tblEvent EV on EE.EventID = EV.EventID
    where EV.EventDate like '%199%'
)
SELECT *
FROM CTE_MostPromotions
WHERE DRanky = 1
