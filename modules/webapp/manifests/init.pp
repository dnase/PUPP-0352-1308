class webapp (
  String $docroot = '/var/www/html',
  String $appname = 'webapp',
) {
  include mysql::server
  $port = '80'
  class { 'mysql::bindings':
    php_enable => true,
  }
  include apache
  include apache::mod::php
  apache::vhost { $facts['fqdn']:
    priority   => '10',
    vhost_name => $facts['fqdn'],
    port       => $port,
    docroot    => $docroot,
  }
  @@haproxy::balancermember { $facts['fqdn']:
    listening_service => $appname,
    ports             => [$port],
  }
}
