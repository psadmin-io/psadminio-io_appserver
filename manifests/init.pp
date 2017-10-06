class io_appserver (
  $ensure                    = hiera('ensure', 'present'),
  $psft_install_user_name    = hiera('psft_install_user_name', undef),
  $oracle_install_group_name = hiera('oracle_install_group_name', undef),
  $domain_user               = hiera('domain_user', undef),
  $appserver_domain_list     = hiera_hash('appserver_domain_list', undef),
  $desktop_folder            = false,
){

  notify{'Applying module io_portalwar':}

  case $::osfamily {
    'AIX':     {
      $platform = 'AIX'
    }
    'Solaris': {
      $platform = 'SOLARIS'
    }
    'windows': {
      $platform = 'WIN'
    }
    default:   {
      $platform = 'LINUX'
    }
  }

  validate_hash($appserver_domain_list)

  if ($io_appserver::desktop_folder) {
    contain ::io_appserver::desktop_folder
  }

}
