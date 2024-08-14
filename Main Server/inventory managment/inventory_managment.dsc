Profil_world:
    type: world
    events:
        on bungee player switches to server:
        - define server <context.server>
        - flag <player> <player.flag[current_profil]>.meta.inventory:<player.inventory.list_contents>
        - if <context.server> == login:
            - define profil_data <player.flag_map[<player.flag[current_profil]>]>
            - bungee login:
                - flag <player> current_profil:<player.flag[current_profil]>
                - flag <player> __raw:<[profil_data]>
        on player joins:
        - inventory clear
        - define profile <player.flag[current_profil]>
        - define slot 0
        - foreach <player.flag[<[profile]>.meta.inventory]>:
            - define slot:++
            - inventory set o:<[value]> slot:<[slot]>
        - inventory set o:menu_item slot:9