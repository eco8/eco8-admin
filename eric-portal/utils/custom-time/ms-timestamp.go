package custom_time

import (
	"time"
)

// 获取 ms 级别的时间戳
func MsTimestamp() int64 {
	// int 方法转换float数据会直接去掉小数位
	return int64(time.Now().UnixNano() / 1e6)
}
