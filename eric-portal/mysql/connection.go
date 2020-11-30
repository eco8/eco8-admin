package mysql

import (
	"database/sql"
	"eric-portal/service/config"
	log "eric-portal/utils/logs"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"time"
)

type Connection struct {
	db *sql.DB
}

var DB *sql.DB

func init() {
	log.Trace("Init Mysql")
	DB = initConnect()
}

func initConnect() *sql.DB {
	log.Info(fmt.Sprintf("Mysql dbDSN: %s", getDbDSN()))
	DB, err := sql.Open("mysql", getDbDSN())
	if err != nil {
		log.Err(fmt.Sprintf("Mysql connection failed: %s", err.Error()))
	}

	if DB == nil {
		log.Err("Mysql connection failed, Object DB is nil!")
		return DB
	}

	// 设置最大连接数
	DB.SetMaxOpenConns(100)

	// 空闲连接数
	DB.SetMaxIdleConns(20)

	// 最大连接周期
	DB.SetConnMaxLifetime(100 * time.Second)

	// 测试DB对象是否可用
	if err := DB.Ping(); err != nil {
		log.Err(fmt.Sprintf("数据库连接失败: %s", err.Error()))
	} else {
		fmt.Println("Mysql 连接成功！")
	}
	return DB
}

/**
Mysql struct {
	Host     string `yaml:"host"`
	Port     uint16 `yaml:"port"`
	Database string `yaml:"database"`
	UserName string `yaml:"userName"`
	Password string `yaml:"password"`
	Charset  string `yaml:"charset"`
}
*/
func getDbDSN() string {
	mysqlConf := config.CFG.Mysql
	return fmt.Sprintf("%s:%s@tcp(%s:%d)/%s", mysqlConf.UserName, mysqlConf.Password, mysqlConf.Host, mysqlConf.Port, mysqlConf.Database)
}
