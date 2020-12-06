CREATE PROCEDURE WRAPPER_insertEmployeeEvent
    @Run INT
    AS

    DECLARE @EvName varchar(50), @EvDate Date, @BDate Date, @EndDate Date, @SDate Date, @EWDate Date, @TName varchar(50), @DName varchar(50), @OName varchar(50), @RName varchar(50), @FN varchar(50), @LN varchar(50), @BD DATE

    DECLARE @EventCount INT = (SELECT count(*) from tblEVENT)
    DECLARE @EmployeeCount INT = (SELECT count(*) from tblEmployee)
    DECLARE @TECount INT = (SELECT count(*) from tblTeam_Employee)
    DECLARE @TCount INT = (SELECT count(*) from tblTeam)
    DECLARE @DCount INT = (SELECT count(*) from tblDepartment)
    DECLARE @OCount INT = (SELECT count(*) from tblOrganization)
    DECLARE @RCount INT = (SELECT count(*) from tblRole)

    DECLARE @EventPK INT
    DECLARE @EmployeePK INT
    DECLARE @TEPK INT
    DECLARE @TeamPK INT
    DECLARE @DeptPK INT
    DECLARE @OrgPK INT
    DECLARE @RolePK INT

    DECLARE @RAND INT

    WHILE @Run > 0
    BEGIN
        SET @EmployeePK = (SELECT RAND() * @EmployeeCount + 1)
        SET @EventPK = (SELECT RAND() * @EventCount + 1)
        SET @TEPK = (SELECT RAND() * @TECount + 1)
        SET @TeamPK = (SELECT RAND() * @TCount + 1)
        SET @DeptPK = (SELECT RAND() * @DCount + 1)
        SET @OrgPK = (SELECT RAND() * @OCount + 1)
        SET @RolePK = (SELECT RAND() * @RCount + 1)

        SET @EvName = (SELECT EventName from tblEVENT where EventID = @EventPK)
        SET @EvDate = (SELECT EventDate from tblEvent where EventID = @EventPK)
        SET @BDate = (SELECT GetDate() - @RAND)
        SET @EndDate = (SELECT GetDate() + @RAND)
        SET @SDate = (SELECT StartDate from tblTeam_Employee where TeamEmployeeID = @TEPK)
        SET @EWDate = (SELECT EndDate from tblTeam_Employee where TeamEmployeeID = @TEPK)
        SET @TName = (SELECT TeamName from tblTeam where TeamID = @TeamPK)
        SET @DName = (SELECT DepartmentName from tblDepartment where DepartmentID = @DeptPK)
        SET @OName = (SELECT OrganizationName from tblOrganization where OrganizationID = @OrgPK)
        SET @RName = (SELECT RoleName from tblRole where RoleID = @RolePK)
        SET @FN = (SELECT FName from tblEmployee where EmployeeID = @EmployeePK)
        SET @LN = (SELECT LName from tblEmployee where EmployeeID = @EmployeePK)
        SET @BD = (SELECT DOB from tblEmployee where EmployeeID = @EmployeePK)

        EXEC insertEmployeeEvent
            @Ename = @EvName,
            @EventDate = @EvDate,
            @BeginDate = @BDate,
            @EndDate = @EndDate,
            @StartDate = @SDate,
            @EndWorkDate = @EWDate,
            @TeamName = @TName,
            @DeptName = @DName,
            @OrgName = @OName,
            @RoleName = @RName,
            @EFirstName = @FN,
            @ELastName = @LN,
            @EBirthDate = @BD

        SET @Run = @Run -1
    END
GO