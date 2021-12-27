 -- PROJECT CONNECTION PARAMETER LITERAL VALUES --

-- Archive_SSISDB\CM.ArchiveSSISDB.OLEDB.ConnectionString_0 Project Connection Parameter Literal
Declare @ProjectParameter_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0 sql_variant = N'Data Source=(local)\Nf;Initial Catalog=SSISDBArchive;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;Application Name=[SSIS].ArchiveSSISDB.ArchiveSSISDB.OLEDB;'

 ---------------------------- 

/*
Script Name: F:\_test\20211227\vDemo17-Nf\Util\3_vDemo17-Nf_SSISDB_Util_Archive_SSISDB_ArchiveSSISDB.OLEDB_projectconnection.literals.sql
Generated From Catalog Instance: vDemo17\Nf
Catalog Name: SSISDB
Folder Name: Util
Project Name: Archive_SSISDB
Project Connection Name: ArchiveSSISDB.OLEDB
Generated By: VDEMO17\A. Ray Leonard
Generated Date: 12/27/2021 7:24:32 AM
Generated From: CatalogBase v6.1.0.1
 executing on: VDEMO17
*/

print 'Script Name: F:\_test\20211227\vDemo17-Nf\Util\3_vDemo17-Nf_SSISDB_Util_Archive_SSISDB_ArchiveSSISDB_OLEDB_projectconnection.literals.sql
Generated From Catalog Instance: vDemo17\Nf
Catalog Name: SSISDB
Folder Name: Util
Project Name: Archive_SSISDB
Project Connection Name: ArchiveSSISDB.OLEDB
Generated By: VDEMO17\A. Ray Leonard
Generated Date: 12/27/2021 7:24:32 AM
Generated From: CatalogBase v6.1.0.1
 executing on: VDEMO17
'
print ''
print '------------------------------------------------------------'
print 'Deployed to Instance: ' + @@servername
print 'Deploy Date: ' + Convert(varchar,GetDate(), 101) + ' ' + Convert(varchar,GetDate(), 108)
print 'Deployed By: ' + original_login()
print '------------------------------------------------------------'
print ''

declare @object_type smallint = 20 -- project
declare @folder_name nvarchar(128) = N'Util'
declare @project_name nvarchar(128) = N'Archive_SSISDB'
declare @object_name nvarchar(260) = N'Archive_SSISDB' 
declare @value_type char(1) = 'V'
declare @validation_status char(1) = 'N'
declare @ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0 nvarchar(128) = N'CM.ArchiveSSISDB.OLEDB.ConnectionString'
declare @ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0_parameter_data_type nvarchar(128) = N'String'
declare @ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0_required bit = 0
declare @ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0_sensitive bit = 0
declare @ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0_description nvarchar(1024) = N''
declare @ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0_base_data_type nvarchar(128) = N'nvarchar'
declare @ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0_default_value sql_variant = N'Data Source=(local)\Nf;Initial Catalog=SSISDBArchive;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;Application Name=[SSIS].ArchiveSSISDB.ArchiveSSISDB.OLEDB;'
declare @ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0_design_default_value sql_variant = N'Data Source=(local)\Demo;Initial Catalog=SSISDBArchive;Provider=SQLNCLI11.1;Integrated Security=SSPI;Auto Translate=False;Application Name=[SSIS].ArchiveSSISDB.ArchiveSSISDB.OLEDB;'
declare @ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0_sensitive_default_value varbinary(max) = NULL
declare @ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0_value_set bit = 1
declare @ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0_referenced_variable_name nvarchar(128) = N''
---------------------------- 


declare @PrErrMsg varchar(100)
-- Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectByProxy Project Connection Parameter Literal
print 'Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectByProxy Project Connection Parameter Literal'
-- Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectByProxy Project Connection Parameter Literal
print ' - Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectByProxy Project Connection Parameter Literal'
If Exists(Select * 
          From SSISDB.[internal].[object_parameters] op 
  Where op.[object_type] = 20
    And op.[object_name] = N'Archive_SSISDB'
And op.parameter_name = N'CM.ArchiveSSISDB.OLEDB.ConnectByProxy' )
 begin
  -- Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectByProxy Project Connection Parameter Literal
  print ' - Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectByProxy Project Connection Parameter Literal'
  Exec [SSISDB].[catalog].[clear_object_parameter_value] 
      @object_type = 20 -- project 
    , @parameter_name = N'CM.ArchiveSSISDB.OLEDB.ConnectByProxy' 
    , @object_name = N'Archive_SSISDB' 
    , @project_name = N'Archive_SSISDB' 
    , @folder_name = N'Util' 
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectByProxy Project Connection Parameter Literal cleared'
 end
Else
 begin
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectByProxy Project Connection Parameter Literal does not exist.'
 end
print ''



-- Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Literal
print 'Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Literal'
-- Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Literal
print ' - Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Literal'
If Exists(Select * 
          From SSISDB.[internal].[object_parameters] op 
  Where op.[object_type] = 20
    And op.[object_name] = N'Archive_SSISDB'
And op.parameter_name = N'CM.ArchiveSSISDB.OLEDB.ConnectionString' )
 begin
  -- Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Literal
  print ' - Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Literal'
  Exec [SSISDB].[catalog].[clear_object_parameter_value] 
      @object_type = 20 -- project 
    , @parameter_name = N'CM.ArchiveSSISDB.OLEDB.ConnectionString' 
    , @object_name = N'Archive_SSISDB' 
    , @project_name = N'Archive_SSISDB' 
    , @folder_name = N'Util' 
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Literal cleared'
 end
Else
 begin
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Literal does not exist.'
 end
print ''



-- Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectUsingManagedIdentity Project Connection Parameter Literal
print 'Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectUsingManagedIdentity Project Connection Parameter Literal'
-- Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectUsingManagedIdentity Project Connection Parameter Literal
print ' - Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectUsingManagedIdentity Project Connection Parameter Literal'
If Exists(Select * 
          From SSISDB.[internal].[object_parameters] op 
  Where op.[object_type] = 20
    And op.[object_name] = N'Archive_SSISDB'
And op.parameter_name = N'CM.ArchiveSSISDB.OLEDB.ConnectUsingManagedIdentity' )
 begin
  -- Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectUsingManagedIdentity Project Connection Parameter Literal
  print ' - Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectUsingManagedIdentity Project Connection Parameter Literal'
  Exec [SSISDB].[catalog].[clear_object_parameter_value] 
      @object_type = 20 -- project 
    , @parameter_name = N'CM.ArchiveSSISDB.OLEDB.ConnectUsingManagedIdentity' 
    , @object_name = N'Archive_SSISDB' 
    , @project_name = N'Archive_SSISDB' 
    , @folder_name = N'Util' 
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectUsingManagedIdentity Project Connection Parameter Literal cleared'
 end
Else
 begin
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ConnectUsingManagedIdentity Project Connection Parameter Literal does not exist.'
 end
print ''



-- Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.InitialCatalog Project Connection Parameter Literal
print 'Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.InitialCatalog Project Connection Parameter Literal'
-- Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.InitialCatalog Project Connection Parameter Literal
print ' - Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.InitialCatalog Project Connection Parameter Literal'
If Exists(Select * 
          From SSISDB.[internal].[object_parameters] op 
  Where op.[object_type] = 20
    And op.[object_name] = N'Archive_SSISDB'
And op.parameter_name = N'CM.ArchiveSSISDB.OLEDB.InitialCatalog' )
 begin
  -- Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.InitialCatalog Project Connection Parameter Literal
  print ' - Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.InitialCatalog Project Connection Parameter Literal'
  Exec [SSISDB].[catalog].[clear_object_parameter_value] 
      @object_type = 20 -- project 
    , @parameter_name = N'CM.ArchiveSSISDB.OLEDB.InitialCatalog' 
    , @object_name = N'Archive_SSISDB' 
    , @project_name = N'Archive_SSISDB' 
    , @folder_name = N'Util' 
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.InitialCatalog Project Connection Parameter Literal cleared'
 end
Else
 begin
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.InitialCatalog Project Connection Parameter Literal does not exist.'
 end
print ''



-- Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.Password Project Connection Parameter Literal
print 'Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.Password Project Connection Parameter Literal'
-- Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.Password Project Connection Parameter Literal
print ' - Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.Password Project Connection Parameter Literal'
If Exists(Select * 
          From SSISDB.[internal].[object_parameters] op 
  Where op.[object_type] = 20
    And op.[object_name] = N'Archive_SSISDB'
And op.parameter_name = N'CM.ArchiveSSISDB.OLEDB.Password' )
 begin
  -- Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.Password Project Connection Parameter Literal
  print ' - Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.Password Project Connection Parameter Literal'
  Exec [SSISDB].[catalog].[clear_object_parameter_value] 
      @object_type = 20 -- project 
    , @parameter_name = N'CM.ArchiveSSISDB.OLEDB.Password' 
    , @object_name = N'Archive_SSISDB' 
    , @project_name = N'Archive_SSISDB' 
    , @folder_name = N'Util' 
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.Password Project Connection Parameter Literal cleared'
 end
Else
 begin
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.Password Project Connection Parameter Literal does not exist.'
 end
print ''



-- Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.RetainSameConnection Project Connection Parameter Literal
print 'Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.RetainSameConnection Project Connection Parameter Literal'
-- Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.RetainSameConnection Project Connection Parameter Literal
print ' - Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.RetainSameConnection Project Connection Parameter Literal'
If Exists(Select * 
          From SSISDB.[internal].[object_parameters] op 
  Where op.[object_type] = 20
    And op.[object_name] = N'Archive_SSISDB'
And op.parameter_name = N'CM.ArchiveSSISDB.OLEDB.RetainSameConnection' )
 begin
  -- Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.RetainSameConnection Project Connection Parameter Literal
  print ' - Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.RetainSameConnection Project Connection Parameter Literal'
  Exec [SSISDB].[catalog].[clear_object_parameter_value] 
      @object_type = 20 -- project 
    , @parameter_name = N'CM.ArchiveSSISDB.OLEDB.RetainSameConnection' 
    , @object_name = N'Archive_SSISDB' 
    , @project_name = N'Archive_SSISDB' 
    , @folder_name = N'Util' 
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.RetainSameConnection Project Connection Parameter Literal cleared'
 end
