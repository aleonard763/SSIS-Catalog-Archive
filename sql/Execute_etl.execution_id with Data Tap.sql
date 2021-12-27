Declare @execution_id bigint
EXEC [SSISDB].[catalog].[create_execution] @package_name=N'0-etl.execution_id.dtsx', @execution_id=@execution_id OUTPUT, @folder_name=N'Util', @project_name=N'Archive_SSISDB', @use32bitruntime=False, @reference_id=Null, @runinscaleout=False
Select @execution_id

DECLARE @var0 smallint = 3
EXEC [SSISDB].[catalog].[set_execution_parameter_value] @execution_id,  @object_type=50, @parameter_name=N'LOGGING_LEVEL', @parameter_value=@var0
DECLARE @var1 SMALLINT = 1
EXEC [SSISDB].[catalog].[set_execution_parameter_value] @execution_id,  @object_type=50, @parameter_name=N'SYNCHRONIZED', @parameter_value=@var1

EXEC [SSISDB].[catalog].[add_data_tap] @execution_id = @execution_id
	, @task_package_path = '\Package\DFT etl_execution_id'
	, @dataflow_path_id_string = 'Paths[LkUp New Rows Only.Lookup No Match Output]'
	, @data_filename = 'execution_id_rows.csv'
--	, @max_rows = 100000	

EXEC [SSISDB].[catalog].[start_execution] @execution_id
GO


