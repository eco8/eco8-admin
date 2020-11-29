package routerMiddleware

import (
	"eric-portal/model"
	log "eric-portal/utils/logs"
	"fmt"
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
	"net/http"
)

func Authorize() gin.HandlerFunc {
	return func(c *gin.Context) {
		id, _ := c.Get("Request-Id")
		url := c.Request.URL.Path
		log.Trace(fmt.Sprintf("Http Request URL: %s, Request-Id: %s", url, id))

		// session 刷新逻辑
		session := sessions.Default(c)
		s := session.Get("eric")
		var user model.User
		if s != nil {
			user = s.(model.User)
		}

		// 刷新session
		if user.Username != "" {
			session.Set("eric", s)
			_ = session.Save()
		}

		// 判断 route 是否在 NotAllowAuthList 中，否则验证权限
		exist := false
		for _, item := range NotAllowAuthList {
			if item == url {
				exist = true
				break
			}
		}
		if exist {
			c.Next()
		} else {
			if user.Username != "" {
				c.Next()
			} else {
				c.Abort()
				c.JSON(http.StatusUnauthorized, gin.H{"message": "访问未授权"})
				/**
				根据情况判断是否需要返回登陆页面
				*/
			}
		}
	}
}
