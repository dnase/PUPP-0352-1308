class profile::splunk::server {
  class { 'splunk':
    deploy            => 'server',
    splunk_admin      => 'drew',
    splunk_admin_pass => 'hunter2',
  }
}
