# 02_脚手架_scaffold.rb

cmd> rails generate scaffold User name:string email:string
cmd> rake db:migrate


#	在数据库中创建实例对象
rails generate scaffold book [field1:type field2:type ...]
#	在创建对象前，要先确保数据库存已连接，且有对应的表存在
#	在创建数据表时，表名要对实例对象名的复数形式，这样rails生成器
#	创建实例对象时只要声名对应的单数形式名称就可以了，否则rails找不到表

# ex> create table t_books(id int, b_name varchar(30));
# ex> rails generate scaffold t_book d: int b_name: varchar(30)
