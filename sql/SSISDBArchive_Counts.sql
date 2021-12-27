Use SSISDBArchive
go

Select Count(*) As OperationsCount
From SSISDBArchive.internal.operations

Select Count(*) As ExecutablesCount
From SSISDBArchive.internal.executables

Select Count(*) As ExecutionsCount
From SSISDBArchive.internal.executions

Select Count(*) As ValidationsCount
From SSISDBArchive.internal.validations

Select Count(*) As Operation_os_sys_infoCount
From SSISDBArchive.internal.operation_os_sys_info

Select Count(*) As Operation_messagesCount
From SSISDBArchive.internal.operation_messages

Select Count(*) As Extended_operation_infoCount
From SSISDBArchive.internal.extended_operation_info

Select Count(*) As Event_messagesCount
From SSISDBArchive.internal.event_messages

Select Count(*) As Executable_component_phasesCount
From SSISDBArchive.internal.execution_component_phases

Select Count(*) As Executable_statisticsCount
From SSISDBArchive.internal.executable_statistics

Select Count(*) As Execution_data_tapsCount
From SSISDBArchive.internal.execution_data_taps

Select Count(*) As Execution_parameter_valuesCount
From SSISDBArchive.internal.execution_parameter_values

Select Count(*) As Execution_property_override_valuesCount
From SSISDBArchive.internal.execution_property_override_values

Select Count(*) As Execution_data_statisticsCount
From SSISDBArchive.internal.execution_data_statistics

Select Count(*) As Event_message_contextCount
From SSISDBArchive.internal.event_message_context

Select Count(*) As Operation_permissionsCount
From SSISDBArchive.internal.operation_permissions



