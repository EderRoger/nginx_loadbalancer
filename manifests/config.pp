debug("this is debug. visible only with -d or --debug")

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin', '/usr/local/bin']
}

# --- Preinstall Stage ---#

stage { 'preinstall':
  before => Stage['main']
}

# Define the install_packages class
class install_packages {
  package { ['curl', 'build-essential', 'libfontconfig1', 'python',
             'nodejs', 'npm',  'g++', 'make', 'wget', 'tar', 'mc', 'htop']:
    ensure => present
  }
}

# Declare (invoke) install_packages
class { 'install_packages':
  stage => preinstall
}

# Setup your locale to avoid warnings
file { '/etc/default/locale':
  content => "LANG=\"en_US.UTF-8\"\nLC_ALL=\"en_US.UTF-8\"\n"
}

# --- NodeJS --- #

# Because of a package name collision, 'node' is called 'nodejs' in Ubuntu.
# Here we're adding a symlink so 'node' points to 'nodejs'
file { '/usr/bin/node':
  ensure => 'link',
  target => "/usr/bin/nodejs",
}

package { 'mongodb':
  ensure => present,
}

service { 'mongodb':
  ensure  => running,
  require => Package['mongodb'],
}

exec { 'allow remote mongo connections':
  command => "/usr/bin/sudo sed -i 's/bind_ip = 127.0.0.1/bind_ip = 0.0.0.0/g' /etc/mongodb.conf",
  notify  => Service['mongodb'],
  onlyif  => '/bin/grep -qx  "bind_ip = 127.0.0.1" /etc/mongodb.conf',
}

exec { "aptGetUpdate":
  command => "sudo apt-get update",
  path => ["/bin", "/usr/bin"]
}
exec { "git_clone_n":
  command => "git clone https://github.com/visionmedia/n.git /home/vagrant/n",
  path => ["/bin", "/usr/bin"],
  require => [Exec["aptGetUpdate"], Package["git"], Package["curl"], Package["g++"]]
}

exec { "install_n":
  command => "make install",
  path => ["/bin", "/usr/bin"],
  cwd => "/home/vagrant/n",
  require => Exec["git_clone_n"]
}

exec { "install_node":
  command => "n stable",
  path => ["/bin", "/usr/bin", "/usr/local/bin"],  
  require => [Exec["git_clone_n"], Exec["install_n"]]
}

