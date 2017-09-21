class profile::exim {
  include clamav
  include spamd
  class { '::exim':
    version => '1.0.1',
  }
}
