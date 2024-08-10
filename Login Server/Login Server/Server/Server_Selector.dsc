Server_Selector_Gui:
    type: inventory
    inventory: chest
    gui: true
    title: Server Status
    debug: false
    procedural items:
    - define result <list>
    - foreach <bungee.list_servers> as:Bungee:
        - define server_name <[Bungee]>
        - define online_players <server.flag[<[Bungee]>.online_players]>
        - define max_players <server.flag[<[Bungee]>.max_players]>
        - define server_tps <server.flag[<[Bungee]>.server_tps]>
        - define item green_wool[display=<[server_name]>;Lore=<[online_players]>/<[max_players]><n><[server_tps]>]
        - define result <[result].include[<[item]>]>
    - determine <[result]>
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

Server_selector_task_world:
    type: world
    debug: false
    events:
        after delta time secondly every:10:
        - run server_selector_task

Server_selector_task:
    type: task
    debug: false
    script:
    - foreach <bungee.list_servers> as:Bungee:
        - ~bungeetag server:<[Bungee]> <server.max_players> save:max_players
        - ~bungeetag server:<[Bungee]> <server.online_players> save:online_players
        - ~bungeetag server:<[Bungee]> <server.recent_tps.average.round> save:server_tps
        - define online 0
        - foreach <entry[online_players].result>:
            - define online:+:1
        - flag server <[Bungee]>
        - flag server <[Bungee]>.online_players:<[online]>
        - flag server <[Bungee]>.max_players:<entry[max_players].result>
        - flag server <[Bungee]>.server_tps:<entry[server_tps].result>