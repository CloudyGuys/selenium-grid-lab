class selenium-binary ($selenium_base_dir, $download_version, $jar_name){

$download_url="http://selenium-release.storage.googleapis.com/$download_version/$jar_name"

  file { $selenium_base_dir :
    ensure => directory,
	owner => "vagrant",
	group => "vagrant",
  }
 
  exec {
    "download_selenium_jar":
	command => "curl -o $jar_name $download_url",
    cwd => "$selenium_base_dir",
    require => File[$selenium_base_dir],
    creates => "$selenium_base_dir/$jar_name",
  }
 
}