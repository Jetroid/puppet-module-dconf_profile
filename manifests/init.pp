# For dconf-related shenanigans, we need to make sure the profile and
# directories are created first
class dconf_profile {

  package{'dconf-cli':
    ensure => present,
  }

  $dconf_directories = ['/etc/dconf','/etc/dconf/db','/etc/dconf/db/local.d','/etc/dconf/profile','/etc/dconf/db/local.d/locks']

  file{$dconf_directories:
    ensure => directory,
  } -> 

  file{'/etc/dconf/profile/user':
    ensure => present,
    source => 'puppet:///modules/dconf_profile/dconf_profile',
  }

  exec { '/usr/bin/dconf update':
    refreshonly => true,
    require     => Package['dconf-cli'],
  }

}
