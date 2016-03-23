package :nodejs do
  description "Node JS"
  apt %w(nodejs), sudo: true

  verify do
    has_executable "nodejs"
  end
end
