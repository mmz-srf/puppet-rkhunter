class rkhunter::cron(
  $hour = '4',
  $minutes_random = '90', 
  $weekday = '*',
  $email = 'root@localhost',

  $update = 'true',
  $syslog = 'true',
  $log_output = '> /var/log/rkhunter_warnings.log',
) {
  
  $cron_cmd = "/bin/sleep $((RANDOM%${minutes_random}))m; rkhunter --cronjob --rwo --syslog --update ${log_output}"

  cron { 'rkhunter-cron':
    ensure => 'present',
    command => $cron_cmd,
    user => root,
    hour => $hour,
    minute => '00',
    weekday => $weekday,
    environment => [ 'PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin', "MAILTO=${email}" ],
  }

}
