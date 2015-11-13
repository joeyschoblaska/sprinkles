package :postgres do
  description "PostgreSQL client and server"
  apt %w(postgresql postgresql-contrib postgresql-client libpq-dev), sudo: true
end
