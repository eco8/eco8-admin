package routerMiddleware

var NotAllowAuthList = [...]string{
	"/favicon.ico",
	"/api/v1/user/login",
	"/api/v1/user/session",
	"/api/v1/user/logout",
}
