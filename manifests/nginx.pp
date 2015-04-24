exec { "aptGetUpdate":
  command => "sudo apt-get update",
  path => ["/bin", "/usr/bin"]
}


package {"nginx":
    ensure => present,
    require => Exec["aptGetUpdate"]
}

file {"rm-nginx-default":
    path => '/etc/nginx/sites-enabled/default',
    ensure => absent,
    require => Package['nginx'],
}

service { "nginx":
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => Package["nginx"],
}

file {"setup-nginx-default":
    path => '/etc/nginx/sites-enabled/default.conf',
    ensure => present,
    require => Package['nginx'],
    source => "/vagrant/manifests/default.conf",
    notify => Service["nginx"],
}
