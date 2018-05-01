## Routes,路由管理列表

##### 设置首页
```ruby
	root 'rootview#index'
```

##### 手动配置一般路由
```ruby
// http动作（url,controller.action)
get 'rootview/happy',:to => 'rootview#happy'
```