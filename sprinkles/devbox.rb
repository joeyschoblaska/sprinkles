require "./bootstrap"

policy :dev_stack, roles: :devbox do
  requires :build_essentials
  requires :authorized_keys, keys: %w(joey)
  requires :git
  requires :rvm
  requires :ruby, ruby_version: "2.3"
  requires :dotfiles
end

deployment do
  delivery :ssh do
    user "joey"
    forward_agent true
    role :devbox, "devboxname"
  end

  source do
    prefix   "/usr/local"
    archives "/usr/local/sources"
    builds   "/usr/local/build"
  end
end
