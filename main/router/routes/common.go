package routes

import (
	"github.com/gin-gonic/gin"
	"main/controller"
)

func CommonApi(router *gin.RouterGroup) {
	api := controller.CommonApi{}
	c := router.Group("v1")
	{
		c.GET("/test", api.Test())

	}
}
