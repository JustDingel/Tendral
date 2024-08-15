Database:
    type: world
    events:
        on server start:
        - ~sql id:Login connect:<secret[sql_ip]> username:<secret[sql_user]> password:<secret[sql_pwd]>
        - debug type:debug <util.sql_connections>
        on player joins:
        - ~sql id:Login "query:SELECT uuid FROM players;" save:PlayerCheck
        - debug type:debug <entry[PlayerCheck].result_list>
        - if <entry[PlayerCheck].result_list.is_empty>:
            - ~sql id:Login "update:INSERT INTO players (uuid, last_login) VALUES ('<player.uuid>', '<util.time_now.to_zone[+2].format[YYYY-MM-dd-HH:mm:ss]>');"
        - else:
            - ~sql id:Login "update:UPDATE players SET last_login = '<util.time_now.to_zone[+2].format[YYYY-MM-dd-HH:mm:ss]>' WHERE uuid = '<player.uuid>';"

Database_Profils:
    type: task
    definitions: uuid[Player UUID]|Argument[Add or Take]
    script:
    - narrate "Hello, world!"