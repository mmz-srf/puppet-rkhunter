class rkhunter::cron_updatedb(
  $hour           = '2',
  $weekday        = '1',
  $email          = 'root@localhost',
) {

  $cron_cmd = 'rkhunter --cronjob --syslog --update'

  cron { 'rkhunter-cron-update':
    ensure      => 'present',
    command     => $cron_cmd,
    user        => 'root',
    hour        => $hour,
    minute      => fqdn_rand(59),
    weekday     => $weekday,
    environment => [ 'PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin', "MAILTO=${email}" ],
  }

}
