class io_appserver::desktop_folder (
  $appserver_domain_list  = $io_appserver::appserver_domain_list,
){

  file { 'desktop-folder-64':
    path => 'C:/Windows/System32/config/systemprofile/Desktop',
    ensure    => directory,
  }

  file {'desktop-folder-32':
    path => 'C:/Windows/SysWOW64/config/systemprofile/Desktop',
    ensure => directory,
  }
}