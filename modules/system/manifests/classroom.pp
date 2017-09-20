class system::classroom {
  @@host { $::fqdn:
    ensure       => present,
    ip           => $::ipaddress,
    host_aliases => [$::hostname],
    tag          => 'classroom',
  }

  Host <<| tag == 'classroom' |>>
}
