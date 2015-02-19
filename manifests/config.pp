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

exec { "add_node_package":
   command => "curl -sL https://deb.nodesource.com/setup | sudo bash -",
   path => ["/bin", "/usr/bin"], 
   #path    => "/usr/local/bin/:/bin/",
   #path    => [ "/usr/local/bin/", "/bin/" ],  # alternative syntax
}
 
package {nodejs: require => Exec["add_node_package"]}

