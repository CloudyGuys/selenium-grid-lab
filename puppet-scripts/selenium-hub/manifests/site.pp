include java

$selenium_base_dir="/opt/selenium"
$download_version="2.46"
$jar_name="selenium-server-standalone-2.46.0.jar"

# need to disable so host can access guest machine
package { "firewalld":
  ensure => "purged",
}

class { 'selenium-binary' :
  selenium_base_dir => $selenium_base_dir,
  download_version => $download_version,
  jar_name => $jar_name,
}

class { 'hub' :
  selenium_base_dir => $selenium_base_dir,
  jar_name => $jar_name,
}

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ], user => "vagrant", logoutput => true, }
Package { allow_virtual => false }

Class ['java'] -> Class ['selenium-binary'] -> Class['hub']
