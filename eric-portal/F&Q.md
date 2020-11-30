1. Mysql 外键关联两个bigint类型字段时，一直报错不兼容。
    - 检查两个字段是否设置为无符号整型字段
    - 一个设置无符号另一个默认（有符号）就会冲突

2. Go 连接Mysql需要 `github.com/go-sql-driver/mysql` 注入mysql驱动到 `database/sql` 包中去，因此需要在import中引入 `_ "github.com/go-sql-driver/mysql"`