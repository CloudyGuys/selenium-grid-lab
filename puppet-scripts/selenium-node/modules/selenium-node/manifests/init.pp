class selenium-node ($selenium_base_dir, $jar_name){

$node_home="$selenium_base_dir/node"
 
  file { $node_home :
    ensure => directory,
	owner => "vagrant",
	group => "vagrant",
	require => File[$selenium_base_dir],
  }
  
  file { "$node_home/logs" :
    ensure => directory,
	owner => "vagrant",
	group => "vagrant",
	require => File[$node_home],
  }
  
  file { "$node_home/node.json" :
	ensure => present,
	source => "puppet:///modules/selenium-node/node.json",
  }
  
  file { "$node_home/node.sh" :
	ensure => present,
	source => "puppet:///modules/selenium-node/node.sh",
	require => File [ "$node_home/node.json" ]
  }
  
  service { 'selenium-node':
    ensure     => running,
    hasstatus  => false,
    start      => "$node_home/node.sh start $selenium_base_dir $jar_name",
	status     => "$node_home/node.sh status",
    require => File [ "$node_home/node.sh" ]
  }
 
}