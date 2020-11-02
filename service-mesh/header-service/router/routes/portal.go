package routes

import (
	"github.com/gin-gonic/gin"
	"header-service/controller"
)

func PortalApi(r *gin.RouterGroup) {
	api := controller.PortalApi{}
	//c := router.Group("v1")
	{
		r.GET("/test", api.Test())

		r.POST("/login", api.Login())
	}
}
