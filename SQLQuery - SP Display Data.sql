USE [SQL_*******]
GO
/****** Object:  StoredProcedure [dbo].[SOADisplayWorkFile]    Script Date: 21/02/2023 12:45:27 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KMP>
-- Create date: <05/18/2022>
-- Description:	<Select Items>
-- =============================================
ALTER PROCEDURE [dbo].[SOADisplayWorkFile] 
	@UserPos nvarchar(100)=null, 
	@UserCountry nvarchar(150)=null 

As
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if (@UserPos = 'Subordinate')
		SELECT [ID],[SOARcvd],[SOADate],[DueDate],[InvDate],[SOAVendorCodeInvoice],[VendorCode]
      ,[SOAVendorName],[InvoiceNum],[CWNum],[Account],[Reference],[SOAAmount],[Currency],[Comments],[DisputeReason]
      ,[SOAOperators],[Branch],[InvoiceDateComparison],[SOAVendorCode],[SOAValidationAmount],[SOACrr],[SOARemarks],[SOACleared],[SOATerms]
      ,[SOACWDueDate],[SOACategories],[SOAUserPos],[SOAUser],[DBORecordStatus],[SOAUserCountry],[Entity],[AdditionalCategories],[RemarksNotification]
	FROM [SQL_MNLDB_DEV].[dbo].[SOAWorkingFile]
		where [SOAUserPos] = @UserPos and [DBORecordStatus] <> 'Delete' and [SOAUserCountry] = @UserCountry
 	else if	(@UserPos = 'Lead' or @UserPos = 'Admin')	
		SELECT [ID],[DateEntry],[SOARcvd],[SOADate],[DueDate],[InvDate],[SOAVendorCodeInvoice],[VendorCode]
      ,[SOAVendorName],[InvoiceNum],[CWNum],[Account],[Reference],[SOAAmount],[Currency],[Comments],[DisputeReason]
      ,[SOAOperators],[Branch],[InvoiceDateComparison],[SOAVendorCode],[SOAValidationAmount],[SOACrr],[SOARemarks],[SOACleared],[SOATerms]
      ,[SOACWDueDate],[SOACategories],[SOAUserPos],[SOAUser],[DBORecordStatus],[SOAUserCountry],[Entity],[AdditionalCategories],[RemarksNotification]
		FROM [SQL_MNLDB_DEV].[dbo].[SOAWorkingFile]

END