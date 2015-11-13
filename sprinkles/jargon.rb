require "./bootstrap"

package :jargon_app_deps do
  runner "mkdir -p /home/deploy/jargon/shared/config"
  runner "touch /home/deploy/jargon/shared/config/secrets.yml"
end

policy :app_stack, roles: :app do
  requires :build_essentials
  requires :jargon_app_deps
  requires :git
  requires :rvm
  requires :ruby, version: "2.2"
  requires :postgres
  requires :postgres_createdb, db_name: "jargon_production"
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
