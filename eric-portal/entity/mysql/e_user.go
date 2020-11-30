package mModel

type User struct {
	UserId     string `db:"user_id" json:"userId"`
	Username   string `db:"user_name" json:"username"`
	Usertype   string `db:"user_type" json:"usertype"`
	Userpwd    string `db:"user_pwd" json:"userpwd"`
	Signtime   int    `db:"sign_time" json:"signtime"`
	Updatetime int    `db:"update_time" json:"updatetime"`
	Email      int    `db:"email" json:"email"`
	WeChat     int    `db:"we_chat" json:"weChat"`
}
