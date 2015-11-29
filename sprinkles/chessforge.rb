require "./bootstrap"

package :chessforge_api_deps do
  apt %w(libpq-dev), sudo: true
  runner "mkdir -p /home/deploy/chessforge-api/shared/config"
  runner "touch /home/deploy/chessforge-api/shared/config/secrets.yml"
end

package :chessforge_web_deps do
  runner "mkdir -p /home/deploy/chessforge-web/current/public"
end

policy :api_stack, roles: :api do
  requires :build_essentials
  requires :chessforge_api_deps
  requires :git
  requires :rvm
  requires :ruby, ruby_version: "2.2"
  requires :dotfiles
  requires :memcached
  requires :capistrano, app_name: "chessforge-api"
  requires :postgres
  requires :postgres_createdb, db_name: "chessforge"
  requires :puma, app_name: "chessforge-api"
  requires :nginx, app_name: "chessforge-api", server_name: "api.chessforge.com"
end

policy :web_stack, roles: :web do
  requires :chessforge_web_deps
  requires :nginx, app_name: "chessforge-web", server_name: "chessforge.com", template_name: "nginx-static.conf"
end

deployment do
  delivery :ssh do
    user "deploy"
    forward_agent true
    role :api, "chessforge"
    role :web, "chessforge"
  end

  source do
    prefix   "/usr/local"
    archives "/usr/local/sources"
    builds   "/usr/local/build"
  end
end
