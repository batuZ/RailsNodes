06_会话保持_sessions.rb

rails 4.+

#1､添加一个保持控制器
rails g controller Sessions new

#2､然后修改路由，添加以下内容
#手动添加sessions路由
	get 'login' => 'sessions#new'  			#对应的view显示登录页面
	post 'login' => 'sessions#create'		#登录动作
	delete 'login' => 'sessions#destroy'	#退出登录动作

#3､搞个登录view  看视频14

#4､在控制器里添加create
class SessionsController < ApplicationController
	def new
	end

	def create
		# find_by 没有找到时返回nil,find找不到会报错
		# downcase 强转小写
		@user = find_by(email: params[:sessions][:email].downcase)

		#进行判断
		if(@user && # @user 是否为空
			@user.thuthenticate(params[:sessions][:password]))# 密码是否匹配

			# 会话保持的关键，sessions[:user_id]是个唯一的全局变量？这里有内空说明已经在登录状态
			# 可以在注册用户后直接进入登录状态
			sessions[:user_id] = @user.id 

		else
			#不成功，跳到登录页面
			render 'new'
		end
	end

	def destory
		session.delete(:user_id)
		render 'new'
	end
end

