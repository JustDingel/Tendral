Datenbank_Tendral:
    type: world
    debug: false
    events:
        after server start:
        - announce to_console "<green>[Tendral] Verbindung zur Datenbank wird aufgebaut..."
        #- ~sql id:Spielerdatenbank connect:192.168.178.23:3307/s7_tendral?autoReconnect=true username:u7_0AMOxi5vtj password:<secret[sql_pw]>
        - if <util.sql_connections.is_empty>:
            - announce to_console "<red>Verbinung zur Datenbank fehlgeschlagen..."
        - if !<util.sql_connections.is_empty>:
            - announce to_console "<green>[Tendral] Verbindung zur Datenbank hergestellt."
