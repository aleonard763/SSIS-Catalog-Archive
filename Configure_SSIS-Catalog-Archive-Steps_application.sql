Use SSISFrameworkDB
go

/*  APPLICATION  */

declare @tblApp table(ApplicationID int)

/*  SSIS Catalog Archive Steps Application */
declare @ApplicationName nvarchar(130) = N'SSIS Catalog Archive Steps'
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

/* Util/Archive_SSISDB/_SSISDBArchive_Step_0.dtsx */
declare @PackageName nvarchar(260) = N'_SSISDBArchive_Step_0.dtsx'
declare @ProjectName nvarchar(128) = N'Archive_SSISDB'
declare @FolderName nvarchar(128) = N'Util'
declare @PackageID int = (Select PackageID 
                          From [custom].Packages
                          Where FolderName = @FolderName
						    And ProjectName = @ProjectName
							And PackageName = @PackageName)
declare @ExecutionOrder int = 10
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

/* Util/Archive_SSISDB/_SSISDBArchive_Step_1.dtsx */
set @PackageName = N'_SSISDBArchive_Step_1.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ExecutionOrder = 20
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

/* Util/Archive_SSISDB/_SSISDBArchive_Step_2.dtsx */
set @PackageName = N'_SSISDBArchive_Step_2.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ExecutionOrder = 30
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

/* Util/Archive_SSISDB/_SSISDBArchive_Step_3.dtsx */
set @PackageName = N'_SSISDBArchive_Step_3.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ExecutionOrder = 40
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

/* Util/Archive_SSISDB/_SSISDBArchive_Step_4.dtsx */
set @PackageName = N'_SSISDBArchive_Step_4.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ExecutionOrder = 50
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

/* Util/Archive_SSISDB/_SSISDBArchive_Step_5.dtsx */
set @PackageName = N'_SSISDBArchive_Step_5.dtsx'
set @ProjectName = N'Archive_SSISDB'
set @FolderName = N'Util'
set @PackageID = (Select PackageID 
                  From [custom].Packages
                  Where FolderName = @FolderName
				    And ProjectName = @ProjectName
					And PackageName = @PackageName)
set @ExecutionOrder = 60
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
From [custom].Applicationpackages ap
Join [custom].Applications a
  On a.ApplicationID = ap.ApplicationID
Join [custom].Packages p
  On p.PackageID = ap.PackageID
Where a.ApplicationName = N'SSIS Catalog Archive Steps'
Order By ap.ExecutionOrder ASC


