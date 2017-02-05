package :authorized_keys do
  description "Put keys into ~/.ssh/authorized_keys"
  user = opts[:user] || "deploy"

  keys = (opts[:keys] || []).map do |name|
    File.read("pubkeys/#{name}.pub")
  end

  runner "mkdir -p /home/#{user}/.ssh"
  file "/home/#{user}/.ssh/authorized_keys", content: keys.join("\n")
end
