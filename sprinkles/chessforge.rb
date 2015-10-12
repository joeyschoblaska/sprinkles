require "./bootstrap"

policy :ruby, roles: :app do
  requires :build_essentials
  requires :git
  requires :rvm
  requires :ruby, version: "2.2"
end

deployment do
  delivery :ssh do
    user "deploy"
    role :app, "chessforge2"
  end

  source do
    prefix   "/usr/local"
    archives "/usr/local/sources"
    builds   "/usr/local/build"
  end
end
