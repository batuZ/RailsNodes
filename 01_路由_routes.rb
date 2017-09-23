# 01_路由_routes.rb

非常不错的路由教程：	https://rails-practice.com/content/Chapter_2/2.3.html

在控制台查看路由 rails routes
在页面查看路由 http://localhost:3000/rails/info/routes
用户验证gem https://github.com/plataformatec/devise
			https://rails-practice.com/content/Chapter_6/6.6.html
Rails.application.routes.draw do 

	# 资源路由，从7个默认路由中排除show动作
	resources :books, :except => show 	
	resources :books, only: [:show]

	# 扩展资源路由
	resources :books do
		get 'newLY01', :on => collection
		collection do
			get 'newLY02','newLY03'
		end
		member do
			get 'newLY04','newLY05'
		end
	end

	# 手动增加一个一般路由，注意格式，		  命名路由,指定一个由路的别名(此名为全局的，唯一的)
	get 'books/:id', :to => 'books#show'  :as => 'show_books'

	#嵌套
	resources :users do
	resources :projects, shallow: true
	end

	resources :projects, only: [] do 
	resources :groups, shallow: true
	end

	resources :groups, only: [] do
	resources :photos, shallow: true
	end 

	#设置根，下面是调用hello方法
	root 'application#hello'
	
end


----->嵌套路由(默认为string,ex:rails g scaffold books type_id:integer price:decimal name)
rake db:drop
rake db:create
rails g scaffold User name password_digest
rails g scaffold Project name user_id:integer
rails g scaffold Group name project_id:integer
rails g scaffold Photo name group_id:integer
rake db:migrate
