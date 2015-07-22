include java
include xvfb

$selenium_base_dir="/opt/selenium"
$download_version="2.46"
$jar_name="selenium-server-standalone-2.46.0.jar"
$firefox_version="31.4.0-1.el7.centos"

# need to disable so host can access guest machine
package { "firewalld":
  ensure => "purged",
}

class { 'selenium-binary' :
  selenium_base_dir => $selenium_base_dir,
  download_version => $download_version,
  jar_name => $jar_name,
}

class { 'firefox' :
  firefox_version => $firefox_version,
}

class { 'selenium-node' :
  selenium_base_dir => $selenium_base_dir,
  jar_name => $jar_name,
}

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ], user => "vagrant", logoutput => true, }
Package { allow_virtual => false }

Class ['java'] -> Class['xvfb'] -> Class ['selenium-binary'] -> Class ['firefox'] -> Class ['selenium-node']
