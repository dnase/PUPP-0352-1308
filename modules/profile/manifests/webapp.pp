class profile::webapp {
  require apache
  require apache::mod::php
  require mysql::server
  require mysql::bindings
  require mysql::bindings::php

  user { 'wordpress':
    ensure => present,
    gid    => 'wordpress',
  }
  group { 'wordpress':
    ensure => present,
  }

  file { '/var/www/html':
    ensure => directory,
    owner  => 'wordpress',
    group  => 'wordpress',
    mode   => '0775',
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
