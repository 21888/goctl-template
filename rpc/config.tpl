package config

import (
	"github.com/zeromicro/go-zero/core/stores/cache"
	"github.com/zeromicro/go-zero/zrpc"
)

type Config struct {
	zrpc.RpcServerConf

	Mysql struct {
		DataSource string
	}
	Auth2 struct {
		AccessSecret string
		AccessExpire int64
	}

	CacheRedis cache.CacheConf

	Salt string
}
