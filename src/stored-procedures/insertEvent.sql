CREATE PROCEDURE insertEvent
    @EName varchar(40),
    @ETypeName varchar(40),
    @EDesc varchar(100),
    @EDate DATE

    AS

    DECLARE @ET_ID INT

    EXEC dbo.getEventTypeID
      @EventTypeName = @ETypeName,
      @EventTypeID = @ET_ID OUTPUT

      IF @ET_ID IS NULL
      BEGIN
          PRINT '@ET_ID IS NULL and that is a problem'
          RAISERROR ('ET_ID cannot be NULL; check spelling because transaction is failing', 11,1)
          RETURN
      END

      BEGIN TRANSACTION T
          INSERT INTO tblEvent (EventTypeID, EventName, EventDesc, EventDate)
          VALUES (@ET_ID, @EName, @EDesc, @EDate)
      IF @@ERROR <> 0
          ROLLBACK TRANSACTION T
      ELSE
          COMMIT TRANSACTION T
GO
