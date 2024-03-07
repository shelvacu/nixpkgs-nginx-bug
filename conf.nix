{
  # just need to convince this to build for this example
  boot.isContainer = true;

  services.nginx.enable = true;
  services.nginx.enableReload = true; # just so we get the conf file in /etc/nginx/nginx.conf
  services.nginx.virtualHosts."test.example.com" = {
    listen = [ { addr = "0.0.0.0"; port = 443; ssl = true; } ];
    forceSSL = true;
    sslCertificate = "/doesnt/matter";
    sslCertificateKey = "/doesnt/matter";
  };
}
