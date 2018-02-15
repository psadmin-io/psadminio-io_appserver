class io_appserver::service (
  $appserver_domain_list  = $io_appserver::appserver_domain_list,
  $domain_user  = $io_appserver::domain_user,
  $domain_password  = $io_appserver::domain_password,
){

  $appserver_domain_list.each |$domain_name, $app_domain_info| {
    exec { "${domain_name}-user-app-service":
      command  => "C:\\Windows\\System32\\cmd.exe /c sc.exe config \"PsftAppDomain${domain_name}Service\" obj= \"${domain_user}\" password= \"${domain_password}\"",
      onlyif   => "((C:\\Windows\\System32\\cmd.exe /c sc qc \"PsftAppDomain${domain_name}Service\"  | select-string ${domain_user}) -split ' : ')[1]",
      provider => powershell,
    }
  }
}