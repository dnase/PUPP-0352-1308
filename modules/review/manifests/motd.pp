class review::motd {
  file { '/etc/motd':
    ensure  => file,
    content => epp('review/motd.epp'),
  }
}
