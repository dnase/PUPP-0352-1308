define system::managed_user (
  $password = '$1$jgmXTZMM$0trxFo4s0uZ4M4r7hcFJf1',
) {
  user { $title:
    ensure     => present,
    password   => $password,
    home       => "/home/${title}",
    managehome => true,
  }
  if $::kernel == 'Linux' {
    file { "/home/${title}/.bashrc":
      ensure => file,
    }
  }
}
