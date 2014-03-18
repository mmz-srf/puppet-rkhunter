puppet-rkhunter
===============

[![Build Status](https://travis-ci.org/mmz-srf/puppet-rkhunter.png?branch=master)](https://travis-ci.org/mmz-srf/puppet-rkhunter)

Manage rkhunter installation and configuration with Puppet
Installs the needed cronjob, which runs randomly in a defined timewindow.

## Features
- Manage 'allmost' all config entries (some of them dont make send in server environments)
- Manage your whitelists
- The update and check cronjob is called staggered (predefined timewindow)

## Used Modules 
Currently no external modules used. I maybe will make use of the puppet STDlib or Concat Module in future. 

## Todo's 
- Make update toggle in Cronjob funktional
- Make syslog Option in Cronjob funktional

## Configuration

Important: full possible configuration is visible in params.pp. Do not uncomment them in params.pp. 

### Minimal configuration
```
class yourclass{
  include ::rkhunter
  class {'rkhunter::cron':}
}
```

### A bit bigger configuration
```
class yourclass{
  class { 'rkhunter':
    allow_ssh_root_user         => 'yes',
    shared_lib_whitelist        => [ '/lib/snoopy.so' ],
    allow_syslog_remote_logging => "1",
    scriptwhitelist             => [ 
      '/bin/egrep',
      '/bin/fgrep',
      '/bin/which',
      '/usr/bin/groups',
      '/usr/bin/ldd',
      '/usr/bin/lwp-request',
      '/usr/sbin/adduser',
      '/usr/sbin/prelink',
      '/usr/bin/unhide.rb',
    ],
  }
  class {'rkhunter::cron':}
}
```


Test Travis
