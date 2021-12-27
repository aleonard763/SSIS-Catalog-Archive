declare @FolderName nvarchar(130) = N'Util'
declare @ProjectName nvarchar(130) = N'Archive_SSISDB'
declare @PackageName nvarchar(260) = N'_SSISDBArchive_Controller.dtsx'
declare @Logging_Level smallint = 1
declare @execution_id bigint

EXEC [SSISDB].[catalog].[create_execution] 
   @folder_name = @FolderName
 , @project_name = @ProjectName
 , @use32bitruntime = False
 , @reference_id = Null
 , @runinscaleout = False
 , @package_name = @PackageName
 , @execution_id = @execution_id OUTPUT

Select @execution_id

Exec [SSISDB].[catalog].[set_execution_parameter_value]
   @execution_id
 , @object_type=50
 , @parameter_name=N'LOGGING_LEVEL'
 , @parameter_value = @Logging_Level

Exec [SSISDB].[catalog].[start_execution]
 @execution_id
GO


