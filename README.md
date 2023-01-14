 ## goctl-template

 ### goctl go-zero 拓展模板


需要配合我修改的goctl生成代码  https://github.com/21888/goctl-chabai

model 增加了一些查询删除操作
rpc 会自动生成增删改查的示例代码,因为不想动model sql改的频繁 所以就把业务逻辑的操作尽可能的堆积在rpc了 后面可能会优化下model的生成