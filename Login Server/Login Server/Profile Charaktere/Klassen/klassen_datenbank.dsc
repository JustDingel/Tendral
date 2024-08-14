Klassen_Datenbank:
    type: data
    KlassenInfo:
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Role]>"
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Equip]>"
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Attributes.health.max]>"
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Attributes.health.regeneration]>"
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Attributes.mana.max]>"
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Attributes.mana.regeneration]>"
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Attributes.stamina.max]>"
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Attributes.stamina.regeneration]>"
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Attributes.damage]>"
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Attributes.defense]>"
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Attributes.speed]>%"
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Attributes.Magic.damage]>"
    - "<script[klassen_datenbank].parsed_key[<[klasse]>.Attributes.Magic.defense]>"
    - "<green>[ < auswählen]"

    Klassen:
    - Krieger
    - Wächter
    - Dieb
    - Bogenschütze

    Krieger:
        Klasse: Krieger
        Role: Schaden/Tank
        Equip: Mittel/Schwer
        Attributes:
            health:
                max: 10
                regeneration: 2
            mana:
                max: 0
                regeneration: 0
            stamina:
                max: 10
                regeneration: 2
            damage: 10
            defense: 5
            speed: 0
            Magic:
                damage: 0
                defense: 0
    Wächter:
        Role: Tank
        Equip: Schwer
        Attributes:
            health:
                max: 10
                regeneration: 2
            mana:
                max: 0
                regeneration: 0
            stamina:
                max: 10
                regeneration: 2
            damage: 10
            defense: 10
            speed: 0
            Magic:
                damage: 0
                defense: 10
    Dieb:
        Role: Schaden
        Equip: Leicht
        Attributes:
            health:
                max: 10
                regeneration: 2
            mana:
                max: 0
                regeneration: 0
            stamina:
                max: 10
                regeneration: 2
            damage: 10
            defense: 10
            speed: 0
            Magic:
                damage: 0
                defense: 10
    Bogenschütze:
        Role: Schaden
        Equip: Leicht
        Attributes:
            health:
                max: 10
                regeneration: 2
            mana:
                max: 0
                regeneration: 0
            stamina:
                max: 10
                regeneration: 2
            damage: 10
            defense: 10
            speed: 0
            Magic:
                damage: 0
                defense: 10