#10_表单_form.rb
#https://rails-practice.com/content/Chapter_3/3.2.html

1 搜索表单
<%= form_tag(路由, 处理方法) do %>
  <%= label_tag(:q) %>
  <%= text_field_tag(:q) %>
  <%= submit_tag("搜索") %>
<% end %>

路由: products_path
	  {action: "search"}
	  {:action=>"search", :controller=>"products"}
	  "/i/dont/know"

处理方法： method: "get"

submit_tag：发起一个在【路由】上的action,处理方法为GET

ex:
<%= form_tag(products_path, method: "get") do %>
  <%= label_tag(:q) %>
  <%= text_field_tag(:q) %>
  <%= submit_tag("搜索") %>
<% end %>


2 常用的表单辅助方法:

<%= text_area_tag(:message, "Hi, nice site", size: "24x6") %>
<%= password_field_tag(:password) %>
<%= hidden_field_tag(:parent_id, "5") %>
<%= search_field(:user, :name) %>
<%= telephone_field(:user, :phone) %>
<%= date_field(:user, :born_on) %>
<%= datetime_field(:user, :meeting_time) %>
<%= datetime_local_field(:user, :graduation_day) %>
<%= month_field(:user, :birthday_month) %>
<%= week_field(:user, :birthday_week) %>
<%= url_field(:user, :homepage) %>
<%= email_field(:user, :address) %>
<%= color_field(:user, :favorite_color) %>
<%= time_field(:task, :started_at) %>
<%= number_field(:product, :price, in: 1.0..20.0, step: 0.5) %>
<%= range_field(:product, :discount, in: 1..100) %>

解析后的代码是：
<textarea id="message" name="message" cols="24" rows="6">Hi, nice site</textarea>
<input id="password" name="password" type="password" />
<input id="parent_id" name="parent_id" type="hidden" value="5" />
<input id="user_name" name="user[name]" type="search" />
<input id="user_phone" name="user[phone]" type="tel" />
<input id="user_born_on" name="user[born_on]" type="date" />
<input id="user_meeting_time" name="user[meeting_time]" type="datetime" />
<input id="user_graduation_day" name="user[graduation_day]" type="datetime-local" />
<input id="user_birthday_month" name="user[birthday_month]" type="month" />
<input id="user_birthday_week" name="user[birthday_week]" type="week" />
<input id="user_homepage" name="user[homepage]" type="url" />
<input id="user_address" name="user[address]" type="email" />
<input id="user_favorite_color" name="user[favorite_color]" type="color" value="#000000" />
<input id="task_started_at" name="task[started_at]" type="time" />
<input id="product_price" max="20.0" min="1.0" name="product[price]" step="0.5" type="number" />
<input id="product_discount" max="100" min="1" name="product[discount]" type="range" />

3 模型（Model）表单
<%= form_for @product, :html => { :class => 'form-horizontal' } do |f| %>



5 注册和登录