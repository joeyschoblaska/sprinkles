Packages and scripts for provisioning servers using Sprinkle. Assumes Ubuntu (or other apt-based) OS being provisioned over SSH.

## remote server setup
1. Create a `deploy` user
2. Add local public key to `/home/deploy/.ssh/authorized_keys`
3. Add `deploy` to `/etc/sudoers`, allow sudo without password: `deploy ALL=(ALL:ALL) NOPASSWD:ALL`
4. `sudo apt-get update`

## project setup
### add these gems
```ruby
group :development do
  gem "net-ssh-gateway"
  gem "sprinkle"
end
```

### put some sprinkles on your project
```
cd path/to/project
git clone --depth=1 git@github.com:joeyschoblaska/sprinkles.git && rm -rf sprinkles/.git
```

### customize sprinkles/sprinkle.rb
This file defines your servers, roles, and which packages you want to install for each. Available packages are in `sprinkles/package`, and you can add new ones there if you need to.

## usage
`sprinkle -s sprinkles/sprinkle.rb`

For more information about using the `sprinkle` command, check out the [sprinkle project](https://github.com/sprinkle-tool/sprinkle) itself.
