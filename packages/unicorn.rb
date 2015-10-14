package :unicorn do
  description "Unicorn config files and init script"
  file "/etc/init.d/unicorn", content: File.read("templates/unicorn/init.d"), sudo: true
  runner "chmod +x /etc/init.d/unicorn", sudo: true
end
