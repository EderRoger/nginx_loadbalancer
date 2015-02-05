exec { "aptGetUpdate":
  command => "sudo apt-get update",
  path => ["/bin", "/usr/bin"]
}

package { mongodb:
  ensure => present
}

package { nodejs:
  ensure => present,
}

package { npm:
  ensure => latest,
    require => Package["nodejs"]
}

#exec { "npm_update":
#    command => "npm config set registry https://registry.npmjs.org/",
#    path => '/usr/bin/:/bin/',
#    require => Package['nodejs'],
#    user => 'root'
#}

