Rassen:
    type: inventory
    inventory: chest
    gui: true
    title: Volk
    procedural items:
    - define result <list>
    - foreach <script[Volk_Datenbank].parsed_key[Rassen]>:
        - choose <[value]>:
            - case Mensch:
                - define skin 97c240ba-5dba-42c3-8965-cfcf5e56485d
                - define rasse Mensch
                - define item player_head[display=<[rasse]>;Lore=<script[volk_datenbank].parsed_key[RassenInfo].separated_by[<n>]>;skull_skin=<[skin]>]
            - case Elf:
                - define skin eca3974e-7fcf-46d6-a742-ba6f22565e57
                - define rasse Elf
                - define item player_head[display=<[rasse]>;Lore=<script[volk_datenbank].parsed_key[RassenInfo].separated_by[<n>]>;skull_skin=<[skin]>]
            - case Zwerg:
                - define skin 59320169-4b84-4a31-b2d0-eb4640866ebc
                - define rasse Zwerg
                - define item player_head[display=<[rasse]>;Lore=<script[volk_datenbank].parsed_key[RassenInfo].separated_by[<n>]>;skull_skin=<[skin]>]
            - case NA:
                - define item green_stained_glass_pane
        - define result <[result].include[<[item]>]>
    - determine <[result]>
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [] [] [] [] [] [] [] [air]
    - [air] [] [] [] [] [] [] [] [air]
    - [air] [] [] [] [] [] [] [] [air]
    - [air] [] [] [] [] [] [] [] [air]
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]

Volk_inventory:
    type: world
    events:
        on player left clicks in Rassen slot:11|12|13|14|15|17|20|21|22|23|24|26|29|30|31|32|33|35|38|39|40|41|42|44:
        - determine passively cancelled
        - choose <context.slot>:
            - case 11:
                - flag <player> Profil_creation.Volk:<script[Volk_datenbank].parsed_key[Mensch]>
                - narrate <player.flag[Profil_creation.Volk]>
                - inventory open d:Klassen