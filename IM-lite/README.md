# IM 聊天 APP

## 技术栈

### 前端

1. h5: ajax / H5 audio / websocket
2. vue 开发单页面 app
3. mui / css3

### 后端

4. Websocket 库
5. channel / goroutine 提升并发性
6. template 技术

### 系统架构

7. Nginx 反向代理
8. 消息总线 MQ / redis
9. 协议 UDP / HTTP2

## 项目安排

1. 需求分析：10%
2. 重难点分析：20%
3. 功能实现：60%
4. 上线部署：10%

## 需求分析

### 发送 / 接收 消息

1. 实现功能界面
2. 资源编码标准化
   - 资源信息采集并标准化。转成 content / url
   - 资源编码，拼成一个消息体
3. 确保消息体的可扩展性

   - 兼容基础的媒介：文字、图片、语音文件、视频文件 等
   - 能承载大量新业务、扩张不能对现有业务产生影响
   - 红包、打卡、签到 本质上是消息内容不一样

   ```go
        type Message struct {
            ID int64 `json:"id,omitempty" form:"id"` // 消息ID
            UserID int64 `json:"userid,omitempty" form:"userid"` // 发送消息的用户ID
            Cmd int64 `json:"cmd,omitempty" form:"cmd"` // 群聊还是私聊
            DstID int64 `json:"dstid,omitempty" form:"dstid"` // 对端ID / 群ID
            Media int64 `json:"media,omitempty" form:"media"` // 媒体消息类型
            Content string `json:"content,omitempty" form:"content"` // 消息内容
            Pic string `json:"pic,omitempty" form:"pic"` // 预览视频，一般是缩略图
            Url string `json:"url,omitempty" form:"url"` // 媒体文件URL
            Memo string `json:"memo,omitempty" form:"memo"` // 简单描述，例如红包的描述
            Amount int64 `json:"amount,omitempty" form:"amount"` // 数字相关陈述，例如视频、语音长度
        }
   ```

4. 接收消息并解析显示
   - 接收消息体（JSON 解析）并显示
   - 区分不同 media 显示
   - 界面区分发送消息的主题和接收消息的客体

### 实现群聊

1.  基础功能上无区别
2.  1 条消息，多个参与群聊的终端都能同时收到
3.  服务器流量计算，示例：一个群聊 100 人，某人发送一张 512k 的图片，服务器的流量就是：512kb \* 100 = 50M，发给 1024 个群，那就是 50G
4.  群聊流量过大的解决方案：① 使用缩略图，② 使用资源服务器分离业务服务器，③ 压缩消息体，发送文件路径而不是文件

### 高并发 = 单机最好 + 分布式 + 弹性扩展

1. 单机并发性能最优
2. 海量用户分布式部署
3. 应对突发事件弹性扩容
