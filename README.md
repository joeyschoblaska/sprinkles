## Sprinkles
Packages and scripts for provisioning servers using Sprinkle. Assumes Ubuntu (or other apt-based) OS being provisioned over SSH.

## Setup
### On Server
1. Create a `deploy` user
2. Add local public key to `/home/deploy/.ssh/authorized_keys`
3. Add user to sudoers file, allow sudo without password: `deploy ALL=(ALL:ALL) NOPASSWD:ALL`

### In Application
#### Require Necessary Gems
```ruby
gem "net-ssh-gateway"
gem "sprinkle"
```
