Proxy_Health_Check:
    type: world
    debug: false
    events:
        after delta time minutely every:10:
        - if <bungee.server> == Login:
            - run Proxy_Health
            - run proxy_server_tps

Proxy_Health:
    type: task
    debug: false
    script:
    - if <bungee.server> == Login:
        - define ProxyTPS <list[]>
        - foreach <bungee.list_servers>:
            - ~bungeetag server:<[value]> <server.recent_tps.average> save:Proxy_health_tps
            - define ProxyTPS <list[].include[<entry[Proxy_health_tps].result>]>
        - define ProxyHealth <[ProxyTPS].average.round>
        - log "[Stats] [Tendral] [Bungee]: [Tps: <[ProxyHealth]>]" type:info file:/stats/bungee/bungee_health.log


Proxy_Server_Tps:
    type: task
    debug: false
    script:
    - if <bungee.server> == Login:
        - foreach <bungee.list_servers>:
            - ~bungeetag server:<[value]> <server.recent_tps.average> save:Proxy_Server_Tps
            - flag server <[value]>:<entry[Proxy_Server_Tps].result.round>
            - log "[Stats] [Tendral] [<[value]>]: [Tps: <entry[Proxy_Server_Tps].result.round>]" type:info file:/stats/<[value]>/<[value]>_health.log

Proxy_Health_server_tps:
  type: procedure
  debug: false
  definitions: tps
  script:
  - if <[tps]> > <script[Proxy_Health_Data].data_key[server_tps.perfect_20.if_more_than]>:
    - determine <script[Proxy_Health_Data].data_key[server_tps.perfect_20.display]>
  - else if <[tps]> > <script[Proxy_Health_Data].data_key[server_tps.good_20.if_more_than]>:
    - determine <script[Proxy_Health_Data].data_key[server_tps.good_20.display]>
  - else:
    - determine <server.recent_tps.average.round_up_to_precision[0.01]>

Proxy_Health_Data:
    type: data
    debug: false
    server_tps:
     perfect_20:
      if_more_than: 19.97
      display: 20*
     good_20:
      if_more_than: 19.85
      display: 20