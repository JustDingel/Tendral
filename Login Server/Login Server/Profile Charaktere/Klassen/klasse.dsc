Klassen:
    type: inventory
    inventory: chest
    gui: true
    title: Klasse
    procedural items:
    - define result <list>
    - foreach <script[Klassen_Datenbank].parsed_key[Klassen]>:
        - choose <[value]>:
            - case Krieger:
                - define Klasse Krieger
                - define item iron_sword[display=<[Klasse]>;Lore=<script[klassen_datenbank].parsed_key[KlassenInfo].separated_by[<n>]>]
            - case Wächter:
                - define Klasse Wächter
                - define item shield[display=<[Klasse]>;Lore=<script[klassen_datenbank].parsed_key[KlassenInfo].separated_by[<n>]>]
            - case Dieb:
                - define Klasse Dieb
                - define item iron_hoe[display=<[Klasse]>;Lore=<script[klassen_datenbank].parsed_key[KlassenInfo].separated_by[<n>]>]
            - case Bogenschütze:
                - define Klasse Bogenschütze
                - define item bow[display=<[Klasse]>;Lore=<script[klassen_datenbank].parsed_key[KlassenInfo].separated_by[<n>]>]
        - define result <[result].include[<[item]>]>
    - determine <[result]>
    slots:
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]
    - [air] [] [] [] [] [] [] [] [air]
    - [air] [] [] [] [] [] [] [] [air]
    - [air] [] [] [] [] [] [] [] [air]
    - [air] [] [] [] [] [] [] [] [air]
    - [air] [air] [air] [air] [air] [air] [air] [air] [air]

Klassen_inventory:
    type: world
    events:
        on player left clicks in Klassen slot:11|12|13|14|15|17|20|21|22|23|24|26|29|30|31|32|33|35|38|39|40|41|42|44:
        - determine passively cancelled
        - choose <context.slot>:
            - case 11:
                - flag <player> Profil_creation.Klasse:<script[Klassen_datenbank].parsed_key[Krieger]>
                - narrate <player.flag[Profil_creation.Klasse]>
                - flag <player> <player.flag[Profil_creation.Profil]>:<script[Character_Data].parsed_key[Charakter]>
                - flag <player> profil_creation:!
                - inventory close
                - wait 1s
                - inventory open d:Charakters