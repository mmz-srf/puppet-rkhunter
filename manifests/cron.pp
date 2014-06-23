class rkhunter::cron(
  $hour = '4',
  $weekday = '*',
  $email = 'root@localhost',

  $update = 'true',
  $syslog = 'true',
  $log_output = '> /var/log/rkhunter_warnings.log',
) {

  $cron_cmd = "rkhunter --cronjob --rwo --syslog --update ${log_output}"

  cron { 'rkhunter-cron':
    ensure      => 'present',
    command     => $cron_cmd,
    user        => root,
    hour        => $hour,
    minute      => fqdn_rand(59),
    weekday     => $weekday,
    environment => [ 'PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin', "MAILTO=${email}" ],
  }

}