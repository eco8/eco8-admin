package controller

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"main/model"
)

type PortalApi struct {
}

func (*PortalApi) Test() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.JSON(200, gin.H{
			"data": "Test",
		})
	}
}

func (*PortalApi) Login() gin.HandlerFunc {
	return func(c *gin.Context) {
		loginForm := &model.UserLogin{}
		_ = c.ShouldBindJSON(&loginForm)
		fmt.Printf("loginForm: %+v", loginForm)
		c.JSON(200, gin.H{
			"data": loginForm.Username,
			"datalist": []struct{}{},
		})
	}
}
