exec { "aptGetUpdate":
  command => "sudo apt-get update",
  path => ["/bin", "/usr/bin"]
}

package { mongodb:
  ensure => present
}
package { nodejs:
  ensure => present
}

package { npm:
  ensure => present,
  require => Package["nodejs"]
}
