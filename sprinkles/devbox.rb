require "./bootstrap"

policy :dev_stack, roles: :devbox do
  requires :build_essentials
  requires :authorized_keys, keys: %w(joey), user: "joey"
  requires :git
  requires :rvm, user: "joey"
  requires :ruby, ruby_version: "2.3", user: "joey"
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
