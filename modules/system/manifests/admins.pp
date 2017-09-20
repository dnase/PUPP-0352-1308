class system::admins {
  require mysql::server
  $users = {
    'zack'                 => {
      max_queries_per_hour => 1200
    },
    'monica' => {},
    'brad' => {},
    'luke' => {},
  }
  $retired_users = ['ralph']

  $users.each |$user, $data| {
    user { $user:
      ensure => present,
    }
    mysql_user { "${user}@localhost":
      ensure               => present,
      max_queries_per_hour => pick($data['max_queries_per_hour'], 600),
    }
  }

  $retired_users.each |$user| {
    user { $user:
      ensure => absent,
    }
    mysql_user { "${user}@localhost":
      ensure => absent,
    }
  }
}
