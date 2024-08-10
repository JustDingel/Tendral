Charakters:
    type: inventory
    inventory: chest
    gui: true
    title: Charaktere
    procedural items:
    - define result <list>
    - define anzahl 0
    - foreach <script[Character_Data].parsed_key[Charakterliste]>:
        - choose <[value]>:
            - case Free:
                - define anzahl:++
                - if <player.has_flag[Profil_<[anzahl]>]>:
                    - define Profil Profil_<[anzahl]>
                    - define item player_head[display=<green><bold>Profil<&sp><[anzahl]>;Lore=<script[Character_Data].parsed_key[CharakterInfo].separated_by[<n>]>;skull_skin=<script[Character_Data].parsed_key[PlayerHeads.<player.flag[<[Profil]>.Volk]>]>]
                - else:
                    - define item lime_stained_glass_pane[display=<green><bold>Profil<&sp><[anzahl]>]
            - case Paid:
                - define anzahl:++
                - if <player.has_permission[tendral.paid]>:
                    - define Profil Profil_<[anzahl]>
                    - if <player.has_flag[Profil_<[anzahl]>]>:
                        - define item player_head[display=<green><bold>Profil<&sp><[anzahl]>;Lore=<script[Character_Data].parsed_key[CharakterInfo].separated_by[<n>]>;skull_skin=<script[Character_Data].parsed_key[PlayerHeads.<player.flag[<[Profil]>.Volk]>]>]
                    - else:
                        - define item lime_stained_glass_pane[display=<green><bold>Profil<&sp><[anzahl]>]
                - else:
                    - define item red_stained_glass_pane[display=<red><bold>Profil<&sp><[anzahl]>]
            - case Settings:
                - define item yellow_stained_glass_pane[display=<yellow><bold>Charakter<&sp>Wiederherstellung;lore=<script[Character_Data].parsed_key[wiederherrstellen].separated_by[<n>]>]
            - case Event:
                - define item magenta_stained_glass_pane[display=<blue><bold>Events]
            - case Discord:
                - define item magenta_stained_glass_pane[display=<light_purple><bold>Discord]
            - case Website:
                - define item magenta_stained_glass_pane[display=<gold><bold>www.Tendralcraft.de]
        - define result <[result].include[<[item]>]>
    - determine <[result]>
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [] [] [] [] [] [air] [] [air]
    - [air] [] [] [] [] [] [air] [] [air]
    - [air] [] [] [] [] [] [air] [] [air]
    - [air] [] [] [] [] [] [air] [] [air]
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]

Charakters_inventory:
    type: world
    events:
        on player left clicks in Charakters slot:11|12|13|14|15|20|21|22|23|24|29|30|31|32|33|38|39|40|41|42:
        - narrate <context.slot>
        - determine passively cancelled
        - choose <context.slot>:
            ############ Erste reihe
            - case 11:
                - define profil Profil_1
                - flag <player> current_profil:Profil_1
            - case 12:
                - define profil Profil_2
                - flag <player> current_profil:Profil_2
            - case 13:
                - define profil Profil_3
            - case 14:
                - define profil Profil_4
            - case 15:
                - define profil Profil_5
            ############ Zweite reihe
            - case 20:
                - define profil Profil_6
            - case 21:
                - define profil Profil_7
            - case 22:
                - define profil Profil_8
            - case 23:
                - define profil Profil_9
            - case 24:
                - define profil Profil_10
            ############ Dritte reihe
            - case 29:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_11
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 30:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_12
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 31:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_13
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 32:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_14
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 33:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_15
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            ############ Vierte reihe
            - case 38:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_16
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 39:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_17
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 40:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_18
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 41:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_19
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 42:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_20
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
        - if <player.has_flag[<[profil]>]>:
            - narrate <player.flag[<[profil]>]>
            - flag <player> current_profil:<[profil]>
            - adjust <player> send_to:main
            - define profil_data <player.flag_map[<player.flag[current_profil]>]>
            - define current_profil <player.flag[current_profil]>
            - define inventory <player.flag[<player.flag[current_profil]>.meta.inventory]>
            - bungee main:
                - flag <player> current_profil:<[current_profil]>
                - flag <player> __raw:<[profil_data]>
                - inventory clear d:<player.inventory>
                - define slot 0
                - foreach <[inventory]>:
                    - define slot:++
                    - inventory set o:<[value]> slot:<[slot]>
        - else:
            - flag <player> profil_creation.Profil:<[profil]>
            - flag <player> profil_creation.Name
            - narrate "Gib deinen Spielernamen ein."
            - inventory close
        on player right clicks in Charakters slot:11|12|13|14|15|20|21|22|23|24|29|30|31|32|33|38|39|40|41|42:
        - determine passively cancelled
        - choose <context.slot>:
            ############ Erste reihe
            - case 11:
                - define profil Profil_1
            - case 12:
                - define profil Profil_2
            - case 13:
                - define profil Profil_3
            - case 14:
                - define profil Profil_4
            - case 15:
                - define profil Profil_5
            ############ Zweite reihe
            - case 20:
                - define profil Profil_6
            - case 21:
                - define profil Profil_7
            - case 22:
                - define profil Profil_8
            - case 23:
                - define profil Profil_9
            - case 24:
                - define profil Profil_10
            ############ Dritte reihe
            - case 29:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_11
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 30:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_12
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 31:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_13
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 32:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_14
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 33:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_15
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            ############ Vierte reihe
            - case 38:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_16
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 39:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_17
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 40:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_18
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 41:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_19
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
            - case 42:
                - if <player.has_permission[tendral.paid]>:
                    - define profil Profil_20
                - else:
                    - narrate "Wähle ein anderes Profil aus."
                    - determine cancelled
        - if <player.has_flag[<[profil]>]>:
            - flag server profile_names:<-:<player.flag[<[profil]>.meta.name]>
            - flag <player> <[profil]>:!
            - inventory open d:Charakters
        - else:
            - narrate "Dieses Profil kannst du nicht löschen!"



            #- case 11:
             #   - determine passively cancelled
             #   - if <player.has_flag[Profil_1]>:
              #      - narrate <player.flag[Profil_1]>
               # - else:
                #    - flag <player> Profil_creation.Profil:profil_1
                 #   - flag <player> profil_creation.Name
                  #  - narrate "Gib deinen Spielername im Chat ein."
                   # - inventory close
            #- case 12:
            #    - determine passively cancelled
            #    - if <player.has_flag[Profil_2]>:
            #        - narrate <player.flag[Profil_2]>
            #    - else:
            #        - flag <player> Profil_creation.Profil:profil_2
            #        - inventory open d:Rassen

#- if <player.has_flag[Profil_1]>:
#                    - flag server profile_names:<-:<player.flag[profil_1.meta.name]>
#                    - flag <player> profil_1:!
#                    - inventory open d:Charakters
#                - else:
#                    - narrate "Dieses Profil kannst du nicht löschen!"