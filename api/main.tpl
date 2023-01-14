package main

import (
	"flag"
	"fmt"

	{{.importPackages}}
{{/*    "looklook/common/middleware"*/}}
)

var configFile = flag.String("f", "etc/{{.serviceName}}.yaml", "the config file")

func main() {
	flag.Parse()

	var c config.Config
	conf.MustLoad(*configFile, &c)
	logx.DisableStat()

	ctx := svc.NewServiceContext(c)
	server := rest.MustNewServer(c.RestConf,rest.WithCors())
	defer server.Stop()

	handler.RegisterHandlers(server, ctx)
	// 自定义错误
	httpx.SetErrorHandler(func(err error) (int, interface{}) {
		switch e := err.(type) {
		case *errorx.CodeError:
			return http.StatusOK, e.Data()
		default:
			return http.StatusInternalServerError, nil
		}
	})
	fmt.Printf("Starting server at %s:%d...\n", c.Host, c.Port)
	server.Start()
}
