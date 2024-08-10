Login_Server:
    type: world
    debug: true
    events:
        on player joins:
        - determine none
        on player quits:
        - determine none
        after player joins:
        - if <player.has_flag[first_login]>:
            - determine cancelled
        - else:
            - inventory clear
            - team name:Login add:<player>
            - team name:Login option:name_tag_visibility status:never
            - team name:Login option:collision_rule status:never
            - team name:Login option:see_invisible status:never
            - invisible <player> true for:<server.online_players.exclude[<player>]>
            - teleport <player> <location[Spawn]>
            - cast darkness duration:infinite no_icon hide_particles
            - narrate "<gold>[Tendral] <red>[System] - <reset>Resourcepack wird geladen..."
            - resourcepack url:https://download.mc-packs.net/pack/c3625c7049271640d9c9690ded696363de82eda9.zip hash:c3625c7049271640d9c9690ded696363de82eda9 forced
        on resource pack status:
        - choose <context.status>:
            - case FAILED_DOWNLOAD:
                - narrate "<gold>[Tendral] <red>[System] - <reset>Resourcepack abgelehnt versuche es in 3 Sekunden erneut."
                - resourcepack url:https://download.mc-packs.net/pack/c3625c7049271640d9c9690ded696363de82eda9.zip hash:c3625c7049271640d9c9690ded696363de82eda9 forced
            - case ACCEPTED:
                - narrate "<gold>[Tendral] <red>[System] - <reset>Resourcepack angenommen."
            - case SUCCESSFULLY_LOADED:
                - narrate "<gold>[Tendral] <red>[System] - <reset>Resourcepack fertig geladen."
                - narrate "<gold>[Tendral] <red>[System] - <reset>Lade Spielerdaten"
                - wait 2s
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate "<gold>[Tendral] <red>[System] - <reset>Lade Spielerdaten."
                - wait 2s
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate "<gold>[Tendral] <red>[System] - <reset>Lade Spielerdaten..."
                - wait 2s
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate "<gold>[Tendral] <red>[System] - <reset>Lade Spielerdaten...."
                - wait 2s
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate "<gold>[Tendral] <red>[System] - <reset>Lade Spielerdaten....."
                - wait 2s
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate ""
                - narrate "<gold>[Tendral] <red>[System] - <reset>Spielerdaten geladen."
                - teleport <player> <location[Profil_Auswahl]>
                - cast darkness remove
                - if <player.has_permission[tendral.admin]>:
                    - inventory set o:Server_Selector slot:1
                - inventory set o:Characters slot:5
                - inventory set o:Changelogs slot:9
                - invisible player false
                - wait 2s
                - narrate <empty>
                - narrate <empty>
                - narrate <empty>
                - narrate "<&chr[Eff7].font[economy-icons]>"
                - narrate <empty>
                - narrate <empty>
                - narrate "<reset>------------<gold><bold>Tendral v0.0.1-A<reset>------------"
                - narrate "<reset>Willkommen <green><player.name>"
                - narrate "<reset>Freunde online: 0"
                - narrate "<reset>Changelog: Alpha 0.0.2"
                - narrate "<reset>- Login Server Anpassungen."
                - narrate "<reset>- Profilerstellung eingebaut."
                - narrate "<reset>- Anbindungen für das Freundesystem erstellt."
