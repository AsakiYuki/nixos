{...}: {
  services.dae = {
    enable = true;
    config = ''
      global {
        # Bind to LAN and/or WAN as you want. Replace the interface name to your own.
        lan_interface: enp1s0
        wan_interface: auto # Use "auto" to auto detect WAN interface.

        log_level: info
        allow_insecure: false
        auto_config_kernel_parameter: true
      }

      subscription {
        # Fill in your subscription links here.
      }

      # See https://github.com/daeuniverse/dae/blob/main/docs/en/configuration/dns.md for full examples.
      dns {
        upstream {
          googledns: 'tcp+udp://dns.google:53'
          alidns: 'udp://dns.alidns.com:53'
        }
        routing {
          request {
            qtype(https) -> reject
            fallback: alidns
          }
          response {
            upstream(googledns) -> accept
            ip(geoip:private) && !qname(geosite:cn) -> googledns
            fallback: accept
          }
        }
      }

      group {
        proxy {
          #filter: name(keyword: HK, keyword: SG)
          policy: min_moving_avg
        }
      }

      # See https://github.com/daeuniverse/dae/blob/main/docs/en/configuration/routing.md for full examples.
      routing {
        pname(NetworkManager) -> direct
        pname(AdGuardHome) -> direct
        dip(224.0.0.0/3, 'ff00::/8') -> direct

        ### Write your rules below.

        # Disable h3 because it usually consumes too much cpu/mem resources.
        l4proto(udp) && dport(443) -> block
        dip(geoip:private) -> direct
        dip(geoip:cn) -> direct
        domain(geosite:cn) -> direct

        fallback: proxy
      }
    '';
  };
}
