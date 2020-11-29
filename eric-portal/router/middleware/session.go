package routerMiddleware

import (
	"eric-portal/service/config"
	log "eric-portal/utils/logs"
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/gin-contrib/sessions"
	"github.com/gin-contrib/sessions/cookie"
	"github.com/gin-contrib/sessions/redis"
)

// 基于cookie的session
func CookieSession(c *gin.Engine) {
	store := cookie.NewStore([]byte("secret123456"))
	c.Use(sessions.Sessions("SessionKey", store))
}

// 基于redis的session用法
func RedisSession(c *gin.Engine) {
	// 初始化基于redis的存储引擎
	// 参数说明：
	//    第1个参数 - redis最大的空闲连接数
	//    第2个参数 - 通信协议tcp或者udp
	//    第3个参数 - redis地址, 格式，host:port
	//    第4个参数 - redis密码
	//    第5个参数 - session加密密钥
	conf := config.CFG.Redis
	sessionConf := config.CFG.Session
	store, err := redis.NewStore(
		conf.MaxFreeConnections,
		conf.Protocol,
		fmt.Sprintf("%s:%d", conf.Host, conf.Port),
		conf.Password,
		[]byte(sessionConf.SecretKey),
	)
	if err == nil {
		store.Options(sessions.Options{
			Path:     sessionConf.Path,
			Domain:   sessionConf.Domain,
			MaxAge:   sessionConf.MaxAge,
			Secure:   sessionConf.Secure,
			HttpOnly: sessionConf.HttpOnly,
			SameSite: sessionConf.SameSite,
		})
	} else {
		log.Err(fmt.Sprintf("Init Session Middleware Error: %s", err.Error()))
		panic(err)
	}

	c.Use(sessions.Sessions(sessionConf.SessionKey, store))
}

func SetSession(c *gin.Context, key interface{}, value interface{}) bool {
	session := sessions.Default(c)
	session.Set(key, value)
	_ = session.Save()
	if err := session.Save(); err != nil {
		log.Err(fmt.Sprintf("Save Session Error: %s", err.Error()))
		return false
	} else {
		log.Info(fmt.Sprintf("Set session: key: %s, value: %v", key, session.Get(key)))
		return true
	}
}
