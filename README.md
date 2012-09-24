MSTC.ZJU (Microsoft Technology Club of Zhejiang University) 纳新报名表提交及管理网站

版权所有 (C) 2011 - 2012 MSTC.ZJU, 保留所有权利

安装 / 运行
===========
推荐使用 [rbenv](/sstephenson/rbenv) 安装 ruby 1.9.3。

```bash
# 安装依赖
bundle install

# 准备数据库
bundle exec db:migrate

# 运行 (localhost:5000, localhost:5001)
./script/thin.sh start
```

推荐配置 nginx / apache 服务静态文件 (public/) 并反向代理到 thin 服务。

配置 / Hacking
==============

报名截止日期
------------
在 `app/controllers/forms_controller.rb` 文件中, 修改 `DEADLINE`

数据库
------
检查 `config/database.yml`

thin
----
检查 `config/thin.yml`

Staff 身份认证
--------------
检查 `config/initializers/devise_mstc.rb`


问题
====
请在 MSTC.ZJU 邮件列表讨论

