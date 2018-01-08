require "./bootstrap"

package :rails_app_deps do
  runner "mkdir -p /home/deploy/myappname/shared/config"
  runner "touch /home/deploy/myappname/shared/config/secrets.yml"
end

policy :app_stack, roles: :app do
  requires :build_essentials
  requires :authorized_keys, keys: %w(joey)
  requires :rails_app_deps
  requires :git
  requires :imagemagick
  requires :nodejs
  requires :rvm
  requires :ruby, ruby_version: "2.4"
  requires :capistrano, app_name: "myappname"
  requires :postgres
  requires :postgres_createdb, db_name: "myappname_production"
  requires :puma, app_name: "myappname"
  requires :nginx, app_name: "myappname", server_name: "myurl.com"
  requires :sidekiq, app_name: "myappname"
end

deployment do
  delivery :ssh do
    user "deploy"
    forward_agent true
    role :app, "123.123.123.123"
  end

  source do
    prefix   "/usr/local"
    archives "/usr/local/sources"
    builds   "/usr/local/build"
  end
end
