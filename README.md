# Info

This is a minimal example of a "bug"/confusing behavior in nixos' nginx config.

In my real config, I put

```nix
{
  #...
  services.nginx.virtualHosts."myhost.tld" = {
    # ...
    listen = [
      { addr = "0.0.0.0"; port = 443; ssl = true; }
    ];
    forceSSL = true;
    enableACME = true;
  };
}
```

to be extra explicit. This caused nix to generate a "server" line with no "listen" config, which nginx doesn't complain about and just, does nothing with that server block.

To repro: clone, cd, and

```sh
nix build .#nixosConfigurations.default.config.system.build.toplevel
cat result/etc/nginx/nginx.conf
```

## License

This work is released under [CC0 1.0](http://creativecommons.org/publicdomain/zero/1.0)
