EXP_TEST:
    type: command
    name: Exp
    description: Does something
    usage: /Exp <&lt>myArg1<&gt>
    permission: dscript.mycmd
    script:
    - flag <player> EXP:<context.args.get[1]>

EXP_Anzeige:
    type: world
    debug: false
    events:
        after delta time secondly every:1:
        - if !<server.online_players.is_empty>:
            - actionbar "<player.flag[EXP].proc[my_proc]> <player.flag[level]> <player.flag[EXP]>" targets:<server.online_players> per_player
            - foreach <server.online_players>:
                - run my_task def:<[value]>|<[value].flag[EXP]>|<[value].flag[Level]>
        on player joins:
        - flag <player> EXP:0
        - flag <player> Level:1

my_proc:
    type: procedure
    debug: false
    data:
        base_exp: 200
        factor: 1.19
    definitions: EXP
    script:
    - define base_exp 200
    - define factor 1.19
    - define Level 1
    - while <[EXP]> >= <[base_exp]>:
        - define Level <[Level].add[1]>
        - define base_exp <[base_exp].mul[<[factor]>]>
    - determine <[level]>

my_task:
    type: task
    debug: false
    definitions: Player|EXP[Player EXP]|PLevel
    script:
    - define base_exp 200
    - define factor 1.19
    - define Level 1
    - while <[EXP]> >= <[base_exp]>:
        - define Level <[Level].add[1]>
        - define base_exp <[base_exp].mul[<[factor]>]>
        - if <[PLevel]> < <[Level]>:
            - if <[Level]> >= 50:
                - define Level 50
                - while stop
            - narrate "Level Up Bitch" targets:<[Player]>
    - flag <[Player]> Level:<[Level]>

#narrate "<element[15000].ln.mul[2.71].round_down>"

my_proc2:
    type: procedure
    debug: false
    definitions: EXP
    script:
    - determine <element[<[EXP]>].div[250].add[1].sqrt.round_down>