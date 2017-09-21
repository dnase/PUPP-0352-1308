class role::logserver {
  include profile::base::security
  include profile::splunk::server
  include profile::nagios
  include profile::splunk
}
