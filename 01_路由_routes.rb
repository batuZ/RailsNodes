# 01_路由_routes.rb

非常不错的路由教程：	https://rails-practice.com/content/Chapter_2/2.3.html

在控制台查看路由 rails routes

 

Rails.application.routes.draw do 
	resources :books, :except => show 	# 资源路由，从7个默认路由中排除show动作

	# 扩展资源路由

	resources :books do
		# 1､集合路由,不带对象ID，/books/newLY01
		get 'newLY01', :on => collection
		
		collection do
			get 'newLY02','newLY03'
		end

		# 2､成员路由,url中带对象ID，/books/:id/newLY04
		member do
			get 'newLY04','newLY05'
		end
	end


	# 手动增加一个一般路由，注意格式，		  命名路由,指定一个由路的别名(此名为全局的，唯一的)
	get 'books/:id', :to => 'books#show'  :as => 'show_books'

	#设置根，下面是调用hello方法
	root 'application#hello'
	
end


----->嵌套路由(默认为string,ex:rails g scaffold books type_id:integer price:decimal name)
rake db:drop
rake db:create
rails g scaffold User name password
rails g scaffold Project name user_id:integer
rails g scaffold Group name project_id:integer
rails g scaffold Photo name group_id:integer
rake db:migrate
