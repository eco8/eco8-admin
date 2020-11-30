package repository

import (
	"database/sql"
	mModel "eric-portal/entity/mysql"
	"eric-portal/mysql"
	log "eric-portal/utils/logs"
	"fmt"
)

var DB *sql.DB = mysql.DB

func GetAllUsers() ([]mModel.User, error) {
	var u mModel.User
	fmt.Println("mysql DB: ", DB)
	rows, err := DB.Query("select * from e_user")
	log.Trace(fmt.Sprintf("GetAllUsers: select * from e_user"))
	if err != nil {
		log.Err(fmt.Sprintf("GetAllUsers error: %s", err))
		return nil, err
	} else {
		var users = make([]mModel.User, 0)
		for rows.Next() {
			rows.Scan(&u.Username, &u.Userpwd, &u.Usertype, &u.Usertype)
			users = append(users, u)
		}
		log.Info(fmt.Sprintf("GetAllUsers successful: %+v", users))
		return users, nil
	}
}
