package controller

import "github.com/gin-gonic/gin"

type CommonApi struct {
}

func (*CommonApi) Test() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.JSON(200, gin.H{
			"data": "Test",
		})
	}
}
