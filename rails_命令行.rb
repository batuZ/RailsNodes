bin/rails 命令说明.command

参考网址：			https://ruby-china.github.io/rails-guides/command_line.html
Rails命令大全：		http://www.cnblogs.com/wang123/archive/2009/09/16/1567774.html
Web 安全和 Rails： 	https://ruby-china.org/topics/31114
非常不错的路由教程：	https://www.gitbook.com/download/pdf/book/liwei78/rails-practice
非常不错的路由教程：	https://rails-practice.com/content/Chapter_2/2.3.html
------> 有些命令在 Rails 开发过程中经常会用到，下面按照使用频率列出：




rails dbconsole(db)		--与数据库交互
rails generate(g)		--创建模版
bin/rails 				--5.x新增了rake功能，代替rails,区别不大
rails server(s)			--启动服务
rails console(c)		--在命令行中与 Rails 应用交互 (IRB)
rails runner(r)			--以非交互的方式运行 Ruby 代码
rails destroy			--rails generate的逆操作
rake routes				--查看所有路由
这些命令都可指定 -h 或 --help 选项列出更多信息。


cmd> rails db:create 创建数据库

------> 修改程序源
new 项目进入bundle install 时 Ctrl + C 停止安装
修改项目目录中已经生成的配置文件 Gemfile
把原来的 source 'https://rubygems.org'
修改为   source 'https://ruby.taobao.org'
再次运行 bundle install

------> 启动
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


------> 查看全部路由
rake routes


------> 设置mac环境变量
sudo vi ~/.bash_profile
export PATH="/usr/local/mysql-5.7.18-macos10.12-x86_64/bin:$PATH"
:w 回车

------> 手动连接数据库
cmd> /usr/local/mysql-5.7.18-macos10.12-x86_64/bin/mysql -uroot -proot



------> 迁移
bundle exec rake db:migrate
rake db:migrate


------> 通过迁移文件向已有books模型中增加user_id字段(视频15)
rails g migration add_user_id_to_books user_id:id

rake db:drop
rake db:create
rake db:migrate


------> 在项目目录下使用控制台操作模型数据
rails control
ex: 
auser = User.new(userName => 'batu', email => 'batu@gvitech.com') 	#返回user对象,对象保留在内存中
auser.save 	#返回true
auser.destroy 
User.destroy 'id'

------> 通过 rake seed 初始化数据
	在 /db/seeds.rb中编写ruby
	在cmd 中 rake seed 执行


------> 调试方法
	console.log('')
	alert('')
