class rkhunter::cron(
  $hour = '4',
  $minutes_random = '90', 
  $weekday = '*',
  $email = 'root@localhost',

  $update = 'true',
  $syslog = 'true',
) {
  
  $cron_cmd = "/bin/sleep `/usr/bin/expr $RANDOM \% ${minutes_random}`m ; rkhunter --cronjob --rwo --syslog --update > /var/log/rkhunter_warnings.log"

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