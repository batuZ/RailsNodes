#05_控制器_controller.rb

class UserController < ApplicationController
	#这个方法是new.view通过路由调用的一个action
	def new
		#这个实例变量@user,将被对应的view和helper直接调用
		@user = User.new
	end

	def create
		# params是前端传入的参数集合。这里使用了集合中的 user 实例
		# 这里用传入的对象又实例化了一次，为什么？
		@user = User.new(params[:user])#或使用健壮参数(users_params)

		#判断是否创建成功
		if @user.save
			#保存成功的话，定向到这个实例的页面，调用当前控制器的show方法 url:user/id 
			redirect_to @user
		else
			# 失败则跳转到new视图,就是当前控制器下的new方法
			render 'new'
		end
	end

	def show
		# id 就是 url中的数字
		@user = User.find(params[:id])
	end

	#健壮参数,约束哪些参数允许传入
	def users_params
		params.requier(:user).permit(:userName, :email, :password ,:password_confime)
	end








end



