class rkhunter::params {

  $rotate_mirrors      = "1"
  $update_mirrors      = "1"
  $mirrors_mode        = "0"
  $mail_on_wanring     = ""
  $tmpdir              = "/var/lib/rkhunter/tmp"
  $dbdir               = "/var/lib/rkhunter/db"
  $scriptdir           = "/usr/share/rkhunter/scripts"
  $logfile             = "/var/log/rkhunter.log"
  $apped_log           = "0"
  $copy_log_on_error   = "0"
  $color_set2          = "0"
  $allow_ssh_root_user = "no"
  $allow_ssh_prot_v1   = "0"
  $enable_tests        = "all"
  $disable_tests       = "suspscan hidden_procs deleted_files packet_cap_apps apps"
  $immutable_set       = "0"
  $allow_syslog_remote_logging = "0"
  $suspscan_temp       = "/dev/shm"
  $suspscan_maxsize    = "10240000"
  $suspscan_thresh     = "200"
  $use_locking         = "0"
  $lock_timeout        = "300"
  $show_lockmsgs       = "1"
  $disable_unhide      = "1"
  $installdir          = "/usr"
  $package_manager     = 'NONE'
  $scriptwhitelist     = [ 
      '/bin/egrep',
      '/bin/fgrep',
      '/bin/which',
      '/usr/bin/groups',
      '/usr/bin/ldd',
      '/usr/bin/lwp-request',
      '/usr/sbin/adduser',
      '/usr/sbin/prelink',
  ]
  $immutewhitelist = [
#      '/sbin/ifup /sbin/ifdown',
  ]
  $allowhiddendir = [
#      '/etc/.java',
#      '/dev/.static',
#      '/dev/.SRC-unix',
#      '/etc/.etckeeper',
  ]
  $allowhiddenfile = [
#      '/etc/.java',
#      '/usr/share/man/man1/..1.gz',
#      '/etc/.pwd.lock',
#      '/etc/.init.state',
#      '/lib/.libcrypto.so.0.9.8e.hmac /lib/.libcrypto.so.6.hmac',
#      '/lib/.libssl.so.0.9.8e.hmac /lib/.libssl.so.6.hmac',
#      '/usr/bin/.fipscheck.hmac',
#      '/usr/bin/.ssh.hmac',
#      '/usr/lib/.libfipscheck.so.1.1.0.hmac',
#      '/usr/lib/.libfipscheck.so.1.hmac',
#      '/usr/lib/.libgcrypt.so.11.hmac',
#      '/usr/lib/hmaccalc/sha1hmac.hmac',
#      '/usr/lib/hmaccalc/sha256hmac.hmac',
#      '/usr/lib/hmaccalc/sha384hmac.hmac',
#      '/usr/lib/hmaccalc/sha512hmac.hmac',
#      '/usr/sbin/.sshd.hmac',
#      '/usr/share/man/man5/.k5login.5.gz',
#      '/etc/.gitignore',
#      '/etc/.bzrignore',
  ]
  $allowprocdelfile = [
#      '/sbin/cardmgr /usr/sbin/gpm:/etc/X11/abc',
#      '/usr/lib/libgconf2-4/gconfd-2',
#      '/usr/sbin/mysqld:/tmp/ib*',
#      '/usr/lib/iceweasel/firefox-bin',
#      '/usr/bin/file-roller',
  ]
  $allowproclisten = [
#      '/sbin/dhclient /usr/bin/dhcpcd',
#      '/usr/sbin/pppoe /usr/sbin/tcpdump',
#      '/usr/sbin/snort-plain',
  ]
  $allowpromiscif = [
#      'eth0',
  ]
  $allowdevfile = [
#      '/dev/shm/pulse-shm-*',
#      '/dev/shm/sem.ADBE_*',
  ]
  $uid0_accounts = [
#      'toor rooty sashroot',
  ]
  $pwdless_accounts = [
#      'someuser',
  ]
  $syslog_config_file = [
#      '/etc/syslog.conf',
  ]
  $app_whitelist = [
#      'openssl:0.9.7d gpg httpd:1.3.29',
  ]
  $suspscan_dirs = [
#      '/tmp /var/tmp',
  ]
  $port_whitelist = [
#      '/home/user1/abc /opt/xyz TCP:2001 UDP:32011',
  ]
  $shared_lib_whitelist = [
#      '/lib/snoopy.so',
  ]


  case $::osfamily {
    'Debian': {
      $package_name = 'rkhunter'
    }
    'RedHat': {
      $package_name = 'rkhunter'
    }
    'FreeBSD': {
      $package_name = 'security/rkhunter'
    }
    default: {
      $package_name = 'rkhunter'
    }
  }
}