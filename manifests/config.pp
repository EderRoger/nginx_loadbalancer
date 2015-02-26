$location = "/vagrant/AngularMongo"

exec { "aptGetUpdate":
  command => "sudo apt-get update",
  timeout => 0,
  path => ["/bin", "/usr/bin"]
}

#package { mongodb:
#  ensure => present
#}

package { 'curl':
  ensure => installed
}

package { 'git':
  ensure => present
}

package { nodejs: 
   require => Exec["add_node_package"]
}

exec { "add_node_package":
   command => "curl -sL https://deb.nodesource.com/setup | sudo bash -",
   path => ["/bin", "/usr/bin"], 
}
 
exec { "install_mongoose":
   command => "npm install mongoose",
   path => ["/bin", "/usr/bin"],
   user => 'root',
   timeout => 0, 
   require => Exec["add_node_package"]
}

exec { "install_bower":
   command => "npm install -g bower",
   path => ["/bin", "/usr/bin"], 
   user => 'root',
   timeout => 0,
   require => Package["nodejs"]
}
#enable to automatic start
#exec { "start_apps":
#   command => "npm start &",
#  path => ["/bin", "/usr/bin"], 
#   cwd => "/vagrant/AngularMongo",
#   require => Exec["install_bower"],
#}
