class webapp::wordpress {
  include wordpress

  class { 'webapp':
    docroot  => '/opt/wordpress',
    appname => 'wordpress',
  }
}
