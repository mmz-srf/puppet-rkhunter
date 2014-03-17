puppet-rkhunter
===============

Manage rkhunter installation and configuration with Puppet

Installs the needed Cronjob, which runs randomly in a defined timewindow.

## Used Modules 
- concat: "https://github.com/puppetlabs/puppetlabs-concat.git"
- stdlib: "https://github.com/puppetlabs/puppetlabs-stdlib.git"

## Todo's 
- Manage Whiteliste
- Make update toggle in Cronjob funktional
- Make syslog Option in Cronjob funktional

## Configuration

### Minimal configuration
```
class yourclass{
  include ::rkhunter
  class {'rkhunter::cron':}
}
```

