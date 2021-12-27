/*

  Script: Create SSISDBArchive Database.sql
  Andy Leonard
  23 Dec 2021

*/

/* Reset NoExec in case it is on */
Set NoExec OFF

Use [master]
go

print 'SSISDBArchive database'
If Not Exists(Select [name]
              From [sys].[databases]
			  Where [name] = N'SSISDBArchive')
 begin
  print ' - Creating SSISDBArchive database'
  Create Database SSISDBArchive
  print ' - SSISDBArchive database created'
 end
Else
 begin
  print ' - SSISDBArchive database already exists.'
 end
print ''
go

Use SSISDBArchive
go

If(db_Name() <> 'SSISDBArchive')
 begin
  print 'NOT Executing in SSISDBArchive. Setting NoExec ON'
  Set NoExec ON
 end
Else
 begin
  print 'Executing in SSISDBArchive. (Carrying on)'
 end
print ''

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

print 'etl Schema'
If Not Exists(Select [name]
              From [sys].[schemas]
			  Where [name] = N'etl')
 begin
  print ' - Creating etl Schema'
  declare @etlSchemaSql varchar(100) = 'Create Schema etl'
  exec(@etlSchemaSql)
  print ' - etl Schema created'
 end
Else
 begin
  print ' - etl Schema already exists.'
 end
print ''
go

print 'internal Schema'
If Not Exists(Select [name]
              From [sys].[schemas]
			  Where [name] = N'internal')
 begin
  print ' - Creating internal Schema'
  declare @internalSchemaSql varchar(100) = 'Create Schema internal'
  exec(@internalSchemaSql)
  print ' - internal Schema created'
 end
Else
 begin
  print ' - internal Schema already exists.'
 end
print ''
go

print '* internal schema tables *'
If Exists(Select [name]
          From [sys].[schemas]
          Where [name] = N'internal')
 begin
  print ''
  print ' - creating internal schema tables'
  print ''

print 'etl.operation_id table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'etl'
			    And t.[name] = N'operation_id')
 begin
  print ' - Creating etl.operation_id table'
  Create Table etl.operation_id
  (
	[operation_id] [bigint] NOT NULL
	 Constraint PK_Operation_Id
	  Primary Key
	   Clustered
 , [status_flag] char(1) Not NULL
	 Constraint DF_Operation_Id_Status_Flag 
	  Default ('N')
  )
  print ' - etl.operation_id table created'
 end
Else
 begin
  print ' - etl.operation_id table already exists.'
 end
print ''

print 'etl.execution_id table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'etl'
			    And t.[name] = N'execution_id')
 begin
  print ' - Creating etl.execution_id table'
  Create Table etl.execution_id
  (
	[execution_id] [bigint] NOT NULL
	 Constraint PK_Execution_Id
	  Primary Key
	   Clustered
 , [status_flag] char(1) Not NULL
	 Constraint DF_Execution_Id_Status_Flag 
	  Default ('N')
  )
  print ' - etl.execution_id table created'
 end
Else
 begin
  print ' - etl.execution_id table already exists.'
 end
print ''

print 'etl.executable_id table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'etl'
			    And t.[name] = N'executable_id')
 begin
  print ' - Creating etl.executable_id table'
  Create Table etl.executable_id
  (
	[executable_id] [bigint] NOT NULL
	 Constraint PK_Executable_Id
	  Primary Key
	   Clustered
 , [status_flag] char(1) Not NULL
	 Constraint DF_Executable_Id_Status_Flag 
	  Default ('N')
  )
  print ' - etl.executable_id table created'
 end
Else
 begin
  print ' - etl.executable_id table already exists.'
 end
print ''

print 'etl.validation_id table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'etl'
			    And t.[name] = N'validation_id')
 begin
  print ' - Creating etl.validation_id table'
  Create Table etl.validation_id
  (
	[validation_id] [bigint] NOT NULL
	 Constraint PK_Validation_Id
	  Primary Key
	   Clustered
 , [status_flag] char(1) Not NULL
	 Constraint DF_Validation_Id_Status_Flag 
	  Default ('N')
  )
  print ' - etl.validation_id table created'
 end
Else
 begin
  print ' - etl.validation_id table already exists.'
 end
print ''

print 'internal.event_message_context table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'event_message_context')
 begin
  print ' - Creating internal.event_message_context table'
  Create Table internal.event_message_context
  (
	[context_id] [bigint] NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[event_message_id] [bigint] NOT NULL,
	[context_depth] [int] NULL,
	[package_path] [nvarchar](max) NULL,
	[context_type] [smallint] NULL,
	[context_source_name] [nvarchar](4000) NULL,
	[context_source_id] [nvarchar](38) NULL,
	[property_name] [nvarchar](4000) NULL,
	[property_value] [nvarchar](max) NULL,
	[event_message_guid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Event_Message_Context] PRIMARY KEY CLUSTERED 
([context_id] ASC)
 With (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY])
  print ' - internal.event_message_context table created'
 end
Else
 begin
  print ' - internal.event_message_context table already exists.'
 end
print ''

