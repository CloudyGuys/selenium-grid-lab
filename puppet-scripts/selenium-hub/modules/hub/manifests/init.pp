class hub ($selenium_base_dir, $jar_name){

$hub_home="$selenium_base_dir/hub"
 
  file { $hub_home :
    ensure => directory,
	owner => "vagrant",
	group => "vagrant",
	require => File[$selenium_base_dir],
  }
  
  file { "$hub_home/logs" :
    ensure => directory,
	owner => "vagrant",
	group => "vagrant",
	require => File[$hub_home],
  }
  
  file { "$hub_home/hub.json" :
	ensure => present,
	source => "puppet:///modules/hub/hub.json",
  }
  
  file { "$hub_home/hub.sh" :
	ensure => present,
	source => "puppet:///modules/hub/hub.sh",
	require => File [ "$hub_home/hub.json" ]
  }
  
  service { 'selenium-hub':
    ensure     => running,
    hasstatus  => false,
    start      => "$hub_home/hub.sh start $selenium_base_dir $jar_name",
	status     => "$hub_home/hub.sh status",
    require => File [ "$hub_home/hub.sh" ]
  }
 
}