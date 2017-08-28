#09_调试_test.rb


1 调试相关的【视图】辅助方法
一个常见的需求是查看变量的值。在 Rails 中，可以使用下面这三个方法：

debug
to_yaml
inspect
----> debug 方法使用 YAML 格式渲染一个对象，把结果放在 <pre> 标签中，
			可以把任何对象转换成人类可读的数据格式。
<%= debug @user.name %>
<p>
  <b>Title:</b><%= @user.id %>
</p>

代替方案：<%='debug:'+ @user.name%>


----> inspect 另一个用于显示对象值的方法是 inspect，
				显示数组和散列时使用这个方法特别方便。
<%= @users.inspect %>
<p>
  <b>Title:</b>
  <%= @users.count %>
</p>

代替方案：<%= @users.each do |i| %>
		<%= i.name %><br/>
		<% end %>







2 日志记录器 【log】
log # => https://ruby-china.github.io/rails-guides/debugging_rails_applications.html
运行时把信息写入日志文件也很有用。Rails 分别为各个运行时环境维护着单独的日志文件。
Rails 使用 ActiveSupport::Logger 类把信息写入日志。
若想替换日志库，可以在 config/application.rb
或者在 config/environment.rb 中添加下述代码中的某一行：
		Rails.logger = Logger.new(STDOUT)
		Rails.logger = Log4r::Logger.new("Application Log")
默认情况下，日志文件都保存在 Rails.root/log/ 目录中

2.2 日志等级
如果想知道当前的日志等级，可以调用 Rails.logger.level 方法。
 :debug、:info、:warn、:error、:fatal 和 :unknown，分别对应数字 0-5。
 修改默认日志等级的方式如下：
		 config.log_level = :warn # 在环境的配置文件中
		Rails.logger.level = 0 # 任何时候
Rails 为所有环境设定的默认日志等级是 debug。

2.3 发送消息
把消息写入日志文件可以在控制器、模型或邮件程序中调用 logger.(debug|info|warn|error|fatal) 方法。
	logger.debug "Person attributes hash: #{@person.attributes.inspect}"
	logger.info "Processing the request..."
	logger.fatal "Terminating application, raised unrecoverable error!!!"
ex:

class ArticlesController < ApplicationController
  # ...
  def create
    @article = Article.new(params[:article])
    logger.debug "New article: #{@article.attributes.inspect}"
    logger.debug "Article should be valid: #{@article.valid?}"
 
    if @article.save
      flash[:notice] =  'Article was successfully created.'
      logger.debug "The article was saved and now the user is going to be redirected..."
      redirect_to(@article)
    else
      render action: "new"
    end
  end
  # ...
end



3 使用 byebug gem 调试【检查源码】
gem install byebug
http://www.jianshu.com/p/44940e159715
在任何 Rails 应用中都可以使用 byebug 方法呼出调试器。

class PeopleController < ApplicationController
  def new
    byebug					#进程挂起，跳进控制台
    @person = Person.new
    byebug
  end
end

var 		显示变量及其值
	all 		全部变量
	args		参数？
	const 		常量
	global		全局变量
	instance	实例变量
	local		？？
next 		执行一行或几行
step 		每步执行一个（或多个）块或方法
continue 	Ctrl+D 直接跳到下一个byebug,如果后面没有则退出byebug 
list(l) 	跳行命令
	l 45		跳到第45行
	l=			跳到当前停止位置
finish  	退出


(byebug) help
 
  break(b)   -- Sets breakpoints in the source code
  				#ex: b 16  在第16行设置断点 
  catch      -- Handles exception catchpoints
  				#处理异常捕获点
  condition  -- Sets conditions on breakpoints
  				#设置断点条件
  continue   -- 直接跳到下一个byebug,如果后面没有则退出byebug
  debug      -- Spawns a subdebugger
  				#产生一个subdebugger
  delete     -- Deletes breakpoints
  				#删除断点
  disable    -- Disables breakpoints or displays
  				#禁用断点或显示
  display    -- Evaluates expressions every time the debugger stops
  				#每次调试器停止时评估表达式
  down       -- Moves to a lower frame in the stack trace
  				#移动到堆栈轨迹中的下框架
  edit       -- Edits source files
				#编辑源文件
  enable     -- Enables breakpoints or displays
  				#启用断点或显示
  finish     -- Runs the program until frame returns
  				#运行程序直到帧返回
  frame      -- Moves to a frame in the call stack
  				#移动到调用堆栈中的一个帧
  help       -- Helps you using byebug
  history    -- Shows byebug's history of commands                          '
 				#显示byebug的命令历史
  info       -- Shows several informations about the program being debugged
  				#显示有关被调试程序的几个信息
  interrupt  -- Interrupts the program
  				#中断程序
  irb        -- Starts an IRB session
  				#启动IRB会话
  kill       -- Sends a signal to the current process
  				#向当前进程发送信号
  list       -- Lists lines of source code
  				#列出源代码行
  method     -- Shows methods of an object, class or module
  				#显示对象，类或模块的方法
  next       -- 执行下一行，next 3 执行三行
  pry        -- Starts a Pry session
  				#启动一个Pry会话
  quit       -- Exits byebug
  restart    -- Restarts the debugged program
  				#重新启动调试程序
  save       -- Saves current byebug session to a file
  				#将当前byebug会话保存到文件
  set        -- Modifies byebug settings
  				#修改byebug设置
  show       -- Shows byebug settings
  				#显示byebug设置
  source     -- Restores a previously saved byebug session
  				#恢复以前保存的byebug会话
  step       -- Steps into blocks or methods one or more times
  				#每步执行一个（或多个）块或方法 对应 next
  thread     -- Commands to manipulate threads
  				#操纵线程命令
  tracevar   -- Enables tracing of a global variable
  				#启用跟踪全局变量
  untracevar -- Stops tracing a global variable
  				#停止跟踪全局变量
  undisplay  -- Stops displaying all or some expressions when program stops
  				#当程序停止时停止显示所有或某些表达式
  up         -- Moves to a higher frame in the stack trace
  				#移动到堆栈跟踪中的较高帧
  var        -- Shows variables and its values
  				#显示变量及其值
  where      -- Displays the backtrace
 				#显示回溯
(byebug)
