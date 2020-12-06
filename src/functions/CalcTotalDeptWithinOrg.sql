-- @Author: Ranjith

CREATE FUNCTION CalcTotalDeptWithinOrg(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(*) AS TotalDepartments
    FROM tblDepartment D
        JOIN tblOrganization O ON D.OrganizationID = O.OrganizationID
        WHERE O.OrganizationID = @PK 
)
RETURN @RET
END
GO