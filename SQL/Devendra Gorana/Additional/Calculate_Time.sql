ALTER FUNCTION dbo.Cal_Time (@StartTime Time(0), @EndTime Time(0))
RETURNS int
AS
BEGIN
DECLARE @TotalSecond int = DATEDIFF(second, @StartTime, @EndTime)
DECLARE @Second int = @TotalSecond % 60
DECLARE @TotalMinute int = (@TotalSecond - @Second)/60
DECLARE @Minute int = @TotalMinute % 60  
DECLARE @Hour int = (@TotalMinute - @Minute)/60
RETURN 'Total Time Diff : ' + CAST(@Hour AS varchar(50)) + ':' + CAST(@Minute AS varchar(50)) + ':' + CAST(@Second AS varchar(50));
END
GO

DECLARE @StartTime Time(0) = @StartTime = '07:50:51'
DECLARE @EndTime Time(0) = @EndTime = '12:41:21'
DECLARE TimeDiff Time(0) = dbo.Cal_Time (@StartTime, @EndTime)
SELECT TimeDiff

----------------------------------------------------------------------------------------------------
DECLARE @StartTime Time(0)
SET @StartTime = '07:50:51'
DECLARE @EndTime Time(0)
SET @EndTime = '12:41:21'
/*
DECLARE @HourTime int 
SET @HourTime = DATEDIFF(hour, @StartTime, @EndTime)
PRINT @HourTime
DECLARE @MinuteTime int
SET @MinuteTime = DATEDIFF(minute, @StartTime, @EndTime)
PRINT @MinuteTime */
DECLARE @TotalSecond int = DATEDIFF(second, @StartTime, @EndTime)
DECLARE @Second int = @TotalSecond % 60
DECLARE @TotalMinute int = (@TotalSecond - @Second)/60
DECLARE @Minute int = @TotalMinute % 60
DECLARE @Hour int = (@TotalMinute - @Minute)/60
PRINT 'Total Time Diff : ' + CAST(@Hour AS varchar(50)) + ':' + CAST(@Minute AS varchar(50)) + ':' + CAST(@Second AS varchar(50));
print @TotalSecond
PRINT @Second
print @TotalMinute
print @Minute
print @Hour
GO
-----------------------------------------------------------------------------------------------------








