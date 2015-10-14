package :unicorn do
  description "Unicorn config files and init script"
  template_search_path "templates/unicorn"
  @app_name = opts[:app_name]

  # init.d file
  # todo: put this in a separate package and skip if already installed
  file "/etc/init.d/unicorn", content: File.read("templates/unicorn/init.d"), sudo: true
  runner "chmod +x /etc/init.d/unicorn", sudo: true

  # config file to be read by init.d script
  runner "mkdir -p /etc/unicorn", sudo: true
  runner "mkdir -p /home/deploy/#{@app_name}/shared/pids"
  file "/etc/unicorn/#{@app_name}.conf", content: render("my_app.conf"), sudo: true
end
