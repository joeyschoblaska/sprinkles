Dir["./sprinkles/packages/*.rb"].each { |f| require f }

policy :ruby, roles: :app do
  requires :build_essentials
  requires :rvm
  requires :ruby, version: "2.2"
end

deployment do
  delivery :ssh do
    user "deploy"
    role :app, "123.123.123.123"
  end

  source do
    prefix   "/usr/local"
    archives "/usr/local/sources"
    builds   "/usr/local/build"
  end
end
