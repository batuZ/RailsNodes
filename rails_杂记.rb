require 'Win32API'
require 'rubygems'
#require 'mysql2'
#ss = Win32API.new("E:\\test\\test04\\testDll\\x64\\Debug\\testDll.dll", "sun",['I','I'], 'I')

gem install mysql2 –with-mysql-config='C:\Program Files\MySQL\MySQL Server 5.7\binmysql_config'

操作sqlite3
ATTACH DATABASE 'E:\RailsProject\program\development.sqlite3' As 'Al';
SELECT name,id FROM Al.projects WHERE id=1;
.database
.tables

SELECT * FROM Al.groups where project_id=1;
UPDATE COMPANY SET ADDRESS = 'Texas' WHERE ID = 6;