class rkhunter::params {

  $rotate_mirrors      = '1'
  $update_mirrors      = '1'
  $mirrors_mode        = '0'
  $mail_on_warning     = ''
  $mail_cmd            = 'mail -s "[rkhunter] Warnings found for ${HOST_NAME}"'
  $tmpdir              = $::osfamily ? {
    'RedHat' => '/var/lib/rkhunter',
    default  => '/var/lib/rkhunter/tmp',
  }
  $dbdir               = '/var/lib/rkhunter/db'
  $scriptdir           = '/usr/share/rkhunter/scripts'
  $bindir              = undef
  $logfile             = $::osfamily ? {
    'RedHat' => '/var/log/rkhunter/rkhunter.log',
    default  => '/var/log/rkhunter.log',
  }
  $append_log          = $::osfamily ? {
    'RedHat' => '1',
    default  => '0',
  }
  $copy_log_on_error   = '0'
  $use_syslog          = $::osfamily ? {
    'RedHat' => 'authpriv.notice',
    default  => undef,
  }
  $color_set2          = '0'
  $auto_x_detect       = $::osfamily ? {
    'RedHat' => '1',
    default  => '0',
  }
  $whitelisted_is_white = '0'
  $allow_ssh_root_user = $::osfamily ? {
    'RedHat' => 'unset',
    default  => 'no',
  }
  $allow_ssh_prot_v1   = '0'
  $enable_tests        = 'all'
  $disable_tests       = 'suspscan hidden_procs deleted_files packet_cap_apps apps'
  $immutable_set       = '0'
  $allow_syslog_remote_logging = '0'
  $suspscan_temp       = '/dev/shm'
  $suspscan_maxsize    = '10240000'
  $suspscan_thresh     = '200'
  $use_locking         = '0'
  $lock_timeout        = '300'
  $show_lockmsgs       = '1'
  $disable_unhide      = $::osfamily ? {
    'RedHat' => '0',
    default  => '1',
  }
  $installdir          = '/usr'
  $ssh_config_dir      = undef  #"/etc/ssh"
  $hash_cmd            = undef  #"sha1sum"
  $hash_fld_idx        = undef  #"4"
  $package_manager     = $::osfamily ? {
    'RedHat' => 'RPM',
    default  => undef,  #"NONE"
  }
  $pkgmgr_no_verfy     = []     #['/etc/fooconfig1 /etc/barconfig2', '/etc/foobarconfig']
  $ignore_prelink_dep_err = []  #['/bin/ps /usr/bin/top', '/bin/foobin']
  $use_sunsum          = undef  #"0"
  $existwhitelist      = $::osfamily ? {
    'RedHat' => [
      '/var/log/pki-ca/system',
      '/var/log/pki/pki-tomcat/ca/system', # FreeIPA Certificate Authority
      '/usr/bin/GET',
      '/usr/bin/whatis',
    ],
    default  => [],             #['/path/one /path/bar', '/path/foobar*']
  }
  $attrwhitelist       = []     #['/path/one /path/bar', '/path/foobar*']
  $writewhitelist      = []     #['/path/one /path/bar', '/path/foobar*']
  $scan_mode_dev       = undef  #"THOROUGH"
  $phalanx2_dirtest    = '0'
  $inetd_conf_path     = undef  #"/etc/inetd.conf"
  $inetd_allowed_svc   = []     #['echo']
  $xinetd_conf_path    = undef  #"/etc/xinetd.conf"
  $xinetd_allowed_svc  = []     #['echo'
  $startup_paths       = []     #['/etc/init.d /etc/rc.local']
  $passwd_file         = undef  #"/etc/shadow"
  $user_fileprop_files_dirs = [] #['top /usr/local/sbin !/opt/ps*', '/etc/rkhunter.conf']
  $rtkt_file_whitelist = $::osfamily ? {
    'RedHat' => [
      '/var/log/pki-ca/system',            # FreeIPA Certificate Authority
      '/var/log/pki/pki-tomcat/ca/system',
    ],
    default  => [],
  }
  $rtkt_dir_whitelist  = []
  $os_version_file     = undef  #"/etc/debian_version"
  $stat_cmd            = undef  #"BUILTIN"
  $readlink_cmd        = undef  #"BUILTIN"
  $web_cmd             = undef  #
  $warn_on_os_change   = undef  #"1"
  $updt_on_os_change   = undef  #"0"
  $scanrootkitmode     = undef  #"TROUGH"
  $unhide_tests        = undef  #"sys"
  $unhidetcp_opts      = undef

  $show_summary_warnings_number = undef
  $show_summary_time   = undef
  $empty_logfiles      = undef
  $missing_logfiles    = undef

