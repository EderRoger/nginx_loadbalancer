exec { "aptGetUpdate":
  command => "sudo apt-get update",
  path => ["/bin", "/usr/bin"]
}


package {"nginx":
    ensure => present,
    require => Exec["aptGetUpdate"]
}

#package { "nginx":
#    ensure => installed
#}

#service { "nginx":
#    require => Package["nginx"],
#    ensure => running,
  #  enable => true
#}

#file { "/etc/nginx/sites-enabled/default":
#    require => Package["nginx"],
#    ensure  => absent,
#    notify  => Service["nginx"]
#}

#file { "/etc/nginx/sites-enabled/default.conf":
#    require => Package["nginx"],
#    ensure => "file",
#    content => template("/vagrant/manifests/default.conf"),
#    notify  => Service["nginx"]
#}

file {"rm-nginx-default":
    path => '/etc/nginx/sites-enabled/default',
    ensure => absent,
    require => Package['nginx'],
}

file {"setup-nginx-default":
    path => '/etc/nginx/sites-enabled/default.conf',
    ensure => present,
    require => Package['nginx'],
    source => "/vagrant/manifests/default.conf",
}
