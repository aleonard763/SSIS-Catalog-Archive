Use SSISDB
go

Select Count(*) As OperationsCount
From SSISDB.internal.operations

Select Count(*) As ExecutablesCount
From SSISDB.internal.executables

Select Count(*) As ExecutionsCount
From SSISDB.internal.executions

Select Count(*) As ValidationsCount
From SSISDB.internal.validations

Select Count(*) As Operation_os_sys_infoCount
From SSISDB.internal.operation_os_sys_info

Select Count(*) As Operation_messagesCount
From SSISDB.internal.operation_messages

Select Count(*) As Extended_operation_infoCount
From SSISDB.internal.extended_operation_info

Select Count(*) As Event_messagesCount
From SSISDB.internal.event_messages

Select Count(*) As Executable_component_phasesCount
From SSISDB.internal.execution_component_phases

Select Count(*) As Executable_statisticsCount
From SSISDB.internal.executable_statistics

Select Count(*) As Execution_data_tapsCount
From SSISDB.internal.execution_data_taps

Select Count(*) As Execution_parameter_valuesCount
From SSISDB.internal.execution_parameter_values

Select Count(*) As Execution_property_override_valuesCount
From SSISDB.internal.execution_property_override_values

Select Count(*) As Execution_data_statisticsCount
From SSISDB.internal.execution_data_statistics

Select Count(*) As Event_message_contextCount
From SSISDB.internal.event_message_context

Select Count(*) As Operation_permissionsCount
From SSISDB.internal.operation_permissions



