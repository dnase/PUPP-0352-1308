class files {
  file { '/etc/cron.allow':
    ensure => file,
  }
  file { '/etc/cron.deny':
    ensure => file,
  }

  file_line { 'deny cronjobs':
    ensure => present,
    path   => '/etc/cron.deny',
    line   => '*',
  }
  file_line { 'allow cronjobs':
    ensure => present,
    path   => '/etc/cron.allow',
    line   => 'root',
  }

  concat { '/etc/motd':
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
  concat::fragment { 'motd header':
    target  => '/etc/motd',
    order   => '01',
    content => '# This file is managed by Puppet. Hands off sucka!',
  }
  concat::fragment { 'motd message':
    target  => '/etc/motd',
    order   => '02',
    content => 'This is a MOTD. I think it is one of the best ever written.',
  }
}
