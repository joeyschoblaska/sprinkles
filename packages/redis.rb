package :redis do
  description "redis"
  apt %w(redis-server), sudo: true
end
