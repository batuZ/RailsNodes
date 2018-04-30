# Scaffold 创建或删除资源套件的函数

#### 准备工作
```ruby

rails new Project --skip-bundle
source 'https://gems.ruby-china.org'
bundle
cd Project

```

#### 创建、删除
```ruby
# 互反操作
rails g scaffold ABC
rails d scaffold ABC

# 带参创建,创建名为ABC的资源，其中包括name(string时可以不标注类型)，number,size属性
rails g scaffold ABC name number:integer size:float

# 如果没有创建数据库
rake db:create


```
ps:创建过程和`Modled`非常相似，名称都是单数形式`User`，只是得到的结果不同

#### 创建的内容
    1、向数据库迁移的配置文件：[db/migrate/20180430105653_create_abcs.rb]()
    2、资源模型：app/models/abc.rb
    3、向路由中增加资源路由：resources :abcs
    4、资源控制器：app/controllers/ab_cs_controller.rb
    5、资源视图套装：app/views/ab_cs/*.*
    6、tests\helper\assets.coffee\assets.scss...
