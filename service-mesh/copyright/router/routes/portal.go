package routes

import (
	"copyright/controller"
	"github.com/gin-gonic/gin"
)

func PortalApi(r *gin.RouterGroup) {
	api := controller.PortalApi{}
	//c := router.Group("v1")
	{
		r.GET("/test", api.Test())

		r.POST("/login", api.Login())
	}
}
