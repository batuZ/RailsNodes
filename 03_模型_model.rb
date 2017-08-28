#03_模型_model.rb

class Book < ActiceRecord::Baes
	#数据关联

	#这句应该在book模型中，意义为这个book是属于一个user的
	#当查找用户拥有的books时，这句起作用
	#创建book时要指定来自哪个user,并记下user_id
	#这个user就是当前登录的user,通过 @boos.user_id = session[:user_id] 进行记录
	belongs_to :user 

	#同时，这句应该在user模型中，意义为这个user拥有多个books
	#当删掉这个用户时，对应的书也将被删掉
	#并不对数据库进行操作
	has_many :books	 
	
	#验证数据,用model的方法 validates(),这属于不全面方法，最好在数据库中进行约束
	validates 	:bookName, 			#需要验证的属性
				presence: true, 	#存在验证，验证bookName是否存在 true
				length: {maxmum: 20, minmum: 5}, 	#长度验证
				format: {with: 正则},				#格式验证
				uniqueness: true, 					#验证唯一性,不区分大小写
				uniqueness: { case_sensitive: false}#验证唯一性,区分大小写
	# 验证邮箱的正则表达式
	EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	#获取错误信息
	@book.save
	@book.errors.full_messages

	#添加密码
	has_secure_password
	validates :password, length: {minmum: 6} 		#验证一个不小于6位数的密码



end