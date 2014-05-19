class rkhunter  (
  $rotate_mirrors         = $rkhunter::params::openvpn_dir,
  $update_mirrors         = $rkhunter::params::update_mirrors,
  $mirrors_mode           = $rkhunter::params::mirrors_mode,
  $mail_on_wanring        = $rkhunter::params::mail_on_wanring,
  $tmpdir                 = $rkhunter::params::tmpdir,
  $dbdir                  = $rkhunter::params::dbdir,
  $scriptdir              = $rkhunter::params::scriptdir,
  $logfile                = $rkhunter::params::logfile,
  $append_log             = $rkhunter::params::append_log,
  $copy_log_on_error      = $rkhunter::params::copy_log_on_error,
  $color_set2             = $rkhunter::params::color_set2,
  $allow_ssh_root_user    = $rkhunter::params::allow_ssh_root_user,
  $allow_ssh_prot_v1      = $rkhunter::params::allow_ssh_prot_v1,
  $enable_tests           = $rkhunter::params::enable_tests,
  $disable_tests          = $rkhunter::params::disable_tests,
  $immutable_set          = $rkhunter::params::immutable_set,
  $allow_syslog_remote_logging = $rkhunter::params::allow_syslog_remote_logging,
  $suspscan_temp          = $rkhunter::params::suspscan_temp,
  $suspscan_maxsize       = $rkhunter::params::suspscan_maxsize,
  $suspscan_thresh        = $rkhunter::params::suspscan_thresh,
  $use_locking            = $rkhunter::params::use_locking,
  $lock_timeout           = $rkhunter::params::lock_timeout,
  $show_lockmsgs          = $rkhunter::params::show_lockmsgs,
  $disable_unhide         = $rkhunter::params::disable_unhide,
  $installdir             = $rkhunter::params::installdir,

  $scriptwhitelist        = $rkhunter::params::scriptwhitelist,
  $immutewhitelist        = $rkhunter::params::immutewhitelist,
  $allowhiddendir         = $rkhunter::params::allowhiddendir,
  $allowhiddenfile        = $rkhunter::params::allowhiddenfile,
  $allowprocdelfile       = $rkhunter::params::allowprocdelfile,
  $allowproclisten        = $rkhunter::params::allowproclisten,
  $allowpromiscif         = $rkhunter::params::allowpromiscif,
  $allowdevfile           = $rkhunter::params::allowdevfile,
  $uid0_accounts          = $rkhunter::params::uid0_accounts,
  $syslog_config_file     = $rkhunter::params::syslog_config_file,
  $app_whitelist          = $rkhunter::params::app_whitelist,
  $suspscan_dirs          = $rkhunter::params::suspscan_dirs,
  $port_whitelist         = $rkhunter::params::port_whitelist,
  $pwdless_accounts       = $rkhunter::params::pwdless_accounts,
  $shared_lib_whitelist   = $rkhunter::params::shared_lib_whitelist,

) inherits ::rkhunter::params {
  include ::rkhunter::packages

  file { '/etc/rkhunter.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('rkhunter/etc/rkhunter.conf.erb');
  }
}