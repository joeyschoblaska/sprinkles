package :postgres, provides: :database do
  description "PostgreSQL client, server and databse users"
  requires :postgres_core
  requires :postgres_user, username: "deploy"
  requires :postgres_user, username: "root"
end

package :postgres_core do
  apt %w(postgresql postgresql-contrib postgresql-client libpq-dev), sudo: true

  verify do
    has_executable "psql"
    has_apt "postgresql"
    has_apt "postgresql-client"
    has_apt "libpq-dev"
  end
end

package :postgres_user do
  runner "sudo -u postgres createuser --superuser #{opts[:username]} && createdb #{opts[:username]}"

  verify do
    @commands << "echo 'SELECT ROLNAME FROM PG_ROLES' | sudo -u postgres psql | grep #{opts[:username]}"
  end
end

package :postgres_createdb do
  description "Create a Postgres database"
  runner "createdb #{opts[:db_name]}"

  verify do
    @commands << "echo 'SELECT DATNAME FROM PG_DATABASE' | sudo -u postgres psql | grep #{opts[:db_name]}"
  end
end
