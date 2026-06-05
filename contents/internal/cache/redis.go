package cache

import (
	"context"
	"fmt"

	"github.com/redis/go-redis/v9"
)

var client *redis.Client

func Init(redisURL string) error {
	opt, err := redis.ParseURL(redisURL)
	if err != nil {
		return fmt.Errorf("cache: %w", err)
	}
	c := redis.NewClient(opt)
	if err := c.Ping(context.Background()).Err(); err != nil {
		return fmt.Errorf("cache: ping: %w", err)
	}
	client = c
	return nil
}

func Close() {
	if client != nil {
		client.Close()
	}
}

func Cache() *redis.Client {
	return client
}
