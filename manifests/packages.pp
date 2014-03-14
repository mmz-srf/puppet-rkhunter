class rkhunter::packages {
  package { 'rkhunter':
    name => "${::rkhunter::params::package_name}",
    ensure => installed,
  }
}