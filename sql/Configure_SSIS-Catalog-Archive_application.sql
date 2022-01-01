Use SSISFrameworkDB
go

/*  APPLICATION  */

declare @tblApp table(ApplicationID int)

/*  SSIS Catalog Archive Application */
declare @ApplicationName nvarchar(130) = N'SSIS Catalog Archive'
declare @ApplicationID int = (Select ApplicationID 
                              From [custom].Applications
                              Where ApplicationName = @ApplicationName)

print @ApplicationName + ' application'
If(@ApplicationID Is NULL)
 begin

  print ' - Adding ' + @ApplicationName + ' application'

  Insert Into [custom].Applications
  (ApplicationName)
  Output inserted.ApplicationID Into @tblApp
  Values
  (@ApplicationName)

  print ' - ' + @ApplicationName + ' application added'
  
  print ' - Setting ApplicationID'

  Set @ApplicationID = (Select ApplicationID From @tblApp)

  print ' - ApplicationID set to ' + Convert(varchar(12), @ApplicationID)

 end
Else
 begin
  print ' - ' + @ApplicationName + ' application already exists with ApplicationID: ' + Convert(varchar(12), @ApplicationID)
 end
print ''


/*  PACKAGES  AND APPLICATION PACKAGES  */

declare @tblPkg table(PackageID int)

/* Util/Archive_SSISDB/0-etl.executable_id.dtsx */
declare @PackageName nvarchar(260) = N'0-etl.executable_id.dtsx'
declare @ProjectName nvarchar(128) = N'Archive_SSISDB'
declare @FolderName nvarchar(128) = N'Util'
declare @ExecutionOrder int = 10
declare @PackageID int = (Select PackageID 
                          From [custom].Packages
                          Where FolderName = @FolderName
						    And ProjectName = @ProjectName
							And PackageName = @PackageName)
declare @ApplicationPackageID int = (Select ApplicationPackageID 
                                     From [custom].ApplicationPackages
                                     Where ApplicationID = @ApplicationID
							           And PackageID = @PackageID
							           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'

  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/0-etl.execution_id.dtsx */
set @PackageName = N'0-etl.execution_id.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 20
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/0-etl.operation_id.dtsx */
set @PackageName = N'0-etl.operation_id.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 30
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/0-etl.validation_id.dtsx */
set @PackageName = N'0-etl.validation_id.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 40
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/1-internal.executables.dtsx */
set @PackageName = N'1-internal.executables.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 50
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/1-internal.operations.dtsx */
set @PackageName = N'1-internal.operations.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 60
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/2-internal.executions.dtsx */
set @PackageName = N'2-internal.executions.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 70
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/2-internal.extended_operation_info.dtsx */
set @PackageName = N'2-internal.extended_operation_info.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 80
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/2-internal.operation_messages.dtsx */
set @PackageName = N'2-internal.operation_messages.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 90
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/2-internal.operation_os_sys_info.dtsx */
set @PackageName = N'2-internal.operation_os_sys_info.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 100
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/2-internal.validations.dtsx */
set @PackageName = N'2-internal.validations.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 110
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/3-internal.event_messages.dtsx */
set @PackageName = N'3-internal.event_messages.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 120
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/3-internal.executable_statistics.dtsx */
set @PackageName = N'3-internal.executable_statistics.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 130
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/3-internal.execution_component_phases.dtsx */
set @PackageName = N'3-internal.execution_component_phases.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 140
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/3-internal.execution_data_statistics.dtsx */
set @PackageName = N'3-internal.execution_data_statistics.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 150
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/3-internal.execution_data_taps.dtsx */
set @PackageName = N'3-internal.execution_data_taps.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 160
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/3-internal.execution_parameter_values.dtsx */
set @PackageName = N'3-internal.execution_parameter_values.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 170
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/3-internal.execution_property_override_values.dtsx */
set @PackageName = N'3-internal.execution_property_override_values.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 180
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/4-internal.event_message_context.dtsx */
set @PackageName = N'4-internal.event_message_context.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 190
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/4-internal.operation_permissions.dtsx */
set @PackageName = N'4-internal.operation_permissions.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 200
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Util/Archive_SSISDB/5-reset_etl_tables.dtsx */
set @PackageName = N'5-reset_etl_tables.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @ExecutionOrder = 210
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ApplicationPackageID = (Select ApplicationPackageID 
                             From [custom].ApplicationPackages
                             Where ApplicationID = @ApplicationID
					           And PackageID = @PackageID
					           And ExecutionOrder = @ExecutionOrder)

print @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'
If(@PackageID Is NULL)
 begin

  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package'

  Insert Into [custom].Packages
  (FolderName, ProjectName, PackageName)
  Output inserted.PackageID Into @tblPkg
  Values
  (@FolderName, @ProjectName, @PackageName)

  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package added'
    
  print ' - Setting PackageID'

  Set @PackageID = (Select PackageID From @tblPkg)

  print ' - PackageID set to ' + Convert(varchar(12), @PackageID)

  Delete @tblPkg

 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + ' package already exists with PackageID: ' + Convert(varchar(12), @PackageID)
 end

print ''
print @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
If(@ApplicationPackageID Is NULL)
 begin
  print ' - Adding ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package'
  Insert Into [custom].ApplicationPackages
  (ApplicationID, PackageID, ExecutionOrder)
  Values
  (@ApplicationID, @PackageID, @ExecutionOrder)
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package added'
 end
Else
 begin
  print ' - ' + @FolderName + '/' + @ProjectName + '/' + @PackageName + '[Execution Order: ' + Convert(varchar(12), @ExecutionOrder) + '] application package already exists with ApplicationPackageID: ' + Convert(varchar(12), @ApplicationPackageID)
 end
print ''

/* Test results */
Select 
   a.ApplicationName
 , p.FolderName
 , p.ProjectName
 , p.PackageName
 , ap.ExecutionOrder
 , ap.FailApplicationOnPackageFailure
From SSISFrameworkDB.[custom].Applicationpackages ap
Join SSISFrameworkDB.[custom].Applications a
  On a.ApplicationID = ap.ApplicationID
Join SSISFrameworkDB.[custom].Packages p
  On p.PackageID = ap.PackageID
Where a.ApplicationName = N'SSIS Catalog Archive'
Order By ap.ExecutionOrder ASC


