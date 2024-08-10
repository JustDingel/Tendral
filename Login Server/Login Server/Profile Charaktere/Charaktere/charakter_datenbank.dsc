Character_Data:
    type: data
    Charakterliste:
    - Free
    - Free
    - Free
    - Free
    - Free

    - Settings

    - Free
    - Free
    - Free
    - Free
    - Free

    - Event

    - Paid
    - Paid
    - Paid
    - Paid
    - Paid

    - Discord

    - Paid
    - Paid
    - Paid
    - Paid
    - Paid

    - Website
    PlayerHeads:
        Mensch: 97c240ba-5dba-42c3-8965-cfcf5e56485d
        Elf: eca3974e-7fcf-46d6-a742-ba6f22565e57
        Zwerg: 59320169-4b84-4a31-b2d0-eb4640866ebc

    CharakterInfo:
    - "<gold><bold>۞<gold> >> Charakter Info << <bold>۞"
    - "<gold><bold>۞<gold> >> Name:       <green><player.flag[<[Profil]>.meta.name]>"
    - "<gold><bold>۞<gold> >> Volk:        <green><player.flag[<[Profil]>.Volk]>"
    - "<gold><bold>۞<gold> >> Level:      <green><player.flag[<[Profil]>.Profil.level]>"
    - "<gold><bold>۞<gold> >> Klasse:     <green><player.flag[<[Profil]>.Class.current_class]>"
    - <empty>
    - <empty>
    - "<green>[ < auswählen] <red>[löschen > ]"
    - "erstellt vor <player.flag[<[Profil]>.meta.creation_time].to_zone[+1].from_now.formatted>"

    Wiederherrstellen:
    - "<gold><bold>۞<gold> Lässt dich deinen letzten Charakter wiederherstellen."
    - <empty>
    - "<gold><bold>۞<gold> <player.flag[deleted_profilslot].if_null[<gold>-<empty>]>"
    - "<gold><bold>۞<gold> <player.flag[last_deleted.Race].if_null[<gold>-<empty>]>"
    - "<gold><bold>۞<gold> <player.flag[last_deleted.Level].if_null[<gold>-<empty>]>"
    - "<gold><bold>۞<gold> <player.flag[last_deleted.Difficulty].if_null[<gold>-<empty>]>"
    - "<gold><bold>۞<gold> <green> Klicken zum wiederherstellen"

    Charakter:
        meta:
            name: <player.flag[Profil_creation.Name]>
            creation_time: <time[<util.time_now.to_zone[+1]>]>
            Profil_Slot: <player.flag[Profil_creation.Profil]>
            Inventory: []
        Profil:
            level: 1
            exp: 0
            next_level: 100
            total: 0
        Economy:
            money: 0
            bank: 0
        Equip:
            health:
                max: 10
                regeneration: 2
            mana:
                current: 10
                max: 10
                regeneration: 2
            stamina:
                current: 10
                max: 10
                regeneration: 2
            damage: 10
            defense: 5
            speed: 100
            Magic:
                damage: 10
                defense: 5
        Volk: <player.flag[profil_creation.Volk.Volk]>
        Attributes:
            health:
                max: <player.flag[profil_creation.Volk.Attributes.health.max]>
                regeneration: <player.flag[profil_creation.Volk.Attributes.health.regeneration]>
            mana:
                current: <player.flag[profil_creation.Volk.Attributes.mana.current]>
                max: <player.flag[profil_creation.Volk.Attributes.mana.max]>
                regeneration: <player.flag[profil_creation.Volk.Attributes.mana.regeneration]>
            stamina:
                current: <player.flag[profil_creation.Volk.Attributes.stamina.current]>
                max: <player.flag[profil_creation.Volk.Attributes.stamina.max]>
                regeneration: <player.flag[profil_creation.Volk.Attributes.stamina.regeneration]>
            damage: <player.flag[profil_creation.Volk.Attributes.damage]>
            defense: <player.flag[profil_creation.Volk.Attributes.defense]>
            speed: <player.flag[profil_creation.Volk.Attributes.speed]>
            Magic:
                damage: <player.flag[profil_creation.Volk.Attributes.Magic.damage]>
                defense: <player.flag[profil_creation.Volk.Attributes.Magic.defense]>
        Class:
            current_class: <player.flag[profil_creation.Klasse.Klasse]>
            available_class: <player.flag[profil_creation.Klasse.Klasse]>
            Klassen_slot: 1
            1:
                Klassen_Name: <player.flag[profil_creation.Klasse.Klasse]>
                Klassen_Rolle: <player.flag[profil_creation.Klasse.Role]>
                Klassen_Equip: <player.flag[profil_creation.Klasse.Equip]>
                level: 1
                exp: 0
                next_level: 100
                total: 0
                Attributes:
                    health:
                        max: <player.flag[profil_creation.Klasse.Attributes.health.max]>
                        regeneration: <player.flag[profil_creation.Klasse.Attributes.health.regeneration]>
                    mana:
                        max: <player.flag[profil_creation.Klasse.Attributes.mana.max]>
                        regeneration: <player.flag[profil_creation.Klasse.Attributes.mana.regeneration]>
                    stamina:
                        max: <player.flag[profil_creation.Klasse.Attributes.stamina.max]>
                        regeneration: <player.flag[profil_creation.Klasse.Attributes.stamina.regeneration]>
                    damage: <player.flag[profil_creation.Klasse.Attributes.damage]>
                    defense: <player.flag[profil_creation.Klasse.Attributes.defense]>
                    speed: <player.flag[profil_creation.Klasse.Attributes.speed]>
                    Magic:
                        damage: <player.flag[profil_creation.Klasse.Attributes.Magic.damage]>
                        defense: <player.flag[profil_creation.Klasse.Attributes.Magic.defense]>
        Skills:
            Combat:
                Level: 0
                Exp: 0
                Target: 100
                Prozent: 0
                MaxDrop: 1
            Mining:
                Level: 0
                Exp: 0
                Target: 100
                MaxDrop: 1
            Foraging:
                Level: 0
                Exp: 0
                Target: 100
                Dropchance: 1
                MaxDropchance: 50
                MaxDrop: 1
            Farming:
                Level: 0
                Exp: 0
                Target: 100
                MaxDrop: 1
            Fishing:
                Level: 0
                Exp: 0
                Target: 100
                MaxDrop: 1
        Professions:
            Blacksmith:
                Level: 0
                Exp: 0
                Target: 100
                MaxDrop: 1
            Weaponsmith:
                Level: 0
                Exp: 0
                Target: 100
                MaxDrop: 1
            Armorer:
                Level: 0
                Exp: 0
                Target: 100
                MaxDrop: 1
            Cook:
                Level: 0
                Exp: 0
                Target: 100
                MaxDrop: 1
        Quests:
            active: []
            completed: []
        Factions:
            reputation: []
            standing: neutral
        