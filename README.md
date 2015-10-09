Packages and scripts for provisioning servers using Sprinkle. Assumes Ubuntu (or other apt-based) OS being provisioned over SSH.

## remote server setup
1. Create a `deploy` user
2. Add local public key to `/home/deploy/.ssh/authorized_keys`
3. Add `deploy` to `/etc/sudoers`, allow sudo without password: `deploy ALL=(ALL:ALL) NOPASSWD:ALL`

## project setup
### add these gems
```ruby
group :development do
  gem "net-ssh-gateway"
  gem "sprinkle"
end
```

### copy sprinkles to your project
```
cd path/to/project
git clone --depth=1 git@github.com:joeyschoblaska/sprinkles.git && rm -rf sprinkles/.git
```
