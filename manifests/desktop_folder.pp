class io_appserver::desktop_folder (
  $appserver_domain_list  = $io_appserver::appserver_domain_list,
){

  file { 'C:/Windows/System32/config/systemprofile/desktop':
    ensure    => directory,
  }

}