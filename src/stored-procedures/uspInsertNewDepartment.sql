-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

CREATE PROCEDURE uspInsertNewDepartment
@OrgName varchar(50),
@DepartmentName varchar(50),
@DepartmentDesc varchar(500)
AS
DECLARE @O_ID INT

EXEC uspGetOrganizationID
@O_Name = @OrgName,
@O_ID = @O_ID OUTPUT

 IF @O_ID IS NULL
    BEGIN
        PRINT '@O_ID IS NULL and that is a problem'
        RAISERROR ('@O_ID cannot be NULL; Ensure you have entered the correct organization name', 11,1)
        RETURN
    END

    BEGIN TRANSACTION T1
        INSERT INTO tblDepartment(OrganizationID, DepartmentName, DepartmentDesc)
        VALUES (@O_ID, @DepartmentName, @DepartmentDesc)
    IF @@ERROR <> 0
        ROLLBACK TRANSACTION T1
    ELSE
        COMMIT TRANSACTION T1
GO