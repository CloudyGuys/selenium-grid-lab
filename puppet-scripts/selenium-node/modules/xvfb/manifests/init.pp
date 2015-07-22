class xvfb {

  $xvfb_home="/opt/xvfb"
  $display=":99"

  package { 'xorg-x11-server-Xvfb.x86_64' :
    ensure => installed,
    provider => yum,
  }
  
  file { "$xvfb_home" :
	ensure => directory,
	require => Package [ "xorg-x11-server-Xvfb.x86_64" ]
  }
  
  file { "$xvfb_home/Xvfb.sh" :
	ensure => present,
	source => "puppet:///modules/xvfb/Xvfb.sh",
	require => File [ "$xvfb_home" ],
  }
  
  file { "/etc/environment":
    content => inline_template("DISPLAY=${display}"),
	require => File [ "$xvfb_home/Xvfb.sh" ],
  }
  
  service { 'xvfb':
    ensure     => running,
    hasstatus  => false,
    start      => "$xvfb_home/Xvfb.sh start :99",
	status     => "$xvfb_home/Xvfb.sh  status",
    require => File [ "/etc/environment" ],
  }
  
}