package :authorized_keys do
  description "Put keys into ~/.ssh/authorized_keys"

  keys = (opts[:keys] || []).map do |name|
    File.read("pubkeys/#{name}.pub")
  end

  runner "mkdir -p /home/deploy/.ssh"
  file "/home/deploy/.ssh/authorized_keys", content: keys.join("\n")
end
