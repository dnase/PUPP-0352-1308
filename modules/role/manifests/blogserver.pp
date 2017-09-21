class role::blogserver {
  include profile::base::security
  include profile::wordpress
  include profile::nagios
  include profile::splunk
}
