package :git do
  description "Git"
  apt %w(git-core), sudo: true

  verify do
    has_executable "git"
  end
end
