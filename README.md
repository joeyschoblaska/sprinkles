Packages and scripts for provisioning servers using Sprinkle. Assumes Ubuntu (or other apt-based) OS being provisioned over SSH.

## Remote server setup
1. Create a `deploy` user: `adduser deploy`
2. Add local public key to `/home/deploy/.ssh/authorized_keys`
3. Add `deploy` to `/etc/sudoers`, allow sudo without password: `deploy ALL=(ALL:ALL) NOPASSWD:ALL`
4. `sudo apt-get update`

## Usage
`sprinkle -s sprinkles/sprinkle.rb`

Check out the [sprinkle project](https://github.com/sprinkle-tool/sprinkle) for more information on commands and packages.

## Todo
* nginx
* optional database providers
* unicorn/nginx autostart on boot
* memcached
