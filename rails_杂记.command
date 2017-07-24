https://ruby-china.github.io/rails-guides/ (中文)
http://guides.rubyonrails.org/routing.html（英文）


#	创建项目
cmd> rails new ProjectName -d=mysql/oracle/postgresql/sqlite3(默认)


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


#	配置数据库环境 ../config/database.yml


#	创建一个控制器 路径／名称
#	rails generate(g) controller home index


#	设置启动主页 ../config/routes.rb
Rails.application.routes.draw do
  get 'home/index'
  resources :articles
#   Rails 提供了 resources 方法，用于声明标准的 REST 资源。
#              POST   /articles(.:format)          articles#create
#  new_article GET    /articles/new(.:format)      articles#new
# edit_article GET    /articles/:id/edit(.:format) articles#edit
#      article GET    /articles/:id(.:format)      articles#show
#              PATCH  /articles/:id(.:format)      articles#update
#              PUT    /articles/:id(.:format)      articles#update
#              DELETE /articles/:id(.:format)      articles#destroy

  root 'home#index'
end


#	修改controller ../app/views/home/index.html.erb


#	在数据库中创建实例对象
rails generate scaffold book [field1:type field2:type ...]
#	在创建对象前，要先确保数据库存已连接，且有对应的表存在
#	在创建数据表时，表名要对实例对象名的复数形式，这样rails生成器
#	创建实例对象时只要声名对应的单数形式名称就可以了，否则rails找不到表

# ex> create table t_books(id int, b_name varchar(30));
# ex> rails generate scaffold t_book d: int b_name: varchar(30)









