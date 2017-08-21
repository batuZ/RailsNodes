# => 参考网站 https://ruby-china.github.io/rails-guides/ (中文)


#	创建项目
cmd> rails new ProjectName -d=mysql 
								oracle 
								postgresql
								sqlite3	(默认)

#   修改程序源
# new 项目进入bundle install 时 Ctrl + C 停止安装
# 修改项目目录中已经生成的配置文件 Gemfile
# 把原来的 source 'https://rubygems.org'
# 修改为   source 'https://ruby.taobao.org'
# 再次运行 bundle install


#	启动
cmd> rails server
cmd> rails s
: << !
	-p 指定服务端口
	-b 指定服务IP
	-c 使用自定义rackup
	-d 使用服务器运行时作为系统守护进程
	-u 启用debug模式
	-e 指定运行环境 devlopment(默认)\test\production 
!



#	停止
cmd> Ctrl + C


#	配置数据库环境
 ../config/database.yml

# 手动连接数据库
cmd> /usr/local/mysql-5.7.18-macos10.12-x86_64/bin/mysql -uroot -proot

# 设置启动主页 ../config/routes.rb
		Rails.application.routes.draw do
		  get 'home/index'		#默认

		  #页面方法 要执行 cmd> rails routes 才能生成
		  resources :articles	 


		  root 'home#index'		#访问根地址时加载此页面
		end


#	在数据库中创建实例对象
rails generate scaffold book [field1:type field2:type ...]
#	在创建对象前，要先确保数据库存已连接，且有对应的表存在
#	在创建数据表时，表名要对实例对象名的复数形式，这样rails生成器
#	创建实例对象时只要声名对应的单数形式名称就可以了，否则rails找不到表

# ex> create table t_books(id int, b_name varchar(30));
# ex> rails generate scaffold t_book d: int b_name: varchar(30)


# => 创建一个控制器
	rails generate(g) controller Welcome index happy ...
	(逆向操作 rails g destroy welcome index happy ...)
# => 生成的主要内容：
		# => app/controllers/welcome_controller.rb
		# => app/views/welcome/index.html.erb

# => 创建一个模型
 	rails generate model Book title:string text:text
# => 生成的主要内容：
		# => app/models/book.rb
		# => db/migrate/20140120191729_create_book.rb 

！！！ 创建 scoffold model 用单数首字母大写，controller 用复数，小写  ！！！



