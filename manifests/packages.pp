class rkhunter::packages {
  package { 'rkhunter':
    name => "${::rkhunter::params::package_name}",
    ensure => installed,
  }

  file { '/usr/local/bin/rktask':
    ensure => file,
    mode   => '755',
    source => 'puppet:///modules/rkhunter/rktask'
  }
}
