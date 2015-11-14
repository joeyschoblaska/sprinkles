require "./bootstrap"

package :jargon_app_deps do
  runner "mkdir -p /home/deploy/jargon/shared/config"
  runner "touch /home/deploy/jargon/shared/config/secrets.yml"
end

policy :app_stack, roles: :app do
  requires :build_essentials
  requires :authorized_keys, keys: %w(joey dave stephen)
  requires :jargon_app_deps
  requires :git
  requires :rvm
  requires :ruby, ruby_version: "2.2.3"
  requires :capistrano, app_name: "jargon"
  requires :postgres
  requires :postgres_createdb, db_name: "jargon_production"
  requires :puma, app_name: "jargon"
end

deployment do
  delivery :ssh do
    user "deploy"
    forward_agent true
    role :app, "jargon"
  end

  source do
    prefix   "/usr/local"
    archives "/usr/local/sources"
    builds   "/usr/local/build"
  end
end
