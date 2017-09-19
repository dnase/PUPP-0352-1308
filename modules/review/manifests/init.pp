class review (
  $user = 'review',
) {

  $homedir = $user ? {
    'root'  => '/root',
    default => "/home/${user}",
  }

  user { $user:
    ensure     => present,
    home       => $homedir,
    managehome => true,
  }
  file { $homedir:
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0700',
  }
  file { "${homedir}/.bashrc":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0600',
  }
  service { 'puppet':
    ensure => stopped,
    enable => false,
  }
  include review::motd
}