Else
 begin
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.RetainSameConnection Project Connection Parameter Literal does not exist.'
 end
print ''



-- Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ServerName Project Connection Parameter Literal
print 'Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ServerName Project Connection Parameter Literal'
-- Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ServerName Project Connection Parameter Literal
print ' - Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ServerName Project Connection Parameter Literal'
If Exists(Select * 
          From SSISDB.[internal].[object_parameters] op 
  Where op.[object_type] = 20
    And op.[object_name] = N'Archive_SSISDB'
And op.parameter_name = N'CM.ArchiveSSISDB.OLEDB.ServerName' )
 begin
  -- Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ServerName Project Connection Parameter Literal
  print ' - Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ServerName Project Connection Parameter Literal'
  Exec [SSISDB].[catalog].[clear_object_parameter_value] 
      @object_type = 20 -- project 
    , @parameter_name = N'CM.ArchiveSSISDB.OLEDB.ServerName' 
    , @object_name = N'Archive_SSISDB' 
    , @project_name = N'Archive_SSISDB' 
    , @folder_name = N'Util' 
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ServerName Project Connection Parameter Literal cleared'
 end
Else
 begin
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.ServerName Project Connection Parameter Literal does not exist.'
 end
print ''



-- Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.UserName Project Connection Parameter Literal
print 'Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.UserName Project Connection Parameter Literal'
-- Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.UserName Project Connection Parameter Literal
print ' - Check for Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.UserName Project Connection Parameter Literal'
If Exists(Select * 
          From SSISDB.[internal].[object_parameters] op 
  Where op.[object_type] = 20
    And op.[object_name] = N'Archive_SSISDB'
And op.parameter_name = N'CM.ArchiveSSISDB.OLEDB.UserName' )
 begin
  -- Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.UserName Project Connection Parameter Literal
  print ' - Clearing Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.UserName Project Connection Parameter Literal'
  Exec [SSISDB].[catalog].[clear_object_parameter_value] 
      @object_type = 20 -- project 
    , @parameter_name = N'CM.ArchiveSSISDB.OLEDB.UserName' 
    , @object_name = N'Archive_SSISDB' 
    , @project_name = N'Archive_SSISDB' 
    , @folder_name = N'Util' 
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.UserName Project Connection Parameter Literal cleared'
 end
Else
 begin
  print ' - Util\Archive_SSISDB\ArchiveSSISDB.OLEDB\CM.ArchiveSSISDB.OLEDB.UserName Project Connection Parameter Literal does not exist.'
 end
print ''



-- Util\Archive_SSISDB\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Literal
print ' - Add or Update ' + @folder_name + '\' + @project_name + '\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Literal'
If Exists(Select *
          From SSISDB.[catalog].[object_parameters] op 
          Join SSISDB.[catalog].projects p 
            On p.project_id = op.project_id
          Join SSISDB.[catalog].folders f 
            On f.folder_id = p.folder_id
          Where f.[name] = @folder_name
            And p.[name] = @project_name
            And op.[object_name] = @object_name
            And op.[parameter_name] = N'CM.ArchiveSSISDB.OLEDB.ConnectionString')
 begin
  -- If ((@ProjectParameter_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0 Is Not NULL) And(@ProjectParameter_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0 <> N''))
   -- begin
    print ' - Updating ' + @folder_name + '\' + @project_name + '\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Literal'
    Exec [SSISDB].[catalog].[set_object_parameter_value] 
        @object_type = @object_type 
      , @parameter_name = @ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0
      , @object_name = @object_name
      , @folder_name = @folder_name
      , @project_name = @project_name 
      , @parameter_value = @ProjectParameter_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0
      , @value_type = @value_type
    print ' - ' + @folder_name + '\' + @project_name + '\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Literal updated'
    if (@ProjectParameterName_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0_sensitive = 0)
     begin
      print ' - ' + @folder_name + '\' + @project_name + '\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Value set to: ' + Convert(varchar(1024), @ProjectParameter_CM_dot_ArchiveSSISDB_dot_OLEDB_dot_ConnectionString_0)
     end
    else
     begin
      print ' - ' + @folder_name + '\' + @project_name + '\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Value set to: *****'
     end
  --  end
  -- Else
  --  begin
  --   Set @ErrMsg = ' - NOT UPDATED! ' + @folder_name + '\' + @project_name + '\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter Value IS NULL or empty.'
  --   RaisError(@ErrMsg, 16, 1)
  --  end
 end
Else
 begin
    print ' - ' + @folder_name + '\' + @project_name + '\CM.ArchiveSSISDB.OLEDB.ConnectionString Project Connection Parameter does not exist.'
 end
print ''

---------------------------- 
