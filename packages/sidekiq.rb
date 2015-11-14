package :sidekiq do
  description "Sidekiq init script"
  requires :redis
  template_search_path "templates/sidekiq"
  @app_name = opts[:app_name]
  @threads = opts[:threads] || 25

  file "/etc/init/sidekiq.conf", content: render("sidekiq.conf"), sudo: true
  file "/etc/init/sidekiq-workers.conf", content: render("sidekiq-workers.conf"), sudo: true
end
