Database:
    type: world
    events:
        on server start:
        - ~sql id:Lobby connect:192.168.178.60:3306/s19_Tendral_Character?autoReconnect=true username:u19_XlTkIkk0tb password:LFB.@P9V2mFzZjqgs^W^!6Sa
        - debug type:debug <util.sql_connections>
        on player joins:
        - ~sql id:Lobby "query:SELECT uuid FROM players;" save:PlayerCheck
        - debug type:debug <entry[PlayerCheck].result_list>
        - if <entry[PlayerCheck].result_list.is_empty>:
            - ~sql id:Lobby "update:INSERT INTO players (uuid, last_login) VALUES ('<player.uuid>', '<util.time_now.to_zone[+2].format[YYYY-MM-dd-HH:mm:ss]>');"
        - else:
            - ~sql id:Lobby "update:UPDATE players SET last_login = '<util.time_now.to_zone[+2].format[YYYY-MM-dd-HH:mm:ss]>' WHERE uuid = '<player.uuid>';"