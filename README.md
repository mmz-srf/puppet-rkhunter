puppet-rkhunter
===============

[![Build Status](https://travis-ci.org/mmz-srf/puppet-rkhunter.png?branch=master)](https://travis-ci.org/mmz-srf/puppet-rkhunter)

Manage rkhunter installation and configuration with Puppet.

## Features
- Manage ALL config entries (some of them dont make sense in server environments)
- Manage your whitelists
- The check cronjob is called staggered (predefined timewindow)
- The db update cronjob is configured separately

## Supported OS
- Debian ( tested on Debian 7.5, 8.1)
- Redhat/CentOS ( tested on CentOS 6.8 and 7.3)
- FreeBSD (NOT tested yet)

## Used Modules
No external modules are used in this module. 

## Configuration

See `templates/etc/rkhunter.conf.erb` for detailed explanation of the rkhunter config options.
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
    ],
  }
  class {'rkhunter::cron':}
}
```
### List of optional configuration paramaeters
NOTE: there may be more. I do not update this list every time. Have a look into params.pp

```
  rotate_mirrors
  update_mirrors
  mirrors_mode
  mail_on_warning
  tmpdir
  dbdir
  scriptdir
  logfile
  append_log
  copy_log_on_error
  use_syslog
  color_set2
  auto_x_detect
  whitelisted_is_white
  allow_ssh_root_user
  allow_ssh_prot_v1
  enable_tests
  disable_tests
  immutable_set
  allow_syslog_remote_logging
  suspscan_temp
  suspscan_maxsize
  suspscan_thresh
  use_locking
  lock_timeout
  show_lockmsgs
  disable_unhide
  installdir
  ssh_config_dir
  hash_func
  hash_fld_idx
  package_manager
  pkgmgr_no_verfy
  ignore_prelink_dep_err
  use_sunsum
  existwhitelist
  attrwhitelist
  writewhitelist
  scan_mode_dev
  phlanx2_dirtest
  inetd_conf_path
  inetd_allowed_svc
  xinetd_conf_path
  xinetd_allowed_svc
  startup_paths
  passwd_file
  user_fileprop_files_dirs
  rtkt_file_whitelist
  rtkt_dir_whitelist
  scriptwhitelist
  immutewhitelist
  allowhiddendir
  allowhiddenfile
  allowprocdelfile
  allowproclisten
  allowpromiscif
  allowdevfile
  allowipcproc
  uid0_accounts
  pwdless_accounts
  syslog_config_file
  app_whitelist
  suspscan_dirs
  port_whitelist
  shared_lib_whitelist
```
