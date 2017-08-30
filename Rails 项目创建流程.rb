# AM 项目创建流程.rb
# => 参考网站 https://ruby-china.github.io/rails-guides/ (中文)

rails new automesh -d=mysql
rake db:create
rails g scaffold User name:string password:string
rails g scaffold Project name:string user_id:integer
rails g scaffold Group name:string project_id:integer
rails g scaffold Photo name:string group_id:integer
rails g controller sessions new create destroy

rake
rails db:migrate

rails g scaffold variant product_id:integer price:decimal size
rails d scaffold User
rails d scaffold Project
rails d scaffold Group
rails d scaffold Photo
rails d controller sessions


结构：

主页{
	非用户内容{
		AM介绍
		下载
		技术文档
		公开案例
		...
	}

	登录页面{
		登录
		注册
	}
}

用户{
	项目管理{
		新建项目
		历史项目
		删除项目
		查看项目
		导出成果
		分享
	}

	账户管理{
		登出
	}
}


#decimal 小数


# => 1、创建项目
	# => cmd> rails new AM_Server -d=mysql --skip-bundle
	rails new AM_Server -d=mysql
	rails db:create
 	gem 'bcrypt', '~> 3.1.7' #开启验证密码
# => 2、配置项目
	# => 2.1 配置数据库环境  ../config/database.yml
	# => 设置密码为 root
	# => 手动在mysql中创建对应的数据库
		create database am_server_devlopment;

# => 3、启动项目服务
	# => 3.1 cmd> rails server(s) -p 4004 -b 192.168.2.11 -u 启用debug模式 -e devlopment(默认)\test\production 
	rails server

# => 4、创建contorller 
	# => 4.1 cmd> rails generate(g) controller Welcome(am主页) index
	rails gcontroller Welcome index

# => 5、设置应用主页路由
	# => 5.1 修改 ../config/routse.rb  在方法中增加一句 root 'welcome#index'
	root 'welcome#index'

# => 6､脚手架
rails g scaffold User name:string email:string
rails g scaffold Project name:string user_id:integer
rails g scaffold Group name:string project_id:integer
rails g scaffold Photo name:string	group_id:integer

# => 6、创建资源 
	# => 6.1 资源是各种实例的类型，定义了创建、读取、更新、删除的动作
	# => 6.2 在 ../config/routse.rb  在方法中增加一句 resources :articles（类名）
	# => 6.3 然后在命令行中运行 rails routes 进行资源创建
	# => 6.4 创建一个 ArticclesController 
	# => 6.5 在这个文件夹中创建一个 new.html.erb 文件，内面写点什么


# => 7、创建 Article 模型
	#/usr/local/mysql-5.7.18-macos10.12-x86_64/bin/mysql -uroot -proot
	# => 7.1 cmd > rails generate(g) model Article title:string text:text 对应数据库中的表
	rails generate model User user_name:string user_email:text
	rails g model Group grp_name:string fouce: double pixclsize: double
	#rails destroy model User
	rails generate scaffold User user_name:string user_email:string
	#rails destroy scaffold User 
	rails db:migrate

# => 8､迁移 
	rails db:migrate

# => 9､修改属性字段
	rails g migration add_user_id_to_books user_id:id
	rails db:migrate

# => 10､创建关系
