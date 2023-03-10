USE [SQL_*******]
GO
/****** Object:  StoredProcedure [dbo].[SOAUpdateWorkFile]    Script Date: 21/02/2023 12:51:06 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<KMP>
-- Create date: <05/21/2022>
-- Description:	<Update>
-- =============================================
ALTER PROCEDURE [dbo].[SOAUpdateWorkFile] 
	-- Add the parameters for the stored procedure here

	@ID nvarchar(100)=null,	
	@SOARcvd nvarchar(50)=null,
	@SOADate nvarchar(50)=null,
	@DueDate nvarchar(50)=null,
	@InvDate nvarchar(50)=null,
	@SOAVendorCodeInvoice nvarchar(200)=null,
	@VendorCode	nvarchar(100)=null,
	@SOAVendorName	nvarchar(100)=null,
	@InvoiceNum	nvarchar(100)=null,
	@CWNum	nvarchar(100)=null,
	@Account nvarchar(100)=null,
	@Reference nvarchar(100)=null,
	@SOAAmount nvarchar(100)=null,
	@Currency char(10)=null,
	@Comments nvarchar(800)=null,
	@DisputeReason nvarchar(800)=null,
	@SOAOperators	nvarchar(100)=null,
	@SOAVendorCode	nvarchar(100)=null,
	@SOAValidationAmount nvarchar(100)=null,
	@SOACrr	char(10)=null,
	@SOARemarks	nvarchar(800)=null,
	@SOACleared	nvarchar(100)=null,
	@SOATerms	nvarchar(100)=null,
	@SOACWDueDate	nvarchar(50)=null,
	@SOACategories	nvarchar(100)=null,
	@SOAUserLead	nvarchar(100)=null,
	@SOAUserPos	nvarchar(100)=null,
	@SOAUser	nvarchar(100)=null,
	@DBORecordStatus nvarchar(200)=null,
	@InvoiceDateComparison nvarchar(100)=null,
	@SOAUserCountry nvarchar(150)=null,
	@Branch nvarchar(50)=null,
	@Entity nvarchar(50)=null,
	@AddCategory nvarchar(1000),
	@RemarksNotify nvarchar(Max)


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
if (@SOAUserPos = 'Subordinate')
	Update SQL_MNLDB_DEV.dbo.SOAWorkingFile
	set
		[SOARcvd]=@SOARcvd,
		[SOADate]=@SOADate,
		[DueDate]=@DueDate,
		[InvDate]=@InvDate,
		[SOAVendorCodeInvoice]=@SOAVendorCodeInvoice,
		[VendorCode]=@VendorCode,
		[SOAVendorName]=@SOAVendorName,
		[InvoiceNum]=@InvoiceNum,
		[CWNum]=@CWNum,
		[Account]=@Account,
		[Reference]=@Reference,
		[SOAAmount]=@SOAAmount,
		[Currency]=@Currency,
		[Comments]=@Comments,
		[DisputeReason]=@DisputeReason,
		[SOAOperators]=@SOAOperators,
		[SOAVendorCode]=@SOAVendorCode,
		[SOAValidationAmount]=@SOAValidationAmount,
		[SOACrr]=@SOACrr,
		[SOARemarks]=@SOARemarks,
		[SOACleared]=@SOACleared,
		[SOATerms]=@SOATerms,
		[SOACWDueDate]=@SOACWDueDate,
		[SOACategories]=@SOACategories,
		[SOAUserLead]=@SOAUserLead,
		[SOAUserPos]=@SOAUserPos,
		[SOAUser]=@SOAUser,
		[DBORecordStatus]=@DBORecordStatus,
		[InvoiceDateComparison]=@InvoiceDateComparison,
		[SOAUserCountry]=@SOAUserCountry,
		[Branch]=@Branch,
		[Entity]=@Entity,
		[AdditionalCategories]=@AddCategory,
		[RemarksNotification]=@RemarksNotify
	where
		[ID]=Convert(INT,@ID) and [SOAUser]=@SOAUser
else if(@SOAUserPos = 'Lead')
	Update SQL_MNLDB_DEV.dbo.SOAWorkingFile
	set
		[SOARcvd]=@SOARcvd,
		[SOADate]=@SOADate,
		[DueDate]=@DueDate,
		[InvDate]=@InvDate,
		[SOAVendorCodeInvoice]=@SOAVendorCodeInvoice,
		[VendorCode]=@VendorCode,
		[SOAVendorName]=@SOAVendorName,
		[InvoiceNum]=@InvoiceNum,
		[CWNum]=@CWNum,
		[Account]=@Account,
		[Reference]=@Reference,
		[SOAAmount]=@SOAAmount,
		[Currency]=@Currency,
		[Comments]=@Comments,
		[DisputeReason]=@DisputeReason,
		[SOAOperators]=@SOAOperators,
		[SOAVendorCode]=@SOAVendorCode,
		[SOAValidationAmount]=@SOAValidationAmount,
		[SOACrr]=@SOACrr,
		[SOARemarks]=@SOARemarks,
		[SOACleared]=@SOACleared,
		[SOATerms]=@SOATerms,
		[SOACWDueDate]=@SOACWDueDate,
		[SOACategories]=@SOACategories,
		[SOAUserLead]=@SOAUserLead,
		[SOAUserPos]=@SOAUserPos,
		[SOAUser]=@SOAUser,
		[DBORecordStatus]=@DBORecordStatus,
		[InvoiceDateComparison]=@InvoiceDateComparison,
		[SOAUserCountry]=@SOAUserCountry,
		[Branch]=@Branch,
		[Entity]=@Entity,
		[AdditionalCategories]=@AddCategory,
		[RemarksNotification]=@RemarksNotify
	where
		[ID]=Convert(INT,@ID)
	
	--backup database
	insert into SQL_MNLDB_DEV.dbo.SOAWorkingBackupFile(
	SOARcvd,
	SOADate,
	DueDate,
	InvDate,
	SOAVendorCodeInvoice,
	VendorCode,
	SOAVendorName,
	InvoiceNum,
	CWNum,
	Account,
	Reference,
	SOAAmount,
	Currency,
	Comments,
	DisputeReason,
	SOAOperators,
	SOAVendorCode,
	SOAValidationAmount,
	SOACrr,
	SOARemarks,
	SOACleared,
	SOATerms,
	SOACWDueDate,
	SOACategories,
	SOAUserLead,
	SOAUserPos,
	SOAUser,
	DBORecordStatus,
	InvoiceDateComparison,
	SOAUserCountry,
	Branch,
	Entity,
	AdditionalCategories,
	RemarksNotification
	)
	values(
	@SOARcvd,
	@SOADate,
	@DueDate,
	@InvDate,
	@SOAVendorCodeInvoice,
	@VendorCode,
	@SOAVendorName,
	@InvoiceNum,
	@CWNum,
	@Account,
	@Reference,
	@SOAAmount,
	@Currency,
	@Comments,
	@DisputeReason,
	@SOAOperators,
	@SOAVendorCode,
	@SOAValidationAmount,
	@SOACrr,
	@SOARemarks,
	@SOACleared,
	@SOATerms,
	@SOACWDueDate,
	@SOACategories,
	@SOAUserLead,
	@SOAUserPos,
	@SOAUser,
	@DBORecordStatus,
	@InvoiceDateComparison,
	@SOAUserCountry,
	@Branch,
	@Entity,
	@AddCategory,
	@RemarksNotify
	)

END
