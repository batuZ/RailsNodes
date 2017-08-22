# 01_路由_routes.rb

Rails.application.routes.draw do 
	# 资源路由，从7个默认路由中排除show动作
	resources :books, :except => show

	# 扩展资源路由
	resources :books do
		# 1､集合路由,不带对象ID，/books/newLY01
		get 'newLY01', :on => collection
		# 或
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
	#获得  请求如上时   跳转到  books控制器的show方法
	ex:
	<p>
		<%= link_to '示例一个链接'，show_books_path(1) %>
	</p>


	#设置根，下面是调用hello方法
	root 'application#hello'
	
end