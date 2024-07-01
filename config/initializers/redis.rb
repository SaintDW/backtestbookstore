redis_config = {
  host: 'localhost',
  port: 6379, # default Redis port
  db: 0 # use database 0
}

$redis = Redis.new(redis_config)
