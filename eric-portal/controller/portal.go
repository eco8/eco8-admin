package controller

import (
	userService "eric-portal/service/user"
	"github.com/gin-gonic/gin"
)

type Portal struct{}

func (*Portal) Logo() gin.HandlerFunc {
	return func(c *gin.Context) {
		userService.GetAllUser()
		c.File("logo.svg")
	}
}
