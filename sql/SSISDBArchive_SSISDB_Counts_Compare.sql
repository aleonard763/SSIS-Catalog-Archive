Use SSISDB
go

print '-------------------------------------------------'
print ' SSISDB - SSISDBArchive Counts Compare Script '
print '-------------------------------------------------'
print ''

print 'SSISDB Archive database check'
print ''

If Exists (Select [name]
           From [sys].[databases]
		   Where [name] = N'SSISDBArchive')
 begin

Select
   (Select Count(*)
    From SSISDB.internal.operations) As SSISDB_OperationsCount
,
   (Select Count(*) As OperationsCount
    From SSISDBArchive.internal.operations) As SSISDBArchive_OperationsCount
,
   Abs((Select Count(*)
    From SSISDB.internal.operations)
   -
   (Select Count(*) As OperationsCount
    From SSISDBArchive.internal.operations)) As Delta_OperationsCount

Select
   (Select Count(*)
    From SSISDB.internal.executables) As SSISDB_ExecutablesCount
,
   (Select Count(*)
    From SSISDBArchive.internal.executables) As SSISDBArchive_ExecutablesCount
,
   Abs((Select Count(*)
    From SSISDB.internal.executables)
	-
   (Select Count(*)
    From SSISDBArchive.internal.executables)) As Delta_ExecutablesCount

Select
   (Select Count(*)
    From SSISDB.internal.executions) As SSISDB_ExecutionsCount
,
   (Select Count(*)
    From SSISDBArchive.internal.executions) As SSISDBArchive_ExecutionsCount
,
   Abs((Select Count(*)
    From SSISDB.internal.executions)
	-
   (Select Count(*)
    From SSISDBArchive.internal.executions)) As Delta_ExecutionsCount

Select
   (Select Count(*)
    From SSISDB.internal.validations) As SSISDB_ValidationsCount
,
   (Select Count(*)
    From SSISDBArchive.internal.validations) As SSISDBArchive_ValidationsCount
,
   Abs((Select Count(*)
    From SSISDB.internal.validations)
	-
   (Select Count(*)
    From SSISDBArchive.internal.validations)) As Delta_ValidationsCount

Select
   (Select Count(*)
    From SSISDB.internal.operation_os_sys_info) As SSISDB_Operation_os_sys_infoCount
,
   (Select Count(*)
    From SSISDBArchive.internal.operation_os_sys_info) As SSISDBArchive_Operation_os_sys_infoCount
,
   Abs((Select Count(*)
    From SSISDB.internal.operation_os_sys_info)
	-
   (Select Count(*)
    From SSISDBArchive.internal.operation_os_sys_info)) As Delta_Operation_os_sys_infoCount

Select
   (Select Count(*)
    From SSISDB.internal.operation_messages) As SSISDB_Operation_messagesCount
,
   (Select Count(*)
    From SSISDBArchive.internal.operation_messages) As SSISDBArchive_Operation_messagesCount
,
   Abs((Select Count(*)
    From SSISDB.internal.operation_messages)
	-
   (Select Count(*)
    From SSISDBArchive.internal.operation_messages)) As Delta_Operation_messagesCount

Select
   (Select Count(*)
    From SSISDB.internal.extended_operation_info) As SSISDB_Extended_operation_infoCount
,
   (Select Count(*)
    From SSISDBArchive.internal.extended_operation_info) As SSISDBArchive_Extended_operation_infoCount
,
   Abs((Select Count(*)
    From SSISDB.internal.extended_operation_info)
	-
   (Select Count(*)
    From SSISDBArchive.internal.extended_operation_info)) As Delta_Extended_operation_infoCount

Select
   (Select Count(*)
    From SSISDB.internal.event_messages) As SSISDB_Event_messagesCount
,
   (Select Count(*)
    From SSISDBArchive.internal.event_messages) As SSISDBArchive_Event_messagesCount
,
   Abs((Select Count(*)
    From SSISDB.internal.event_messages)
	-
   (Select Count(*)
    From SSISDBArchive.internal.event_messages)) As Delta_Event_messagesCount

