Bungeelist:
    type: world
    debug: false
    events:
        after delta time minutely every:10:
        - if <bungee.server> == Lobby:
            - run bungeemaxslot
            - run bungeeonlineplayer
            - run bungeestats
        on proxy server list ping:
        - if <bungee.server> == Lobby:
            - define 1 "<gold><bold>                <gray>play.<gold><bold>TENDRAL<gray>.de           <gray>v0.0.1-A <yellow>⭐"
            - define 2 "<gold><bold>                New Server Yeay!"
            - determine passively MOTD:<[1]><n><[2]>
            - determine passively MAX_PLAYERS:<server.flag[max_players]>

BungeeMaxSlot:
    type: task
    debug: false
    script:
    - if <bungee.server> == Lobby:
        - foreach <bungee.list_servers>:
            - ~bungeetag server:<[value]> <server.max_players> save:max_players
            - define max_players:+:<entry[max_players].result>
            - flag server max_players:<[max_players]>
        - if <server.has_flag[max_players]>:
            - log "[Stats] [Tendral] [Bungee]: [<server.flag[online_players]>]/[<server.flag[max_players]>]" type:info file:/stats/bungee/bungee.log

BungeeOnlinePlayer:
    type: task
    debug: false
    script:
    - if <bungee.server> == Lobby:
        - foreach <bungee.list_servers>:
            - ~bungeetag server:<[value]> <server.online_players> save:online_players
            - define online 0
            - foreach <entry[online_players].result>:
                - define online:+:1
            - define online_players:+:<[online]>
            - flag server online_players:<[online_players]>

BungeeStats:
    type: task
    debug: false
    script:
    - if <bungee.server> == Lobby:
        - foreach <bungee.list_servers>:
            - ~bungeetag server:<[value]> <server.max_players> save:max_players
            - ~bungeetag server:<[value]> <server.online_players> save:online_players
            - define online 0
            - foreach <entry[online_players].result>:
                - define online:+:1
            - log "[Stats] [Tendral] [<[value]>]: [<[online]>]/[<entry[max_players].result>]" type:info file:/stats/<[value]>/<[value]>.log