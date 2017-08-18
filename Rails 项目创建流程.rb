# Rails 项目创建流程.rb

# => 1、创建项目
cmd> rails new ProjectName -d=mysql
	# => 1.1 Ctrl C 暂停环境配置
	# => 1.2 更改源 source 'https://rubygems.org' => source 'https://ruby.taobao.org'
	# => 1.3 cd ProjectName 进入项目目录后运行 bundle install 完成配置

# => 2、配置项目
	# => 2.1 配置数据库环境  ../config/database.yml

# => 3、启动项目服务
	# => 3.1 cmd> rails server -p4004 -b192.168.2.11 -u启用debug模式 -e devlopment(默认)\test\production 

# => 4、创建contorller 
	# => 4.1 cmd> rails generate controller Welcome(控制器) index(动作) 

# => 5、设置应用主页
	# => 5.1 修改 ../config/routse.rb  在方法中增加一句 root 'welcome#index'

# => 6、创建一个资源  http://localhost:3000/articles/new
	# => 6.1 资源是各种实例的类型，定义了创建、读取、更新、删除的动作
	# => 6.2 在 ../config/routse.rb  在方法中增加一句 resources :articles（类名）
	# => 6.3 然后在命令行中运行 rails routes 进行资源创建
		# => 这时访问http://localhost:3000/articles/new 会出现错误页面
		# => 提示缺少 ArticlesController
	# => 6.4 创建一个 ArticclesController 
		# => cmd > rails generate controller Articles 会出现错误
		# => 提示缺少new方法，在 ../app/controllers/articies_controller.rb 中增加 new 方法
		# => 还缺少articies_controller对应的View, 手动创建一个 ../app/views/articles 文件夹，
		# => 在这个文件夹中创建一个 new.html.erb 文件，内面写点什么.
	# => 6.5 还有一些动作及连接规则需要近一步了解。。。。

# => 7、创建 Article 模型
	# => 7.1 cmd > rails generate model Article title:string text:text 对应数据库中的表

