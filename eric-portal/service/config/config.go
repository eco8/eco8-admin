package config

import (
	"fmt"
	"gopkg.in/yaml.v2"
	"io/ioutil"
	"net/http"
)

func init() {
	getConfig()
}

type config struct {
	Admin struct {
		Username string `yaml:"username"`
		Password string `yaml:"password"`
	}
	Mysql struct {
		Host     string `yaml:"host"`
		Port     uint16 `yaml:"port"`
		Database string `yaml:"database"`
		UserName string `yaml:"userName"`
		Password string `yaml:"password"`
		Charset  string `yaml:"charset"`
	}
	Server struct {
		Host string `yaml:"host"`
		Port uint16 `yaml:"port"`
	}
	Logger struct {
		Dir        string `yaml:"dir"`
		FilePrefix string `yaml:"filePrefix"`
	}
	Redis struct {
		Host               string `yaml:"host"`
		Port               uint16 `yaml:"port"`
		Username           string `yaml:"username"`
		Password           string `yaml:"password"`
		MaxFreeConnections int    `yaml:"maxFreeConnections"`
		Protocol           string `yaml:"protocol"`
	}
	Session struct {
		SecretKey  string        `yaml:"secretKey"`
		SessionKey string        `yaml:"sessionKey"`
		Path       string        `yaml:"path"`
		Domain     string        `yaml:"domain"`
		MaxAge     int           `yaml:"maxAge"`
		Secure     bool          `yaml:"secure"`
		HttpOnly   bool          `yaml:"httpOnly"`
		SameSite   http.SameSite `yaml:"sameSite"`
	}
}

var CFG *config

func (c *config) readYaml() *config {
	confFile, err := ioutil.ReadFile("config.yaml")
	if err != nil {
		fmt.Println(err.Error())
	}
	err = yaml.Unmarshal(confFile, c)
	if err != nil {
		fmt.Println(err.Error())
	}
	return c
}

func getConfig() {
	var c config
	CFG = c.readYaml()
}
