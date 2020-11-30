package routerMiddleware

import (
	"eric-portal/utils/guid"
	"github.com/gin-gonic/gin"
)

/**
	后续可以在此追加各种安全校验等
 */
func FormatRequest() gin.HandlerFunc {
	return func(c *gin.Context) {
		requestId := guid.UniqueId()
		c.Set("Request-Id", requestId)
		//c.Writer.Header().Set("Request-Id", requestId)
		c.Header("Request-Id", requestId)
		c.Next()
	}
}
