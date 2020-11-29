package log

import (
	"eric-portal/service/config"
	"fmt"
	"github.com/robfig/cron"
	"log"
	"os"
	"time"
)

// 日志系统
// 1. 定时关闭上个日志文件，打开新的日志文件并写入
// 2. 日志分级：Trace、Info、Warn、Error

var Logger *log.Logger

func init() {
	intervalDealFile()
	initLogger()
}

type intervalJob struct {
}

func (this *intervalJob) Run() {
	fmt.Println("定时更新日志文件")
	initLogger()
}

func intervalDealFile() {
	fmt.Println("Log system Initing.")
	c := cron.New()
	// 每5秒打印一次
	//_ = c.AddFunc("0/5 * * * * ?", func() {
	// 每30分钟打印一次
	_ = c.AddFunc("* * 0/30 * * ?", func() {
		Trace("测试定时任务执行成功")
	})

	// 每天重新创建日志文件
	_ = c.AddJob("0 0 0 0/1 * ?", &intervalJob{})
	//c.AddJob("0 0/1 * * * ?", &intervalJob{})
	c.Start()
	//defer c.Stop()
	//select {}
}

// 一般日志
func Trace(msg string) {
	writeLog("[TRACE] ", msg)
}

// 提示信息日志
func Info(msg string) {
	writeLog("[INFO]  ", msg)
}

// 警告信息日志
func Warn(msg string) {
	writeLog("[WARN]  ", msg)
}

// 错误信息日志
func Err(msg string) {
	writeLog("[ERROR] ", msg)
}

func writeLog(msgType string, msg string) {
	Logger.SetPrefix(msgType)
	_ = Logger.Output(2, msg)
	// 每次日志写入后都重置前缀为 TRACE
	Logger.SetPrefix("[TRACE] ")
}

var logFile *os.File

func getLogFile() *os.File {
	Dir := config.CFG.Logger.Dir
	File := config.CFG.Logger.FilePrefix
	today := time.Now().Format("2006-01-02-03-04-05")
	logFileName := Dir + "/" + File + "-" + today + ".log"
	fmt.Println("日志文件名称： ", logFileName)
	lf, err := os.OpenFile(logFileName, os.O_CREATE, 0755)
	if err != nil {
		fmt.Println("创建/打开日志文件错误！", err.Error())
	}
	return lf
}

func initLogger() {
	// initial log file
	if logFile != nil {
		m := fmt.Sprintf("关闭旧的日志文件：%s", logFile.Name())
		Trace(m)
		Info(fmt.Sprintf("---------------------- log end %s ----------------------", logFile.Name()))
		_ = logFile.Close()
	}

	logFile = getLogFile()

	//Logger := log.New(logFile, "test_", log.Ldate|log.Ltime|log.Lshortfile);
	Logger = log.New(logFile, "[TRACE] ", log.Ldate|log.Ltime)
	Info(fmt.Sprintf("---------------------- log start %s ----------------------", logFile.Name()))

	//Flags返回Logger的输出选项
	//fmt.Println("logger: ", Logger.Flags());

	//fmt.Println("log.Ldate: ", log.Ldate)

	//SetFlags设置输出选项
	//Logger.SetFlags(log.Ldate | log.Ltime);

	//返回输出前缀
	//fmt.Println(Logger.Prefix());

	//设置输出前缀
	//Logger.SetPrefix("test_");

	//输出一条日志
	//Logger.Output(2, "打印一条日志信息");

	//格式化输出日志
	//Logger.Printf("第%d行 内容:%s", 11, "我是错误");

	//等价于print();os.Exit(1);
	//Logger.Fatal("我是错误");

	//等价于print();panic();
	//Logger.Panic("我是错误");

	//log的导出函数
	//导出函数基于std,std是标准错误输出
	//var std = New(os.Stderr, "", LstdFlags)

	//获取输出项
	//fmt.Println(log.Flags());
	//获取前缀
	//fmt.Printf(log.Prefix());
	//输出内容
	//log.Output(2, "输出内容");
	//格式化输出
	//log.Printf("第%d行 内容:%s", 22, "我是错误");
	//log.Fatal("我是错误");
	//log.Panic("我是错误");
}
