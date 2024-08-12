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
    debug: true
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
    debug: true
    definitions: Player|EXP[Player EXP]|PLevel
    script:
    - define base_exp 200
    - define factor 1.19
    - define Level 1
    - while <[EXP]> >= <[base_exp]>:
        - define Level <[Level].add[1]>
        - define base_exp <[base_exp].mul[<[factor]>]>
        - if <[PLevel]> < <[Level]>:
            - narrate "Level Up Bitch" targets:<[Player]>
    - flag <[Player]> Level:<[Level]>