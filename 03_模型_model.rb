#03_模型_model.rb

class Book < ActiceRecord::Baes
	#数据关联
	belons_to :user
	has_many :users
	
	#验证数据,用model的方法 validates(),这属于不全面方法，最好在数据库中进行约束
	validates 	:bookName, 			#需要验证的属性
				presence: true, 	#存在验证，验证bookName是否存在 true
				length: {maxmum: 20, minmum: 5}, 	#长度验证
				format: {with: 正则},				#格式验证
				uniqueness: true, 					#验证唯一性,不区分大小写
				uniqueness: { case_sensitive: false}#验证唯一性,区分大小写

	#添加密码
	has_secuer_password
	validates :password, length: {minmum: 6} 		#验证一个不小于6位数的密码
end