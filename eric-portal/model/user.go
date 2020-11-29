package model

type User struct {
	Username string `form:"username" json:"username"`
	Password string `form:"password" json:"password"`
	Usercode string `form:"usercode" json:"usercode"`
	Code     string `form:"code" json:"code"`
}
