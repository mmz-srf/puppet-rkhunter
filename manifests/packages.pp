class rkhunter::packages {
  package { 'rkhunter':
    name => "${::rkhunter::params::package_name}",
    ensure => installed,
  }

  file { '/usr/local/bin/rktask':
    ensure => file,
    mode   => '0755',
    source => 'puppet:///modules/rkhunter/rktask'
  }
  
  # Run rkhunter --propupd after installation of package
  exec { '/usr/bin/rkhunter --propupd':
    subscribe => Package['rkhunter'],
  }
}
