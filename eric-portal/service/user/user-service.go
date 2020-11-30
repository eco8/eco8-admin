package userService

import (
	"eric-portal/repository"
	"fmt"
)

func GetAllUser() {
	var user, _ = repository.GetAllUsers()
	fmt.Println("getAllUser: ", user)
}