print 'internal.event_messages table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'event_messages')
 begin
  print ' - Creating internal.event_messages table'
  Create Table internal.event_messages
  (
	[event_message_id] [bigint] NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[execution_path] [nvarchar](max) NULL,
	[package_name] [nvarchar](260) NULL,
	[package_location_type] [nvarchar](128) NULL,
	[package_path_full] [nvarchar](4000) NULL,
	[event_name] [nvarchar](1024) NULL,
	[message_source_name] [nvarchar](4000) NULL,
	[message_source_id] [nvarchar](38) NULL,
	[subcomponent_name] [nvarchar](4000) NULL,
	[package_path] [nvarchar](max) NULL,
	[threadID] [int] NOT NULL,
	[message_code] [int] NULL,
	[event_message_guid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Event_Messages] PRIMARY KEY CLUSTERED 
(
	[event_message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
  print ' - internal.event_messages table created'
 end
Else
 begin
  print ' - internal.event_messages table already exists.'
 end

print ''

print 'internal.executable_statistics table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'executable_statistics')
 begin
  print ' - Creating internal.executable_statistics table'
  Create Table internal.executable_statistics
  (
	[statistics_id] [bigint] NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[executable_id] [bigint] NOT NULL,
	[execution_path] [nvarchar](max) NULL,
	[start_time] [datetimeoffset](7) NULL,
	[end_time] [datetimeoffset](7) NULL,
	[execution_duration] [int] NULL,
	[execution_result] [smallint] NULL,
	[execution_value] nvarchar(max) NULL,
 CONSTRAINT [PK_Executable_statistics] PRIMARY KEY CLUSTERED 
(
	[statistics_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
  print ' - internal.executable_statistics table created'
 end
Else
 begin
  print ' - internal.executable_statistics table already exists.'
 end

print ''

print 'internal.execution_component_phases table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'execution_component_phases')
 begin
  print ' - Creating internal.execution_component_phases table'
  Create Table internal.execution_component_phases
  (
	[phase_stats_id] [bigint] NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[package_name] [nvarchar](260) NOT NULL,
	[package_location_type] [nvarchar](128) NULL,
	[package_path_full] [nvarchar](4000) NULL,
	[task_name] [nvarchar](4000) NOT NULL,
	[subcomponent_name] [nvarchar](4000) NULL,
	[phase] [sysname] NOT NULL,
	[is_start] [bit] NULL,
	[phase_time] [datetimeoffset](7) NULL,
	[execution_path] [nvarchar](max) NULL,
	[sequence_id] [int] NULL,
 CONSTRAINT [PK_Execution_component_phases] PRIMARY KEY CLUSTERED 
(
	[phase_stats_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
  print ' - internal.execution_component_phases table created'
 end
Else
 begin
  print ' - internal.execution_component_phases table already exists.'
 end

print ''


print 'internal.execution_data_statistics table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'execution_data_statistics')
 begin
  print ' - Creating internal.execution_data_statistics table'
  Create Table internal.execution_data_statistics
  (
	[data_stats_id] [bigint] NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[package_name] [nvarchar](260) NOT NULL,
	[package_location_type] [nvarchar](128) NULL,
	[package_path_full] [nvarchar](4000) NULL,
	[task_name] [nvarchar](4000) NULL,
	[dataflow_path_id_string] [nvarchar](4000) NULL,
	[dataflow_path_name] [nvarchar](4000) NULL,
	[source_component_name] [nvarchar](4000) NULL,
	[destination_component_name] [nvarchar](4000) NULL,
	[rows_sent] [bigint] NULL,
	[created_time] [datetimeoffset](7) NULL,
	[execution_path] [nvarchar](max) NULL,
 CONSTRAINT [PK_Execution_data_statistics] PRIMARY KEY CLUSTERED 
(
	[data_stats_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
  print ' - internal.execution_data_statistics table created'
 end
Else
 begin
  print ' - internal.execution_data_statistics table already exists.'
 end

print ''


print 'internal.execution_data_taps table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'execution_data_taps')
 begin
  print ' - Creating internal.execution_data_taps table'
  Create Table internal.execution_data_taps
(
	[data_tap_id] [bigint] NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[package_path] [nvarchar](max) NULL,
	[dataflow_path_id_string] [nvarchar](4000) NULL,
	[dataflow_task_guid] [uniqueidentifier] NULL,
	[max_rows] [int] NULL,
	[filename] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Execution_data_taps] PRIMARY KEY CLUSTERED 
(
	[data_tap_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
  print ' - internal.execution_data_taps table created'
 end
Else
 begin
  print ' - internal.execution_data_taps table already exists.'
 end

print ''


print 'internal.execution_parameter_values table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'execution_parameter_values')
 begin
  print ' - Creating internal.execution_parameter_values table'
  Create Table internal.execution_parameter_values
(
	[execution_parameter_id] [bigint] NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[object_type] [smallint] NOT NULL,
	[parameter_data_type] [nvarchar](128) NOT NULL,
	[parameter_name] [sysname] NOT NULL,
	[parameter_value] nvarchar(max) NULL,
	[sensitive_parameter_value] [varbinary](max) NULL,
	[base_data_type] [nvarchar](128) NULL,
	[sensitive] [bit] NOT NULL,
	[required] [bit] NOT NULL,
	[value_set] [bit] NOT NULL,
	[runtime_override] [bit] NOT NULL,
 CONSTRAINT [PK_Execution_Parameter_value] PRIMARY KEY CLUSTERED 
(
	[execution_parameter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
  print ' - internal.execution_parameter_values table created'
 end
Else
 begin
  print ' - internal.execution_parameter_values table already exists.'
 end

print ''


print 'internal.execution_property_override_values table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'execution_property_override_values')
 begin
  print ' - Creating internal.execution_property_override_values table'
  Create Table internal.execution_property_override_values
(
	[property_id] [bigint] NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[property_path] [nvarchar](4000) NOT NULL,
	[property_value] [nvarchar](max) NULL,
	[sensitive_property_value] [varbinary](max) NULL,
	[sensitive] [bit] NOT NULL,
 CONSTRAINT [PK_Execution_Property_Override_Value] PRIMARY KEY CLUSTERED 
(
	[property_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
  print ' - internal.execution_property_override_values table created'
 end
Else
 begin
  print ' - internal.execution_property_override_values table already exists.'
 end

print ''


print 'internal.executions table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'executions')
 begin
  print ' - Creating internal.executions table'
  Create Table internal.executions
  (
	[execution_id] [bigint] NOT NULL,
	[folder_name] [sysname] NOT NULL,
	[project_name] [sysname] NOT NULL,
	[package_name] [nvarchar](260) NOT NULL,
	[reference_id] [bigint] NULL,
	[reference_type] [char](1) NULL,
	[environment_folder_name] [nvarchar](128) NULL,
	[environment_name] [nvarchar](128) NULL,
	[project_lsn] [bigint] NULL,
	[executed_as_sid] [varbinary](85) NOT NULL,
	[executed_as_name] [nvarchar](128) NOT NULL,
	[use32bitruntime] [bit] NOT NULL,
	[job_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Executions] PRIMARY KEY CLUSTERED 
(
	[execution_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
  print ' - internal.executions table created'
 end
Else
 begin
  print ' - internal.executions table already exists.'
 end

print ''


print 'internal.extended_operation_info table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'extended_operation_info')
 begin
  print ' - Creating internal.extended_operation_info table'
  Create Table internal.extended_operation_info
  (
	[info_id] [bigint] NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[object_name] [nvarchar](260) NOT NULL,
	[object_type] [smallint] NULL,
	[reference_id] [bigint] NULL,
	[status] [int] NOT NULL,
	[start_time] [datetimeoffset](7) NOT NULL,
	[end_time] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Operation_Info] PRIMARY KEY CLUSTERED 
(
	[info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
  print ' - internal.extended_operation_info table created'
 end
Else
 begin
  print ' - internal.extended_operation_info table already exists.'
 end

print ''


print 'internal.operation_messages table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'operation_messages')
 begin
  print ' - Creating internal.operation_messages table'
  Create Table internal.operation_messages
  (
	[operation_message_id] [bigint] NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[message_time] [datetimeoffset](7) NOT NULL,
	[message_type] [smallint] NOT NULL,
	[message_source_type] [smallint] NULL,
	[message] [nvarchar](max) NULL,
	[extended_info_id] [bigint] NULL,
	[event_message_guid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Operation_Messages] PRIMARY KEY CLUSTERED 
(
	[operation_message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
  print ' - internal.operation_messages table created'
 end
Else
 begin
  print ' - internal.operation_messages table already exists.'
 end

print ''


print 'internal.operation_os_sys_info table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'operation_os_sys_info')
 begin
  print ' - Creating internal.operation_os_sys_info table'
  Create Table internal.operation_os_sys_info
  (
	[info_id] [bigint] NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[total_physical_memory_kb] [bigint] NOT NULL,
	[available_physical_memory_kb] [bigint] NULL,
	[total_page_file_kb] [bigint] NULL,
	[available_page_file_kb] [bigint] NOT NULL,
	[cpu_count] [int] NOT NULL,
 CONSTRAINT [PK_Operation_Os_Sys_Info] PRIMARY KEY CLUSTERED 
(
	[info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
  print ' - internal.operation_os_sys_info table created'
 end
Else
 begin
  print ' - internal.operation_os_sys_info table already exists.'
 end

print ''


print 'internal.operation_permissions table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'operation_permissions')
 begin
  print ' - Creating internal.operation_permissions table'
  Create Table internal.operation_permissions
  (
	[id] [bigint] NOT NULL,
	[sid] varbinary(85) NOT NULL,
	[object_id] [bigint] NOT NULL,
	[permission_type] [smallint] NOT NULL,
	[is_role] [bit] NOT NULL,
	[is_deny] [bit] NOT NULL,
	[grantor_sid] varbinary(85) NOT NULL,
 CONSTRAINT [PK_Operation_Permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
  print ' - internal.operation_permissions table created'
 end
Else
 begin
  print ' - internal.operation_permissions table already exists.'
 end

print ''


print 'internal.operations table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'operations')
 begin
  print ' - Creating internal.operations table'
  Create Table internal.operations
  (
	[operation_id] [bigint] NOT NULL,
	[operation_type] [smallint] NOT NULL,
	[created_time] [datetimeoffset](7) NULL,
	[object_type] [smallint] NULL,
	[object_id] [bigint] NULL,
	[object_name] [nvarchar](260) NULL,
	[status] [int] NOT NULL,
	[start_time] [datetimeoffset](7) NULL,
	[end_time] [datetimeoffset](7) NULL,
	[caller_sid] [varbinary](85) NOT NULL,
	[caller_name] [sysname] NOT NULL,
	[process_id] [int] NULL,
	[stopped_by_sid] [varbinary](85) NULL,
	[stopped_by_name] [nvarchar](128) NULL,
	[operation_guid] [uniqueidentifier] NULL,
	[server_name] [nvarchar](128) NULL,
	[machine_name] [nvarchar](128) NULL,
	[worker_agent_id] [uniqueidentifier] NULL,
	[executed_count] [int] NULL,
 CONSTRAINT [PK_Operations] PRIMARY KEY CLUSTERED 
(
	[operation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
  print ' - internal.operations table created'
 end
Else
 begin
  print ' - internal.operations table already exists.'
 end

print ''


print 'internal.validations table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'validations')
 begin
  print ' - Creating internal.validations table'
  Create Table internal.validations
  (
	[validation_id] [bigint] NOT NULL,
	[environment_scope] [char](1) NOT NULL,
	[validate_type] [char](1) NOT NULL,
	[folder_name] [sysname] NOT NULL,
	[project_name] [sysname] NOT NULL,
	[project_lsn] [bigint] NULL,
	[use32bitruntime] [bit] NULL,
	[reference_id] [bigint] NULL,
	[job_id] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Validations] PRIMARY KEY CLUSTERED 
(
	[validation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
  print ' - internal.validations table created'
 end
Else
 begin
  print ' - internal.validations table already exists.'
 end

  print ''

print 'internal.executables table'
If Not Exists(Select s.[name] + '.' + t.[name]
              From [sys].[tables] t
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'executables')
 begin
  print ' - Creating internal.executables table'
Create Table internal.executables
(
	[executable_id] [bigint] NOT NULL,
	[project_id] [bigint] NOT NULL,
	[project_version_lsn] [bigint] NOT NULL,
	[package_name] [nvarchar](260) NOT NULL,
	[package_location_type] [nvarchar](128) NULL,
	[package_path_full] [nvarchar](4000) NULL,
	[executable_name] [nvarchar](4000) NULL,
	[executable_guid] [nvarchar](38) NULL,
	[package_path] [nvarchar](max) NULL,
 CONSTRAINT [PK_Executables] PRIMARY KEY CLUSTERED 
(
	[executable_id] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
  print ' - internal.executables table created'
 end
Else
 begin
  print ' - internal.executables table already exists.'
 end

  print ''
  print ' - internal schema tables created'
  print ''
 end
Else
 begin
  print ''
  print ' - internal schema tables NOT created, internal schema does not exist.'
  print ''
 end

print '* internal schema constraints *'
If Exists(Select [name]
          From [sys].[schemas]
          Where [name] = N'internal')
 begin
  print ''
  print ' - creating internal schema constraints'
  print ''

print 'internal.operations.executed_count default constraint'
If Not Exists(Select s.[name] + '.' + t.[name] + '.' + dc.[name]
              From [sys].[default_constraints] dc
              Join [sys].[tables] t
                On t.[name] = object_name(dc.parent_object_id)
              Join [sys].[schemas] s
                On s.[schema_id] = t.[schema_id]
              Where s.[name] = N'internal'
                And t.[name] = N'operations')
 begin  
  print ' - creating internal.operations.executed_count default constraint'
  Alter Table [internal].[operations] Add Default ((0)) FOR [executed_count]
  print ' - internal.operations.executed_count default constraint created'
 end
Else
 begin
  print ' - internal.operations.executed_count default constraint already exists.'
 end
print ''

print 'internal.event_message_context.FK_EventMessageContext_EventMessageId_EventMessages'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'event_message_context'
				And fk.[name] = N'FK_EventMessageContext_EventMessageId_EventMessages')
 begin
  print ' - creating internal.event_message_context.FK_EventMessageContext_EventMessageId_EventMessages'
  Alter Table [internal].[event_message_context]
   With Check
    Add Constraint [FK_EventMessageContext_EventMessageId_EventMessages]
     Foreign Key([event_message_id])
      References [internal].[event_messages] ([event_message_id])
  print ' - internal.event_message_context.FK_EventMessageContext_EventMessageId_EventMessages created'
 end
Else
 begin
  print ' - internal.event_message_context.FK_EventMessageContext_EventMessageId_EventMessages already exists.'
 end
print ''


print 'check internal.event_message_context.FK_EventMessageContext_EventMessageId_EventMessages'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'event_message_context'
            And fk.[name] = N'FK_EventMessageContext_EventMessageId_EventMessages')
 begin
  print ' - checking internal.event_message_context.FK_EventMessageContext_EventMessageId_EventMessages'
  Alter Table [internal].[event_message_context]
   Check Constraint [FK_EventMessageContext_EventMessageId_EventMessages]
  print ' - internal.event_message_context.FK_EventMessageContext_EventMessageId_EventMessages checked'
 end
Else
 begin
  print ' - internal.event_message_context.FK_EventMessageContext_EventMessageId_EventMessages does not exist.'
 end
print ''

print 'internal.event_message_context.FK_EventMessagecontext_Operations'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'event_message_context'
				And fk.[name] = N'FK_EventMessagecontext_Operations')
 begin
  print ' - creating internal.event_message_context.FK_EventMessagecontext_Operations'
  Alter Table [internal].[event_message_context]
   With Check
    Add Constraint [FK_EventMessagecontext_Operations] 
     Foreign Key([operation_id])
      References [internal].[operations] ([operation_id])
  print ' - internal.event_message_context.FK_EventMessagecontext_Operations created'
 end
Else
 begin
  print ' - internal.event_message_context.FK_EventMessagecontext_Operations already exists.'
 end
print ''

print 'check internal.event_message_context.FK_EventMessagecontext_Operations'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'event_message_context'
            And fk.[name] = N'FK_EventMessagecontext_Operations')
 begin
  print ' - checking internal.event_message_context.FK_EventMessagecontext_Operations'
  Alter Table [internal].[event_message_context]
   Check Constraint [FK_EventMessagecontext_Operations]
  print ' - internal.event_message_context.FK_EventMessagecontext_Operations checked'
 end
Else
 begin
  print ' - internal.event_message_context.FK_EventMessagecontext_Operations does not exist.'
 end
print ''

print 'internal.event_messages.FK_EventMessage_Operations'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'event_messages'
				And fk.[name] = N'FK_EventMessage_Operations')
 begin
  print ' - creating internal.event_messages.FK_EventMessage_Operations'
  Alter Table [internal].[event_messages]
   With Check
    Add Constraint [FK_EventMessage_Operations]
     Foreign Key([operation_id])
      References [internal].[operations] ([operation_id])
  print ' - internal.event_messages.FK_EventMessage_Operations created'
 end
Else
 begin
  print ' - internal.event_messages.FK_EventMessage_Operations already exists.'
 end
print ''


print 'check internal.event_messages.FK_EventMessage_Operations'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'event_messages'
            And fk.[name] = N'FK_EventMessage_Operations')
 begin
  print ' - checking internal.event_messages.FK_EventMessage_Operations'
  Alter Table [internal].[event_messages]
   Check Constraint [FK_EventMessage_Operations]
  print ' - internal.event_messages.FK_EventMessage_Operations checked'
 end
Else
 begin
  print ' - internal.event_messages.FK_EventMessage_Operations does not exist.'
 end
print ''


print 'internal.event_messages.FK_EventMessages_OperationMessageId_OperationMessage'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'event_messages'
				And fk.[name] = N'FK_EventMessages_OperationMessageId_OperationMessage')
 begin
  print ' - creating internal.event_messages.FK_EventMessages_OperationMessageId_OperationMessage'
  Alter Table [internal].[event_messages]
   With Check
    Add Constraint [FK_EventMessages_OperationMessageId_OperationMessage]
	 Foreign Key([event_message_id])
      References [internal].[operation_messages] ([operation_message_id])
  print ' - internal.event_messages.FK_EventMessages_OperationMessageId_OperationMessage created'
 end
Else
 begin
  print ' - internal.event_messages.FK_EventMessages_OperationMessageId_OperationMessage already exists.'
 end
print ''


print 'check internal.event_messages.FK_EventMessages_OperationMessageId_OperationMessage'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'event_messages'
            And fk.[name] = N'FK_EventMessages_OperationMessageId_OperationMessage')
 begin
  print ' - checking internal.event_messages.FK_EventMessages_OperationMessageId_OperationMessage'
  Alter Table [internal].[event_messages]
   Check Constraint [FK_EventMessages_OperationMessageId_OperationMessage]
  print ' - internal.event_messages.FK_EventMessages_OperationMessageId_OperationMessage checked'
 end
Else
 begin
  print ' - internal.event_messages.FK_EventMessages_OperationMessageId_OperationMessage does not exist.'
 end
print ''


print 'internal.executable_statistics.FK_ExecutableStatistics_ExecutableId_Executables'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'executable_statistics'
				And fk.[name] = N'FK_ExecutableStatistics_ExecutableId_Executables')
 begin
  print ' - creating internal.executable_statistics.FK_ExecutableStatistics_ExecutableId_Executables'
  Alter Table [internal].[executable_statistics]
   With Check
    Add Constraint [FK_ExecutableStatistics_ExecutableId_Executables]
     Foreign Key([executable_id])
      References [internal].[executables] ([executable_id])
  print ' - internal.executable_statistics.FK_ExecutableStatistics_ExecutableId_Executables created'
 end
Else
 begin
  print ' - internal.executable_statistics.FK_ExecutableStatistics_ExecutableId_Executables already exists.'
 end
print ''


print 'check internal.executable_statistics.FK_ExecutableStatistics_ExecutableId_Executables'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'executable_statistics'
            And fk.[name] = N'FK_ExecutableStatistics_ExecutableId_Executables')
 begin
  print ' - checking internal.executable_statistics.FK_ExecutableStatistics_ExecutableId_Executables'
  Alter Table [internal].[executable_statistics]
   Check Constraint [FK_ExecutableStatistics_ExecutableId_Executables]
  print ' - internal.executable_statistics.FK_ExecutableStatistics_ExecutableId_Executables checked'
 end
Else
 begin
  print ' - internal.executable_statistics.FK_ExecutableStatistics_ExecutableId_Executables does not exist.'
 end
print ''


print 'internal.executable_statistics.FK_ExecutableStatistics_ExecutionId_Executions'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'executable_statistics'
				And fk.[name] = N'FK_ExecutableStatistics_ExecutionId_Executions')
 begin
  print ' - creating internal.executable_statistics.FK_ExecutableStatistics_ExecutionId_Executions'
  Alter Table [internal].[executable_statistics]
   With Check
    Add Constraint [FK_ExecutableStatistics_ExecutionId_Executions]
     Foreign Key([execution_id])
      References [internal].[executions] ([execution_id])
  print ' - internal.executable_statistics.FK_ExecutableStatistics_ExecutionId_Executions created'
 end
Else
 begin
  print ' - internal.executable_statistics.FK_ExecutableStatistics_ExecutionId_Executions already exists.'
 end
print ''


print 'check internal.executable_statistics.FK_ExecutableStatistics_ExecutionId_Executions'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'executable_statistics'
            And fk.[name] = N'FK_ExecutableStatistics_ExecutionId_Executions')
 begin
  print ' - checking internal.executable_statistics.FK_ExecutableStatistics_ExecutionId_Executions'
  Alter Table [internal].[executable_statistics]
   Check Constraint [FK_ExecutableStatistics_ExecutionId_Executions]
  print ' - internal.executable_statistics.FK_ExecutableStatistics_ExecutionId_Executions checked'
 end
Else
 begin
  print ' - internal.executable_statistics.FK_ExecutableStatistics_ExecutionId_Executions does not exist.'
 end
print ''


print 'internal.execution_component_phases.FK_ExecCompPhases_ExecutionId_Executions'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'execution_component_phases'
				And fk.[name] = N'FK_ExecCompPhases_ExecutionId_Executions')
 begin
  print ' - creating internal.execution_component_phases.FK_ExecCompPhases_ExecutionId_Executions'
  Alter Table [internal].[execution_component_phases]
   With Check
    Add Constraint [FK_ExecCompPhases_ExecutionId_Executions]
     Foreign Key([execution_id])
      References [internal].[executions] ([execution_id])
  print ' - internal.execution_component_phases.FK_ExecCompPhases_ExecutionId_Executions created'
 end
Else
 begin
  print ' - internal.execution_component_phases.FK_ExecCompPhases_ExecutionId_Executions already exists.'
 end
print ''



print 'check internal.execution_component_phases.FK_ExecCompPhases_ExecutionId_Executions'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'execution_component_phases'
            And fk.[name] = N'FK_ExecCompPhases_ExecutionId_Executions')
 begin
  print ' - checking internal.execution_component_phases.FK_ExecCompPhases_ExecutionId_Executions'
  Alter Table [internal].[execution_component_phases]
   Check Constraint [FK_ExecCompPhases_ExecutionId_Executions]
  print ' - internal.execution_component_phases.FK_ExecCompPhases_ExecutionId_Executions checked'
 end
Else
 begin
  print ' - internal.execution_component_phases.FK_ExecCompPhases_ExecutionId_Executions does not exist.'
 end
print ''


print 'internal.execution_data_statistics.FK_ExecDataStat_ExecutionId_Executions'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'execution_data_statistics'
				And fk.[name] = N'FK_ExecDataStat_ExecutionId_Executions')
 begin
  print ' - creating internal.execution_data_statistics.FK_ExecDataStat_ExecutionId_Executions'
  Alter Table [internal].[execution_data_statistics]
   With Check
    Add Constraint [FK_ExecDataStat_ExecutionId_Executions]
     Foreign Key([execution_id])
      References [internal].[executions] ([execution_id])
  print ' - internal.execution_data_statistics.FK_ExecDataStat_ExecutionId_Executions created'
 end
Else
 begin
  print ' - internal.execution_data_statistics.FK_ExecDataStat_ExecutionId_Executions already exists.'
 end
print ''


print 'check internal.execution_data_statistics.FK_ExecDataStat_ExecutionId_Executions'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'execution_data_statistics'
            And fk.[name] = N'FK_ExecDataStat_ExecutionId_Executions')
 begin
  print ' - checking internal.execution_data_statistics.FK_ExecDataStat_ExecutionId_Executions'
  Alter Table [internal].[execution_data_statistics]
   Check Constraint [FK_ExecDataStat_ExecutionId_Executions]
  print ' - internal.execution_data_statistics.FK_ExecDataStat_ExecutionId_Executions checked'
 end
Else
 begin
  print ' - internal.execution_data_statistics.FK_ExecDataStat_ExecutionId_Executions does not exist.'
 end
print ''


print 'internal.execution_data_taps.FK_ExecDataTaps_ExecutionId_Executions'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'execution_data_taps'
				And fk.[name] = N'FK_ExecDataTaps_ExecutionId_Executions')
 begin
  print ' - creating internal.execution_data_taps.FK_ExecDataTaps_ExecutionId_Executions'
  Alter Table [internal].[execution_data_taps]
   With Check
    Add Constraint [FK_ExecDataTaps_ExecutionId_Executions]
     Foreign Key([execution_id])
      References [internal].[executions] ([execution_id])
  print ' - internal.execution_data_taps.FK_ExecDataTaps_ExecutionId_Executions created'
 end
Else
 begin
  print ' - internal.execution_data_taps.FK_ExecDataTaps_ExecutionId_Executions already exists.'
 end
print ''


print 'check internal.execution_data_taps.FK_ExecDataTaps_ExecutionId_Executions'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'execution_data_taps'
            And fk.[name] = N'FK_ExecDataTaps_ExecutionId_Executions')
 begin
  print ' - checking internal.execution_data_taps.FK_ExecDataTaps_ExecutionId_Executions'
  Alter Table [internal].[execution_data_taps]
   Check Constraint [FK_ExecDataTaps_ExecutionId_Executions]
  print ' - internal.execution_data_taps.FK_ExecDataTaps_ExecutionId_Executions checked'
 end
Else
 begin
  print ' - internal.execution_data_taps.FK_ExecDataTaps_ExecutionId_Executions does not exist.'
 end
print ''


print 'internal.execution_parameter_values.FK_ExecutionParameterValue_ExecutionId_Executions'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'execution_parameter_values'
				And fk.[name] = N'FK_ExecutionParameterValue_ExecutionId_Executions')
 begin
  print ' - creating internal.execution_parameter_values.FK_ExecutionParameterValue_ExecutionId_Executions'
  Alter Table [internal].[execution_parameter_values]
   With Check
    Add Constraint [FK_ExecutionParameterValue_ExecutionId_Executions]
     Foreign Key([execution_id])
      References [internal].[executions] ([execution_id])
  print ' - internal.execution_parameter_values.FK_ExecutionParameterValue_ExecutionId_Executions created'
 end
Else
 begin
  print ' - internal.execution_parameter_values.FK_ExecutionParameterValue_ExecutionId_Executions already exists.'
 end
print ''


print 'check internal.execution_parameter_values.FK_ExecutionParameterValue_ExecutionId_Executions'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'execution_parameter_values'
            And fk.[name] = N'FK_ExecutionParameterValue_ExecutionId_Executions')
 begin
  print ' - checking internal.execution_parameter_values.FK_ExecutionParameterValue_ExecutionId_Executions'
  Alter Table [internal].[execution_parameter_values]
   Check Constraint [FK_ExecutionParameterValue_ExecutionId_Executions]
  print ' - internal.execution_parameter_values.FK_ExecutionParameterValue_ExecutionId_Executions checked'
 end
Else
 begin
  print ' - internal.execution_parameter_values.FK_ExecutionParameterValue_ExecutionId_Executions does not exist.'
 end
print ''


print 'internal.execution_property_override_values.FK_ExecutionPropertyOverrideValue_ExecutionId_Executions'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'execution_property_override_values'
				And fk.[name] = N'FK_ExecutionPropertyOverrideValue_ExecutionId_Executions')
 begin
  print ' - creating internal.execution_property_override_values.FK_ExecutionPropertyOverrideValue_ExecutionId_Executions'
  Alter Table [internal].[execution_property_override_values]
 With Check
  Add Constraint [FK_ExecutionPropertyOverrideValue_ExecutionId_Executions]
   Foreign Key([execution_id])
    References [internal].[executions] ([execution_id])
  print ' - internal.execution_property_override_values.FK_ExecutionPropertyOverrideValue_ExecutionId_Executions created'
 end
Else
 begin
  print ' - internal.execution_property_override_values.FK_ExecutionPropertyOverrideValue_ExecutionId_Executions already exists.'
 end
print ''


print 'check internal.execution_property_override_values.FK_ExecutionPropertyOverrideValue_ExecutionId_Executions'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'execution_property_override_values'
            And fk.[name] = N'FK_ExecutionPropertyOverrideValue_ExecutionId_Executions')
 begin
  print ' - checking internal.execution_property_override_values.FK_ExecutionPropertyOverrideValue_ExecutionId_Executions'
  Alter Table [internal].[execution_property_override_values]
   Check Constraint [FK_ExecutionPropertyOverrideValue_ExecutionId_Executions]
  print ' - internal.execution_property_override_values.FK_ExecutionPropertyOverrideValue_ExecutionId_Executions checked'
 end
Else
 begin
  print ' - internal.execution_property_override_values.FK_ExecutionPropertyOverrideValue_ExecutionId_Executions does not exist.'
 end
print ''


print 'internal.executions.FK_Executions_ExecutionId_Operations'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'executions'
				And fk.[name] = N'FK_Executions_ExecutionId_Operations')
 begin
  print ' - creating internal.executions.FK_Executions_ExecutionId_Operations'
  Alter Table [internal].[executions]
   With Check
    Add Constraint [FK_Executions_ExecutionId_Operations]
     Foreign Key([execution_id])
      References [internal].[operations] ([operation_id])
  print ' - internal.executions.FK_Executions_ExecutionId_Operations created'
 end
Else
 begin
  print ' - internal.executions.FK_Executions_ExecutionId_Operations already exists.'
 end
print ''


print 'check internal.executions.FK_Executions_ExecutionId_Operations'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'executions'
            And fk.[name] = N'FK_Executions_ExecutionId_Operations')
 begin
  print ' - checking internal.executions.FK_Executions_ExecutionId_Operations'
  Alter Table [internal].[executions]
   Check Constraint [FK_Executions_ExecutionId_Operations]
  print ' - internal.executions.FK_Executions_ExecutionId_Operations checked'
 end
Else
 begin
  print ' - internal.executions.FK_Executions_ExecutionId_Operations does not exist.'
 end
print ''


print 'internal.extended_operation_info.FK_OperationInfo_Operations'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'extended_operation_info'
				And fk.[name] = N'FK_OperationInfo_Operations')
 begin
  print ' - creating internal.extended_operation_info.FK_OperationInfo_Operations'
  Alter Table [internal].[extended_operation_info]
   With Check
    Add Constraint [FK_OperationInfo_Operations]
     Foreign Key([operation_id])
      References [internal].[operations] ([operation_id])
  print ' - internal.extended_operation_info.FK_OperationInfo_Operations created'
 end
Else
 begin
  print ' - internal.extended_operation_info.FK_OperationInfo_Operations already exists.'
 end
print ''


print 'check internal.extended_operation_info.FK_OperationInfo_Operations'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'extended_operation_info'
            And fk.[name] = N'FK_OperationInfo_Operations')
 begin
  print ' - checking internal.extended_operation_info.FK_OperationInfo_Operations'
  Alter Table [internal].[extended_operation_info]
   Check Constraint [FK_OperationInfo_Operations]
  print ' - internal.extended_operation_info.FK_OperationInfo_Operations checked'
 end
Else
 begin
  print ' - internal.extended_operation_info.FK_OperationInfo_Operations does not exist.'
 end
print ''


print 'internal.operation_messages.FK_OperationMessages_OperationId_Operations'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'operation_messages'
				And fk.[name] = N'FK_OperationMessages_OperationId_Operations')
 begin
  print ' - creating internal.operation_messages.FK_OperationMessages_OperationId_Operations'
  Alter Table [internal].[operation_messages]
   With Check
    Add Constraint [FK_OperationMessages_OperationId_Operations]
     Foreign Key([operation_id])
      References [internal].[operations] ([operation_id])
  print ' - internal.operation_messages.FK_OperationMessages_OperationId_Operations created'
 end
Else
 begin
  print ' - internal.operation_messages.FK_OperationMessages_OperationId_Operations already exists.'
 end
print ''


print 'check internal.operation_messages.FK_OperationMessages_OperationId_Operations'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'operation_messages'
            And fk.[name] = N'FK_OperationMessages_OperationId_Operations')
 begin
  print ' - checking internal.operation_messages.FK_OperationMessages_OperationId_Operations'
  Alter Table [internal].[operation_messages]
   Check Constraint [FK_OperationMessages_OperationId_Operations]
  print ' - internal.operation_messages.FK_OperationMessages_OperationId_Operations checked'
 end
Else
 begin
  print ' - internal.operation_messages.FK_OperationMessages_OperationId_Operations does not exist.'
 end
print ''


print 'internal.operation_os_sys_info.FK_OssysInfo_Operations'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'operation_os_sys_info'
				And fk.[name] = N'FK_OssysInfo_Operations')
 begin
  print ' - creating internal.operation_os_sys_info.FK_OssysInfo_Operations'
  Alter Table [internal].[operation_os_sys_info]
   With Check
    Add Constraint [FK_OssysInfo_Operations]
     Foreign Key([operation_id])
      References [internal].[operations] ([operation_id])
  print ' - internal.operation_os_sys_info.FK_OssysInfo_Operations created'
 end
Else
 begin
  print ' - internal.operation_os_sys_info.FK_OssysInfo_Operations already exists.'
 end
print ''


print 'check internal.operation_os_sys_info.FK_OssysInfo_Operations'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'operation_os_sys_info'
            And fk.[name] = N'FK_OssysInfo_Operations')
 begin
  print ' - checking internal.operation_os_sys_info.FK_OssysInfo_Operations'
  Alter Table [internal].[operation_os_sys_info]
   Check Constraint [FK_OssysInfo_Operations]
  print ' - internal.operation_os_sys_info.FK_OssysInfo_Operations checked'
 end
Else
 begin
  print ' - internal.operation_os_sys_info.FK_OssysInfo_Operations does not exist.'
 end
print ''


print 'internal.operation_permissions.FK_OperationPermissions_ObjectId_Operations'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'operation_permissions'
				And fk.[name] = N'FK_OperationPermissions_ObjectId_Operations')
 begin
  print ' - creating internal.operation_permissions.FK_OperationPermissions_ObjectId_Operations'
  Alter Table [internal].[operation_permissions]
   With Check
    Add Constraint [FK_OperationPermissions_ObjectId_Operations]
     Foreign Key([object_id])
      References [internal].[operations] ([operation_id])
  print ' - internal.operation_permissions.FK_OperationPermissions_ObjectId_Operations created'
 end
Else
 begin
  print ' - internal.operation_permissions.FK_OperationPermissions_ObjectId_Operations already exists.'
 end
print ''


print 'check internal.operation_permissions.FK_OperationPermissions_ObjectId_Operations'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'operation_permissions'
            And fk.[name] = N'FK_OperationPermissions_ObjectId_Operations')
 begin
  print ' - checking internal.operation_permissions.FK_OperationPermissions_ObjectId_Operations'
  Alter Table [internal].[operation_permissions]
   Check Constraint [FK_OperationPermissions_ObjectId_Operations]
  print ' - internal.operation_permissions.FK_OperationPermissions_ObjectId_Operations checked'
 end
Else
 begin
  print ' - internal.operation_permissions.FK_OperationPermissions_ObjectId_Operations does not exist.'
 end
print ''


print 'internal.validations.FK_Validations_ValidationId_Operations'
If Not Exists(Select *
              From [sys].[foreign_keys] fk
			  Join [sys].[tables] t
			    On t.[name] = object_name(fk.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'validations'
				And fk.[name] = N'FK_Validations_ValidationId_Operations')
 begin
  print ' - creating internal.validations.FK_Validations_ValidationId_Operations'
  Alter Table [internal].[validations]
   With Check
    Add Constraint [FK_Validations_ValidationId_Operations]
     Foreign Key([validation_id])
      References [internal].[operations] ([operation_id])
  print ' - internal.validations.FK_Validations_ValidationId_Operations created'
 end
Else
 begin
  print ' - internal.validations.FK_Validations_ValidationId_Operations already exists.'
 end
print ''


print 'check internal.validations.FK_Validations_ValidationId_Operations'
If Exists(Select *
          From [sys].[foreign_keys] fk
          Join [sys].[tables] t
            On t.[name] = object_name(fk.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'validations'
            And fk.[name] = N'FK_Validations_ValidationId_Operations')
 begin
  print ' - checking internal.validations.FK_Validations_ValidationId_Operations'
  Alter Table [internal].[validations]
   Check Constraint [FK_Validations_ValidationId_Operations]
  print ' - internal.validations.FK_Validations_ValidationId_Operations checked'
 end
Else
 begin
  print ' - internal.validations.FK_Validations_ValidationId_Operations does not exist.'
 end
print ''


print 'internal.operation_permissions.CK_Operation_PermissionType'
If Not Exists(Select *
              From [sys].[check_constraints] ck
			  Join [sys].[tables] t
			    On t.[name] = object_name(ck.parent_object_id)
			  Join [sys].[schemas] s
			    On s.[schema_id] = t.[schema_id]
			  Where s.[name] = N'internal'
			    And t.[name] = N'operation_permissions'
				And ck.[name] = N'CK_Operation_PermissionType')
 begin
  print ' - creating internal.operation_permissions.CK_Operation_PermissionType'
  Alter Table [internal].[operation_permissions]
   With Check
    Add Constraint [CK_Operation_PermissionType]
     Check (
            ([permission_type]=(4)
              OR
		     [permission_type]=(2)
		      OR 
		     [permission_type]=(1))
		   )
  print ' - internal.operation_permissions.CK_Operation_PermissionType created'
 end
Else
 begin
  print ' - internal.operation_permissions.CK_Operation_PermissionType already exists.'
 end
print ''


print 'check internal.operation_permissions.CK_Operation_PermissionType'
If Exists(Select *
          From [sys].[check_constraints] ck
          Join [sys].[tables] t
            On t.[name] = object_name(ck.parent_object_id)
          Join [sys].[schemas] s
            On s.[schema_id] = t.[schema_id]
          Where s.[name] = N'internal'
            And t.[name] = N'operation_permissions'
            And ck.[name] = N'CK_Operation_PermissionType')
 begin
  print ' - checking internal.operation_permissions.CK_Operation_PermissionType'
  Alter Table [internal].[operation_permissions]
   Check Constraint [CK_Operation_PermissionType]
  print ' - internal.operation_permissions.CK_Operation_PermissionType checked'
 end
Else
 begin
  print ' - internal.operation_permissions.CK_Operation_PermissionType does not exist.'
 end
print ''

  print ''
  print ' - internal schema constraints created'
  print ''
 end
Else
 begin
  print ''
  print ' - internal schema constraints NOT created, internal schema does not exist.'
  print ''
 end

Set NoExec OFF
go

Use [master]
go
