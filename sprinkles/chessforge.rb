require "./bootstrap"

policy :app_stack, roles: :app do
  requires :build_essentials
  requires :git
  requires :rvm
  requires :ruby, version: "2.2"
  requires :dotfiles
  requires :unicorn, app_name: "chessforge-api"
end

deployment do
  delivery :ssh do
    user "deploy"
    forward_agent true

    role :app, "chessforge2"
  end

  source do
    prefix   "/usr/local"
    archives "/usr/local/sources"
    builds   "/usr/local/build"
  end
end
