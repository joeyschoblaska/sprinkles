require "./bootstrap"

package :chessforge_app_deps do
  apt %w(libpq-dev), sudo: true
  runner "mkdir -p /home/deploy/chessforge-api/shared/config"
  runner "touch /home/deploy/chessforge-api/shared/config/secrets.yml"
end

policy :app_stack, roles: :app do
  requires :build_essentials
  requires :chessforge_app_deps
  requires :git
  requires :rvm
  requires :ruby, ruby_version: "2.2"
  requires :dotfiles
  requires :capistrano, app_name: "chessforge-api"
  requires :postgres
  requires :postgres_createdb, db_name: "chessforge"
  requires :puma, app_name: "chessforge-api"
  requires :nginx, app_name: "chessforge-api", server_name: "api.chessforge.com"
end

deployment do
  delivery :ssh do
    user "deploy"
    forward_agent true
    role :app, "chessforge"
  end

  source do
    prefix   "/usr/local"
    archives "/usr/local/sources"
    builds   "/usr/local/build"
  end
end
