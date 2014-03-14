puppet-rkhunter
===============

Manage rkhunter installation and configuration with Puppet

## Used Modules 
- concat: "https://github.com/puppetlabs/puppetlabs-concat.git"
- stdlib: "https://github.com/puppetlabs/puppetlabs-stdlib.git"

## Todo's 
- Manage Whiteliste

## Configuration
```
class yourclass{
  include ::rkhunter
  class {'rkhunter::cron':}
}
```
