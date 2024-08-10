Name:
    type: world
    events:
        on player chats:
        - if <player.has_flag[profil_creation.name]>:
            - if <server.flag[profile_names].contains[<context.message>]>:
                - narrate "Dieser Name ist bereits vergeben such dir bitte einen anderen aus."
                - determine passively cancelled
            - else:
                - flag <player> profil_creation.name:<context.message>
                - flag server profile_names:->:<context.message>
                - inventory open d:Rassen
                - determine passively cancelled
                