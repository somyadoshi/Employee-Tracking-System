-- Name: Somya, Ranjith, Varun
-- Group #7
-- Date: 10/30/2020
-- INFO 430 Project 4

--***********************************************************************************************--

CREATE PROCEDURE insertEmployeeEvent
  @Ename VARCHAR(20),
  @EventDate Date,
  @BeginDate Date,
  @EndDate Date,
  @StartDate DATE,
  @EndWorkDate Date,
  @TeamName varchar(50),
  @DeptName varchar(50),
  @OrgName varchar(50),
  @RoleName varchar(50),
  @EFirstName varchar(50),
  @ELastName varchar(50),
  @EBirthDate DATE

  AS

  DECLARE @E_ID INT, @TE_ID INT

  EXEC [dbo].getEventID
      @Eventname = @Ename,
      @Date = @EventDate,
      @EventID = @E_ID OUTPUT

  IF @E_ID IS NULL
  BEGIN
      PRINT '@E_ID IS NULL and that is a problem'

      RAISERROR ('@E_ID cannot be NULL; check spelling because transaction is failing', 11,1)
      RETURN
  END

  EXEC [dbo].getTeamEmployeeID
    @S_Date = @StartDate,
    @E_Date = @EndWorkDate,
    @T_Name_1 = @TeamName,
    @D_Name_2 = @DeptName,
    @O_Name_3 = @OrgName,
    @R_Name_1 = @RoleName,
    @E_FName_1 = @EFirstName,
    @E_LName_1 = @ELastName,
    @E_DOB_1 = @EBirthDate,
    @TeamEmployeeID = @TE_ID OUTPUT

  IF @TE_ID IS NULL
  BEGIN
      PRINT '@TE_ID IS NULL and that is a problem'
      RAISERROR ('TE_ID cannot be NULL; check spelling because transaction is failing', 11,1)
      RETURN
  END

  BEGIN TRANSACTION T
      INSERT INTO tblEmployee_Event (EventID, TeamEmployeeID, BeginDate, EndDate)
      VALUES (@E_ID, @TE_ID, @BeginDate, @EndDate)
  IF @@ERROR <> 0
      ROLLBACK TRANSACTION T
  ELSE
      COMMIT TRANSACTION T
GO
