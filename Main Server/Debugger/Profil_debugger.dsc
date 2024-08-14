Profil_debugger_data:
    type: data
    read:
        Meta:
            Name: <player.flag[<player.flag[current_profil]>.meta.name]>
            Inventory: <player.flag[<player.flag[current_profil]>.meta.inventory]>
            Profil_Slot: <player.flag[<player.flag[current_profil]>.meta.Profil_Slot]>
        Profil:
            Level: <player.flag[<player.flag[current_profil]>.Profil.Level]>
            Exp: <player.flag[<player.flag[current_profil]>.Profil.Exp]>
            Next_Level: <player.flag[<player.flag[current_profil]>.Profil.next_level]>
        Volk:
            Volk: <player.flag[<player.flag[current_profil]>.Volk]>
        Attributes:
            Health:
                Max: <player.flag[<player.flag[current_profil]>.Attributes.Health.max]>
                regeneration: <player.flag[<player.flag[current_profil]>.Attributes.Health.regeneration]>
            Mana:
                Current_Mana: <player.flag[<player.flag[current_profil]>.Attributes.Mana.current]>
                Max_Mana: <player.flag[<player.flag[current_profil]>.Attributes.Mana.Max]>
                Regeneration_Mana: <player.flag[<player.flag[current_profil]>.Attributes.Mana.regeneration]>
            Stamina:
                Current_Stamina: <player.flag[<player.flag[current_profil]>.Attributes.Stamina.current]>
                Max_Stamina: <player.flag[<player.flag[current_profil]>.Attributes.Stamina.max]>
                Regeneration_Stamina: <player.flag[<player.flag[current_profil]>.Attributes.Stamina.regeneration]>
            Damage:
                Damage: <player.flag[<player.flag[current_profil]>.Attributes.damage]>
            Defense:
                Defense: <player.flag[<player.flag[current_profil]>.Attributes.defense]>
            Speed:
                Speed: <player.flag[<player.flag[current_profil]>.Attributes.speed]>
            Magic:
                damage: <player.flag[<player.flag[current_profil]>.Attributes.magic.damage]>
                defense: <player.flag[<player.flag[current_profil]>.Attributes.magic.defense]>

Profil_debugger:
    type: command
    name: Profil_debugger
    description: Does something
    usage: /Profil_debugger
    permission: dscript.mycmd
    script:
    - narrate "<gold>META ###############"
    - foreach <script[profil_debugger_data].parsed_key[read.Meta]> as:index:
        - narrate "<gold><[key]>: <green><[index]>"
    - narrate "<gold>PROFIL ##############"
    - foreach <script[profil_debugger_data].parsed_key[read.Profil]> as:index:
        - narrate "<gold><[key]>: <green><[index]>"
    - narrate "<gold>VOLK ###############"
    - foreach <script[profil_debugger_data].parsed_key[read.Volk]> as:index:
        - narrate "<gold><[key]>: <green><[index]>"
    - narrate "<gold>ATTRIBUTES #############"
    - narrate "<gold>Health:"
    - foreach <script[profil_debugger_data].parsed_key[read.Attributes.Health]> as:index:
        - narrate "<gold><[key]>: <green><[index]>"
    - narrate "<gold>Mana:"
    - foreach <script[profil_debugger_data].parsed_key[read.Attributes.Mana]> as:index:
        - narrate "<gold><[key]>: <green><[index]>"
    - narrate "<gold>Stamina:"
    - foreach <script[profil_debugger_data].parsed_key[read.Attributes.Stamina]> as:index:
        - narrate "<gold><[key]>: <green><[index]>"
    - narrate "<gold>Damage:"
    - foreach <script[profil_debugger_data].parsed_key[read.Attributes.Damage]> as:index:
        - narrate "<gold><[key]>: <green><[index]>"
    - narrate "<gold>Defense:"
    - foreach <script[profil_debugger_data].parsed_key[read.Attributes.Defense]> as:index:
        - narrate "<gold><[key]>: <green><[index]>"
    - narrate "<gold>Speed:"
    - foreach <script[profil_debugger_data].parsed_key[read.Attributes.Speed]> as:index:
        - narrate "<gold><[key]>: <green><[index]>"
    - narrate "<gold>Magic:"
    - foreach <script[profil_debugger_data].parsed_key[read.Attributes.Magic]> as:index:
        - narrate "<gold><[key]>: <green><[index]>"