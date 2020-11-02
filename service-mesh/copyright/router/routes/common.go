package routes

import (
	"copyright/controller"
	"github.com/gin-gonic/gin"
)

func CommonApi(router *gin.RouterGroup) {
	api := controller.CommonApi{}
	c := router.Group("v1")
	{
		c.GET("/test", api.Test())

	}
}
