-- @Author: Ranjith

CREATE FUNCTION ParentOrganizationForDept(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET VARCHAR(50) = (
    SELECT O.OrganizationName
    FROM tblOrganization O
        JOIN tblDepartment D ON D.OrganizationID = O.OrganizationID
        WHERE D.DepartmentID = @PK 
)
RETURN @RET
END
GO