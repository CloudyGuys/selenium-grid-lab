class firefox ($firefox_version){

  package { 'firefox' :
    ensure => $firefox_version,
    provider => yum,
  }
  
}