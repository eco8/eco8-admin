package routes

import (
	"eric-portal/controller"
	"github.com/gin-gonic/gin"
)

func Resources(router *gin.RouterGroup) {
	user := controller.User{}
	cluster := router.Group("resources")
	{
		cluster.GET("login", user.Login())
	}
}