Select
   (Select Count(*)
    From SSISDB.internal.execution_component_phases) As SSISDB_Executable_component_phasesCount
,
   (Select Count(*)
    From SSISDBArchive.internal.execution_component_phases) As SSISDBArchive_Executable_component_phasesCount
,
   Abs((Select Count(*)
    From SSISDB.internal.execution_component_phases)
	-
   (Select Count(*)
    From SSISDBArchive.internal.execution_component_phases)) As Delta_Executable_component_phasesCount

Select
   (Select Count(*)
    From SSISDB.internal.executable_statistics) As SSISDB_Executable_statisticsCount
,
   (Select Count(*)
    From SSISDBArchive.internal.executable_statistics) As SSISDBArchive_Executable_statisticsCount
,
   Abs((Select Count(*)
    From SSISDB.internal.executable_statistics)
	-
   (Select Count(*)
    From SSISDBArchive.internal.executable_statistics)) As Delta_Executable_statisticsCount

Select
   (Select Count(*)
    From SSISDB.internal.execution_data_taps) As SSISDB_Execution_data_tapsCount
,
   (Select Count(*)
    From SSISDBArchive.internal.execution_data_taps) As SSISDBArchive_Execution_data_tapsCount
,
   Abs((Select Count(*)
    From SSISDB.internal.execution_data_taps)
	-
   (Select Count(*)
    From SSISDBArchive.internal.execution_data_taps)) As Delta_Execution_data_tapsCount

Select
   (Select Count(*)
    From SSISDB.internal.execution_parameter_values) As SSISDB_Execution_parameter_valuesCount
,
   (Select Count(*)
    From SSISDBArchive.internal.execution_parameter_values) As SSISDBArchive_Execution_parameter_valuesCount
,
   Abs((Select Count(*)
    From SSISDB.internal.execution_parameter_values)
	-
   (Select Count(*)
    From SSISDBArchive.internal.execution_parameter_values)) As Delta_Execution_parameter_valuesCount

Select
   (Select Count(*)
    From SSISDB.internal.execution_property_override_values) As SSISDB_Execution_property_override_valuesCount
,
   (Select Count(*)
    From SSISDBArchive.internal.execution_property_override_values) As SSISDBArchive_Execution_property_override_valuesCount
,
   Abs((Select Count(*)
    From SSISDB.internal.execution_property_override_values)
	-
   (Select Count(*)
    From SSISDBArchive.internal.execution_property_override_values)) As Delta_Execution_property_override_valuesCount

Select
   (Select Count(*)
    From SSISDB.internal.execution_data_statistics) As SSISDB_Execution_data_statisticsCount
,
   (Select Count(*)
    From SSISDBArchive.internal.execution_data_statistics) As SSISDBArchive_Execution_data_statisticsCount
,
   Abs((Select Count(*)
    From SSISDB.internal.execution_data_statistics)
	-
   (Select Count(*)
    From SSISDBArchive.internal.execution_data_statistics)) As Delta_Execution_data_statisticsCount

Select
   (Select Count(*)
    From SSISDB.internal.event_message_context) As SSISDB_Event_message_contextCount
,
   (Select Count(*)
    From SSISDBArchive.internal.event_message_context) As SSISDBArchive_Event_message_contextCount
,
   Abs((Select Count(*)
    From SSISDB.internal.event_message_context)
	-
   (Select Count(*)
    From SSISDBArchive.internal.event_message_context)) As Delta_Event_message_contextCount

Select
   (Select Count(*)
    From SSISDB.internal.operation_permissions) As SSISDB_Operation_permissionsCount
,
   (Select Count(*)
    From SSISDBArchive.internal.operation_permissions) As SSISDBArchive_Operation_permissionsCount
,
   Abs((Select Count(*)
    From SSISDB.internal.operation_permissions)
	-
   (Select Count(*)
    From SSISDBArchive.internal.operation_permissions)) As Delta_Operation_permissionsCount

 end
Else
 begin
  print ' - SSISDBArchive database does not exist.'
 end
