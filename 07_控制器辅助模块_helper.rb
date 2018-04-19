#07_控制器辅助模块_helper.rb

#与控制器同名的helper.rb中可以写非action的功能方法，供控制器调用

#功能：	1､减少controller中的代码
#		2､方法名命时可以使用更易阅读的名称

#使用时要把helper载入ApplecationController.rb
class ApplicationController < ActionController::Base
	protect_form_forgery with: :exceptio

	#增加下面一句来引用helper
	include SessionHelper
	include UserHelper
end

# 在sessions_helper.rb 中
module SessionHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	#返回当前User,供控制器使用
	def getUser
		# 当前实例变量是否为空，不为空直接返回，为空则去数据库找
		@thisUser = @thisUser || User.find_by(session[:user])
		@thisUser ||= User.find_by(session[:user])
	end

	#判断当前是否登录
	def logged_in?
		!getUser.nil?
	end

	#登出方法
	def log_out
		session.delete(:user_id)
		@thisUser = nil
	end
end




















