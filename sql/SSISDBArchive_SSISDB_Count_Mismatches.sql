Use SSISDB
go

print '-------------------------------------------------'
print ' SSISDB - SSISDBArchive Counts Validation Script '
print '-------------------------------------------------'
print ''

print 'SSISDB Archive database check'
print ''

If Exists (Select [name]
           From [sys].[databases]
		   Where [name] = N'SSISDBArchive')
 begin

  declare @MatchedTablesCount int = 0
  declare @MisMatchedTablesCount int = 0

if(
   (Select Count(*) As OperationsCount
    From SSISDB.internal.operations)
	<>
   (Select Count(*) As OperationsCount
    From SSISDBArchive.internal.operations)
  )
 begin
  print 'internal.operations count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As ExecutablesCount
    From SSISDB.internal.executables)
	<>
   (Select Count(*) As ExecutablesCount
    From SSISDBArchive.internal.executables)
  )
 begin
  print 'internal.executables count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As ExecutionsCount
    From SSISDB.internal.executions)
	<>
   (Select Count(*) As ExecutionsCount
    From SSISDBArchive.internal.executions)
  )
 begin
  print 'internal.executions count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As ValidationsCount
    From SSISDB.internal.validations)
	<>
   (Select Count(*) As ValidationsCount
    From SSISDBArchive.internal.validations)
  )
 begin
  print 'internal.validations count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As Operation_os_sys_infoCount
    From SSISDB.internal.operation_os_sys_info)
	<>
   (Select Count(*) As Operation_os_sys_infoCount
    From SSISDBArchive.internal.operation_os_sys_info)
  )
 begin
  print 'internal.operation_os_sys_info count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As Operation_messagesCount
    From SSISDB.internal.operation_messages)
	<>
   (Select Count(*) As Operation_messagesCount
    From SSISDBArchive.internal.operation_messages)
  )
 begin
  print 'internal.operation_messages count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As Extended_operation_infoCount
    From SSISDB.internal.extended_operation_info)
	<>
   (Select Count(*) As Extended_operation_infoCount
    From SSISDBArchive.internal.extended_operation_info)
  )
 begin
  print 'internal.extended_operation_info count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As Event_messagesCount
    From SSISDB.internal.event_messages)
	<>
   (Select Count(*) As Event_messagesCount
    From SSISDBArchive.internal.event_messages)
  )
 begin
  print 'internal.event_messages count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As Executable_component_phasesCount
    From SSISDB.internal.execution_component_phases)
	<>
   (Select Count(*) As Executable_component_phasesCount
    From SSISDBArchive.internal.execution_component_phases)
  )
 begin
  print 'internal.execution_component_phases count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As Executable_statisticsCount
    From SSISDB.internal.executable_statistics)
	<>
   (Select Count(*) As Executable_statisticsCount
    From SSISDBArchive.internal.executable_statistics)
  )
 begin
  print 'internal.executable_statistics count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As Execution_data_tapsCount
    From SSISDB.internal.execution_data_taps)
	<>
   (Select Count(*) As Execution_data_tapsCount
    From SSISDBArchive.internal.execution_data_taps)
  )
 begin
  print 'internal.execution_data_taps count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As Execution_parameter_valuesCount
    From SSISDB.internal.execution_parameter_values)
	<>
   (Select Count(*) As Execution_parameter_valuesCount
    From SSISDBArchive.internal.execution_parameter_values)
  )
 begin
  print 'internal.execution_parameter_values count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As Execution_property_override_valuesCount
    From SSISDB.internal.execution_property_override_values)
	<>
   (Select Count(*) As Execution_property_override_valuesCount
    From SSISDBArchive.internal.execution_property_override_values)
  )
 begin
  print 'internal.execution_property_override_values count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As Execution_data_statisticsCount
    From SSISDB.internal.execution_data_statistics)
	<>
   (Select Count(*) As Execution_data_statisticsCount
    From SSISDBArchive.internal.execution_data_statistics)
  )
 begin
  print 'internal.execution_data_statistics count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As Event_message_contextCount
    From SSISDB.internal.event_message_context)
	<>
   (Select Count(*) As Event_message_contextCount
    From SSISDBArchive.internal.event_message_context)
  )
 begin
  print 'internal.event_message_context count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(
   (Select Count(*) As Operation_permissionsCount
    From SSISDB.internal.operation_permissions)
	<>
   (Select Count(*) As Operation_permissionsCount
    From SSISDBArchive.internal.operation_permissions)
  )
 begin
  print 'internal.operation_permissions count mismatch'
  Set @MisMatchedTablesCount = @MisMatchedTablesCount + 1
 end
else
 begin
  Set @MatchedTablesCount = @MatchedTablesCount + 1
 end

if(@MisMatchedTablesCount > 0)
 begin
  print ''
  print Convert(varchar(12), @MisMatchedTablesCount) + ' tables mismatched.'
  print ''
  print 'Counts for internal.operation_messages, internal.event_messages,
internal.executable_statistics, and internal.event_message_context
may not match if the Archive_SSISDB project is executed in the SSIS Catalog.
This is not as much by design as by the nature of the SSIS Catalog.'
 end

if(@MatchedTablesCount > 0)
 begin
  print ''
  print Convert(varchar(12), @MatchedTablesCount) + ' tables matched.'
 end

 end
Else
 begin
  print ' - SSISDBArchive database does not exist.'
 end
