class rkhunter::params {
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