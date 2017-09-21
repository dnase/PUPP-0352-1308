class profile::webapp {
  include apache
  include apache::mod::php
  include mysql::server
  include mysql::bindings
  include mysql::bindings::php

  user { 'wordpress':
    ensure => present,
    gid    => 'wordpress',
  }
  group { 'wordpress':
    ensure => present,
  }

  class { 'wordpress':
    install_dir => '/var/www/html',
    wp_owner    => 'wordpress',
    wp_group    => 'wordpress',
    require     => Class['apache'],
  }

  @@haproxy::balancermember { "capstone_${::fqdn}":
    listening_service => 'web00',
    server_names      => $::hostname,
    ipaddresses       => $::ipaddress,
    options           => 'check',
    ports             => '80',
  }
}
