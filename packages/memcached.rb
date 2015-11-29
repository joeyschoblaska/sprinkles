package :memcached do
  description "memcached"
  apt %w(memcached), sudo: true
end
