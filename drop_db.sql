-- Find and drop all databases that start with a given prefix (@dbPrefix below)
-- Command is not parameterised... because you can't with DDL
declare 
	@command nvarchar(max),
	@dbPrefix nvarchar(100);

set @command = '';
set	@dbPrefix = 'test_%';

select  @command = @command
+ 'alter database [' + [name] + ']  set single_user with rollback immediate;' 
+ 'drop database [' + [name] +'];'
from  [master].[sys].[databases] 
 where ( [name] not in ( 'master', 'model', 'msdb', 'tempdb')) and ([name] like 'test_%');

select @command;
execute sp_executesql @command;