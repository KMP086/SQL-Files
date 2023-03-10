USE [SQL_**********]
GO
/****** Object:  StoredProcedure [dbo].[SOAUserIdentify]    Script Date: 21/02/2023 12:52:38 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KMP>
-- Create date: <05/23/2022>
-- Description:	<User Identification>
-- =============================================
ALTER PROCEDURE [dbo].[SOAUserIdentify] 
	-- Add the parameters for the stored procedure here
	@SOAUser Varchar(100)=null 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    -- Insert statements for procedure here
	select [SOAUserPos], [SOAUserLead], [SOAUserCountry] from [SQL_MNLDB_DEV].[dbo].[SOAUsers]
	where [SOAUser] = @SOAUser



END
