# CHANGELOG


## [1.0.1] 2017-04-03

  * Regression fix. re-add hidden files to allowdevfiles

## [1.0.0] 2017-03-29

  * Sync rkhunter.conf template with default file from version 1.4.2.
  * Add and update parameters accordingly
  * Remove travis tests for Puppet 3 and Ruby < 2.3.
  * Module should still work with older versions, but test tools are not compatible

###  added parameters
  * `mail_cmd`
  * `bindir`
  * `unhidetcp_opts`
  * `port_path_whitelist`
  * `warn_on_os_change`
  * `updt_on_os_change`
  * `show_summary_warnings_number`
  * `show_summary_time`
  * `empty_logfiles`
  * `missing_logfiles`

###  renamed parameters
  * `hash_func` to `hash_cmd` (renamed upstream)
  * `phlanx2_dirtest` to `phalanx2_dirtest` (fix typo)

## [0.2.0] 2016-02-19
### Fixed
- ERB deprecation warnings (Puppet 4 support)

### Changed
- Updated the metadata to the new format
- Some new defaults for RedHat and Debian
- Added specific OS versions to the metadata

### Removed
- FreeBSD support

## [0.1.4] 2013-12-09
### Changed
- Better RedHat/Centos suport
- Change cron command to use fqdn_rand function.
- Added CHANGELOG
