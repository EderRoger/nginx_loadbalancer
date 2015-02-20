$location = "/vagrant/AngularMongo"

exec { "aptGetUpdate":
  command => "sudo apt-get update",
  path => ["/bin", "/usr/bin"]
}

package { mongodb:
  ensure => present
}

package { 'curl':
  ensure => installed
}

package { 'git':
  ensure => present
}

#exec { 'angular_mongo':
#  command => "git clone https://github.com/EderRoger/AngularMongo.git",
#  path => ["/bin", "/usr/bin"], 
#  require => Package['git'],
#}

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
   require => Exec["add_node_package"]
}

exec { "install_bower":
   command => "npm install -g bower",
   path => ["/bin", "/usr/bin"], 
   user => 'root',
   require => Package["nodejs"]
}

exec { 'start_app':
  command => "npm start",
  path => ["/bin", "/usr/bin"],
  cwd => '/vagrant/AngularMongo',
  require => Exec["install_bower"]
}

#exec { "npm_install":
# command => "cd /vagrant/AngularMongo & npm install",
#  user => 'root',
#  path    => "/usr/local/bin/:/bin/",
#  require => Exec["add_node_package"]
#}

#exec { "my_exec_task":
#  command => "tar zxf /home/user/tmp/test.tar.gz",
#  creates => "/home/user/tmp/new_directory",
#  path    => "/usr/local/bin/:/bin/",
#}

