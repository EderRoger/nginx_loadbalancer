exec { "aptGetUpdate":
  command => "sudo apt-get update",
  path => ["/bin", "/usr/bin"]
}

package { mongodb:
  ensure => present
}

#package { nodejs:
#  ensure => present,
#}

exec { "add_node_package":
    command => "curl -sL https://deb.nodesource.com/setup | sudo bash -",
    path    => "/usr/local/bin/:/bin/",
    # path    => [ "/usr/local/bin/", "/bin/" ],  # alternative syntax
}
 
package {nodejs: require => Exec["add_node_package"]}

#package { npm:
#  ensure => latest,
#    require => Package["nodejs"]
#}

#exec { "npm_update":
#    command => "npm config set registry https://registry.npmjs.org/",
#    path => '/usr/bin/:/bin/',
#    require => Package['nodejs'],
#    user => 'root'
#}

