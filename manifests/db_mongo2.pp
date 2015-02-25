 exec { "aptGetUpdate":
  command => "sudo apt-get update",
  path => ["/bin", "/usr/bin"]
}

package { mongodb:
  ensure => present,
  require => Exec["aptGetUpdate"]
}

file {"rm-mongodb-conf":
    path => '/etc',
    ensure => absent,
    require => Package['mongodb'],
}

service { "mongodb":
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => Package["mongodb"],
}

file {"setup-mongodb-conf":
    path => '/etc/mongodb.conf',
    ensure => present,
    require => Package['mongodb'],
    source => "/vagrant/manifests/mongo2/mongodb.conf",
    notify => Service["mongodb"],
}

file {"setup-hosts-replicaset":
    path => '/etc/hosts',
    ensure => present,
    require => Package['mongodb'],
    source => "/vagrant/manifests/hosts",
}

# create a directory      
file { "/mongo-metadata":
    ensure => "directory",
}

# Install mongodb client.
#
#class mongodb::client {

#    package { "mongodb":
#        ensure => installed,
#    }

#}

# Install mongodb server.
#
#class mongodb::server {
#
#    package { "mongodb-server":
#        ensure => installed,
#    }

 #   if $mongodb_datadir {
 #       file { $mongodb_datadir:
 #           ensure  => directory,
 #           mode    => "0755",
#            owner   => "mongodb",
#            group   => "mongodb",
 #           require => Package["mongodb-server"],
 #           before  => File["/srv/mongodb"],
 #       }
 #       file { "/srv/mongodb":
 #           ensure  => link,
 #           target  => $mongodb_datadir,
 #       }
 #   } else {
 #       file { "/srv/mongodb":
 #           ensure  => directory,
 #           mode    => "0755",
 #           owner   => "mongodb",
 #           group   => "mongodb",
 #           require => Package["mongodb-server"],
 #       }
 #   }

 #   file { "/etc/mongodb.conf":
 #       ensure => present,
 #       mode   => "0644",
 #       owner  => "root",
 #       group  => "root",
 #       source => "/vagrant/manifests/mongodb.conf",
 #       notify => Service["mongod"],
 #   }

  #  service { "mongod":
  #      ensure  => running,
  #      enable  => true,
  #      hasrestart => true,
  #      require => File["/srv/mongodb"],
 #   }

#}




