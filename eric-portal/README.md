# Eric-Portal

> 一酷吧系统设计   
> 记录日常网站，先使用第三方工具组件实现各个业务，网站成型后在考虑微服务化继集成   
> 后端：Golang gin     
> 前端：angular 10 + ng-devui      
> 部署方式：前后端集成部署      
> 数据库：docker-mysql @ eric / 123456      
> *系统设计灵感来源*：        
>   - 工作生活中需要频繁的记录一些笔记、待办、保密信息等，而这些信息不一定时时刻刻都用得上，导致过一段时间就遗忘掉一部分，要用时又是一个头两个大，我本人也有这方面困惑，现有手机APP一般都不满足所有场景，并且安全性优待考察，所以设计本系统
>   - 系统需要一定程度的保密，需要登录模块
>   - 其他主要模块为：博客（笔记）、TODO（待办）、Memory Master（记忆大师，帮助个人记忆一些不常用但是偶尔有用的信息条目）

## 模块设计

1. 用户管理模块
    - 登录
    - 注册
    - 注销
    - 反馈
    - 忘记密码
    - 用户管理
    - 个人信息
    - 登陆管理

2. 系统管理
    - 菜单管理
    - 风格主题
    - 国际化
    - Others
   
3. 开发管理
    - 后端语言框架：Golang gin
    - 编码规范：gofmt
    - 前端框架：Amguar
    - 开发规范：Tslint
    - 数据库设计：Mysql
    - 数据规范

4. 博客（笔记）

5. TODO（待办）

6. Memory Master（记忆大师）

7. Portal

### Portal （仿菊花厂软件开发云平台）
1. 全局公告模块 - 在任何模块服务下都可以看到的公告模块
2. 局部公告模块 - 在当前服务下可以看到的服务模块
3. 积分系统 - 我的积分显示
4. 个人项目看板（暂定） - 左侧菜单分组 + 右侧检索看板显示
5. 新建项目功能
6. 新建分组功能



### 数据规范

1. 数据库表：存储引擎：InnoDB，默认字符集：utf8，排序规则：utf8_general_ci
2. 数据库表字段字符集：utf8，排序规则：utf8_general_ci
3. 数据库 无序ID字段：字段类型 `varchar(36)`，uuid 触发器设计：
    ```sql
        DROP TRIGGER IF EXISTS `gen_uuid`;
        DELIMITER ;;
        CREATE TRIGGER `gen_uuid` BEFORE INSERT ON `f_chapters` FOR EACH ROW set new.id = (replace(uuid(),"-",""))
        ;;
        DELIMITER ;
    ```
4. 数据字段验证规则设计
    - 名称类型：长度32字符以内，验证规则同 Windows 文件命名
    - 无序 ID 类型：varchar(36)，mysql uuid 函数自动生成
    - 有序 ID 类型：Bigint 类型，最长支持20位整数
    - 租户/用户名：4 - 16字符，中英文数字空格小数点中划线下划线
    - 密码类型：8 - 64位，至少包含特殊字符（!@#$%&*-_?.）、英文字母大小写、数字等其中的三种类型（字符、大写、小写、数字）
    
### 后端程序结构设计

1. main 主程序
2. config.yaml 配置文件
3. static 前端静态资源
4. utils 工具类
5. router 路由管理
6. controller 业务模块流程的控制
7. services 业务模块的应用逻辑应用设计
8. repository 数据层
9. model 数据库ORM实现
10. logs 日志记录
11. frontend 前端工程目录
12. entity 数据库 model 目录
13. mysql


