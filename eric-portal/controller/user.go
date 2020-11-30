package controller

import (
	userService "eric-portal/service/user"
	"github.com/gin-gonic/gin"
)

type User struct{}

func (*User) Login() gin.HandlerFunc {
	return func(c *gin.Context) {
		userService.GetAllUser()
		c.JSON(200, gin.H{
			"code": 0,
			"data": c.FullPath(),
		})
	}
}
