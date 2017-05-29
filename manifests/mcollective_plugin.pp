class rkhunter::mcollective_plugin {

  $mcollecgtive_plugindir = $::osfamily ? {
    'Debian' => '/usr/share/mcollective/plugins',
    default  => '/usr/libexec/mcollective',
  }

  file { "${mcollecgtive_plugindir}/mcollective/agent/rkhunter.rb":
    ensure => file,
    mode   => '0754',
    source => 'puppet:///modules/rkhunter/mcollective-agent/rkhunter.rb',
  }

  file { "${mcollecgtive_plugindir}/mcollective/agent/rkhunter.ddl":
    ensure => file,
    mode   => '0754',
    source => 'puppet:///modules/rkhunter/mcollective-agent/rkhunter.ddl',
  }

}
