package controller

import "github.com/gin-gonic/gin"

type User struct{}

func (*User) Login() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.JSON(200, gin.H{
			"code": 0,
			"data": c.FullPath(),
		})
	}
}
