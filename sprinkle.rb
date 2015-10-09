Dir["./sprinkles/packages/*.rb"].each { |f| require f }

policy :ruby, roles: :app do
  requires :build_essentials
  requires :rvm
end

deployment do
  delivery :ssh do
    user "deploy"
    use_sudo true

    role :app, "123.123.123.123"
  end

  source do
    prefix   "/usr/local"
    archives "/usr/local/sources"
    builds   "/usr/local/build"
  end
end
