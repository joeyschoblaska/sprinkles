package :nginx do
  description "nginx and configuration files"
  template_search_path "templates/nginx"
  @app_name = opts[:app_name]
  @server_name = opts[:server_name]
  @template_name = opts[:template_name] || "nginx.conf"

  conf_path = "/etc/nginx/sites-available/#{@app_name}"
  link_path = "/etc/nginx/sites-enabled/#{@app_name}"

  apt %w(nginx), sudo: true
  file conf_path, content: render(@template_name), sudo: true
  runner "[ -f #{link_path} ] || ln -s #{conf_path} #{link_path}", sudo: true

  verify do
    has_executable "nginx"
    has_file link_path
  end
end
