Database:
    type: world
    events:
        on server start:
        - ~sql id:Login connect:192.168.178.60:3306/s19_Tendral_Character?autoReconnect=true username:u19_XlTkIkk0tb password:<secret[sql_pwd]>
        - debug type:debug <util.sql_connections>
        on player joins:
        - ~sql id:Login "query:SELECT * FROM players WHERE uuid = '<player.uuid>';" save:PlayerCheck
        - debug type:debug <entry[PlayerCheck].result_list>
        - if <entry[PlayerCheck].result_list.is_empty>:
            - ~sql id:Login "update:INSERT INTO players (uuid, last_login) VALUES ('<player.uuid>', '<util.time_now.to_zone[+2].format[YYYY-MM-dd-HH:mm:ss]>');"
        - else:
            - ~sql id:Login "update:UPDATE players SET last_login = '<util.time_now.to_zone[+2].format[YYYY-MM-dd-HH:mm:ss]>' WHERE uuid = '<player.uuid>';"
            - ~sql id:Login "update:UPDATE players SET selected_profile_id = 0"

Database_Profils:
    type: task
    definitions: uuid[Player UUID]|Argument[Add or Take]
    script:
    - choose <[Argument]>:
        - case add:
            - ~sql id:Login "update:UPDATE players SET profiles_created = profiles_created + 1 WHERE uuid = '<[uuid]>';"
        - case take:
            - ~sql id:Login "update:UPDATE players SET profiles_created = GREATEST(profiles_created - 1, 0) WHERE uuid = '<[uuid]>';"

Database_player_profiles:
    type: task
    definitions: uuid|profil_number|profil_name|class_type
    script:
    - ~sql id:Login "update:INSERT INTO player_profiles (uuid, profile_number, profile_name, class_type) VALUES ('<[uuid]>', '<[profil_number]>', '<[profil_name]>', '<[class_type]>')"

Database_player_profiles_read:
    type: task
    definitions: uuid
    script:
    - ~sql id:Login "query:SELECT * FROM player_profiles WHERE uuid = '<[uuid]>';" save:player_profiles
    - foreach <entry[player_profiles].result_list>:
        - narrate <[value]> targets:<[uuid]>