  $scriptwhitelist     = $::osfamily ? {
    'RedHat' => [
      '/usr/bin/whatis',
      '/usr/bin/ldd',
      '/usr/bin/groups',
      '/usr/bin/GET',
      '/sbin/ifup',
      '/sbin/ifdown',
    ],
    default  => [
      '/bin/egrep',
      '/bin/fgrep',
      '/bin/which',
      '/usr/bin/groups',
      '/usr/bin/ldd',
      '/usr/bin/lwp-request',
      '/usr/sbin/adduser',
      '/usr/sbin/prelink',
    ],
  }
  $immutewhitelist = []
  $allowhiddendir = $::osfamily ? {
    'RedHat' => [
      '/etc/.java',
      '/dev/.udev',
      '/dev/.udevdb',
      '/dev/.udev.tdb',
      '/dev/.udev/db',
      '/dev/.udev/rules.d',
      '/dev/.static',
      '/dev/.initramfs',
      '/dev/.SRC-unix',
      '/dev/.mdadm',
      '/dev/.systemd',
      '/dev/.mount',
      '/etc/.git',
      '/etc/.bzr',
    ],
    'Debian' => [
      '/etc/.java',
      '/dev/.udev',
      '/dev/.initramfs',
    ],
    default  => [
#      '/etc/.java',
#      '/dev/.static',
#      '/dev/.SRC-unix',
#      '/etc/.etckeeper',
    ],
  }
  $allowhiddenfile = $::osfamily ? {
  'RedHat' => [
    '/usr/share/man/man1/..1.gz',
    '/lib*/.libcrypto.so.*.hmac',
    '/lib*/.libssl.so.*.hmac',
    '/usr/bin/.fipscheck.hmac',
    '/usr/bin/.ssh.hmac',
    '/usr/bin/.ssh-keygen.hmac',
    '/usr/bin/.ssh-keyscan.hmac',
    '/usr/bin/.ssh-add.hmac',
    '/usr/bin/.ssh-agent.hmac',
    '/usr/lib*/.libfipscheck.so.*.hmac',
    '/usr/lib*/.libgcrypt.so.*.hmac',
    '/usr/lib*/hmaccalc/sha1hmac.hmac',
    '/usr/lib*/hmaccalc/sha256hmac.hmac',
    '/usr/lib*/hmaccalc/sha384hmac.hmac',
    '/usr/lib*/hmaccalc/sha512hmac.hmac',
    '/usr/sbin/.sshd.hmac',
    '/dev/.mdadm.map',
    '/dev/.udev/queue.bin',
    '/usr/share/man/man5/.k5login.5.gz',
    '/usr/share/man/man5/.k5identity.5.gz',
    '/usr/sbin/.ipsec.hmac',
    '/sbin/.cryptsetup.hmac',
    # etckeeper
    '/etc/.etckeeper',
    '/etc/.gitignore',
    '/etc/.bzrignore',
# systemd
    '/etc/.updated',
  ],
  default  => [
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
    ],
  }
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
  $allowdevfile = $::osfamily ? {
    'RedHat' => [
      '/dev/shm/pulse-shm-*',
      '/dev/md/md-device-map',
      '/dev/shm/mono.*', # tomboy creates this one
      '/dev/shm/libv4l-*', # created by libv4l
      '/dev/shm/spice.*', # created by spice video
      '/dev/md/autorebuild.pid', # created by mdadm
      '/dev/shm/sem.slapd-*.stats', # 389 Directory Server
      '/dev/shm/squid-cf*', # squid proxy
      '/dev/shm/squid-ssl_session_cache.shm', # squid ssl cache
      '/dev/.mdadm.map',
      '/dev/.udev/queue.bin',
      '/dev/.udev/db/*',
      '/dev/.udev/rules.d/99-root.rules',
      '/dev/.udev/uevent_seqnum',
      # Allow PCS/Pacemaker/Corosync
      '/dev/shm/qb-attrd-*',
      '/dev/shm/qb-cfg-*',
      '/dev/shm/qb-cib_rw-*',
      '/dev/shm/qb-cib_shm-*',
      '/dev/shm/qb-corosync-*',
      '/dev/shm/qb-cpg-*',
      '/dev/shm/qb-lrmd-*',
      '/dev/shm/qb-pengine-*',
      '/dev/shm/qb-quorum-*',
      '/dev/shm/qb-stonith-*',
    ],
    default  => [
#      '/dev/shm/pulse-shm-*',
#      '/dev/shm/sem.ADBE_*',
    ],
  }
  $allowipcproc = []
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
  $port_path_whitelist = []
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
