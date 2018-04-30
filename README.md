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

```
		ps:创建过程和Modled非常相似，名称都是单数形式(User)，只是得到的结果不同

#### 创建的内容
		1､
		2､
		3､