NPC_Item_Profil:
    type: item
    material: stick
    display name: NPC_Item

NPC_Spawn_Profil:
    type: world
    events:
        #on delta time minutely every:1:
        #- run profil_auswahl_npc_task
        on player joins:
        - if !<player.has_flag[profil_1_armorstands]>:
            - repeat 5:
                - spawn profil_armorstand <player.location.above[300]> save:nameplate
                - if <[value]> <= 5:
                    - flag <player> Profil_1_armorstands:->:<entry[nameplate].spawned_entity>
                    - adjust <entry[nameplate].spawned_entity> custom_name:Test<[Value]>
                    - adjust <entry[nameplate].spawned_entity> custom_name_visible:true
        on player right clicks cobblestone with:NPC_Item_Profil:
        - if <server.has_flag[Profil_npc_slot]>:
            - flag server Profil_npc_slot:++
            - spawn profile_entity <context.location>
            - narrate <server.flag[profil_npc_slot]>

profil_armorstand:
    type: entity
    entity_type: armor_stand
    debug: false
    mechanisms:
        arms: false
        base_plate: false
        invulnerable: true
        is_small: true
        visible: false
        gravity: false

Profil_auswahl_NPC:
    type: assignment
    speed: 0
    # | All assignment scripts MUST have this key!
    actions:
        on assignment:
        - define npc <npc>
        - trigger name:click state:true
        - flag server profil_npc_anzahl:++
        - flag server Npc_Profil_<server.flag[profil_npc_anzahl]>:<[npc]>
        - adjust <[npc]> glow_color:dark_green
        - adjust <[npc]> name_visible:false
        - spawn profil_armorstand <[npc].location.above[1]> save:nameplate
        #- attach <entry[nameplate].spawned_entity> to:<[npc]> sync_server
        - adjust <entry[nameplate].spawned_entity> custom_name:Profil<&sp>1
        - adjust <entry[nameplate].spawned_entity> custom_name_visible:true
    interact scripts:
    - Profil_auswahl_interaction

Profil_auswahl_interaction:
    type: interact
    speed: 0
    # | All interact scripts MUST have this key!
    steps:
        default:
            click trigger:
                script:
                    - define npc <npc>
                    - if <[npc].has_flag[state]>:
                        #- adjust <[npc]> glow_color:white
                        - glow <[npc]> false for:<player>
                        - flag <[npc]> state:!
                    - else:
                        - flag <[npc]> state
                        #- adjust <[npc]> glow_color:dark_green
                        - fakeinternaldata entity:<[npc]> data:[glow_color=<color[dark_green]>] for:<player>
                        - glow <[npc]> toggle for:<player>
                    - narrate "<[npc].name>"

Profil_auswahl_NPC_Task:
    type: task
    script:
    - foreach <server.online_players> as:player:
        - repeat 5:
            - if <[player].has_flag[profil_1]>:
                - foreach <[player].flag[profil_1_armorstands]>:
                    - choose <[loop_index]>:
                        - case 1:
                            - adjust <[value]> custom_name:<[player].flag[Profil_1.meta.name]>
                            - attach <[value]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,2,0
                        - case 2:
                            - adjust <[value]> custom_name:<[player].flag[Profil_1.Volk]>
                            - attach <[value]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,1.75,0
                        - case 3:
                            - adjust <[value]> custom_name:<[player].flag[Profil_1.Class.current_class]>
                            - attach <[value]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,1.50,0
                        - case 4:
                            - adjust <[value]> custom_name:<[player].flag[Profil_1.Profil.level]>
                            - attach <[value]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,1.25,0
                        - case 5:
                            - attach <[value]> cancel
            - if !<[player].has_flag[profil_1]>:
                - foreach <[player].flag[profil_1_armorstands]>:
                    - if <[loop_index]> == 5:
                        - define armorstand5 <[player].flag[profil_1_armorstands].get[5]>
                        - adjust <[armorstand5]> custom_name:Freies<&sp>Profil
                        - attach <[armorstand5]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,1.25,0 sync_server
                    - else:
                        - attach <[value]> cancel

Profil_auswahl_NPC_Task2:
    type: task
    definitions: player|profil
    script:
        - if <[player].has_flag[<[profil]>]>:
            - adjust <[player].flag[profil_1_armorstands].get[1]> custom_name:<[player].flag[Profil_1.meta.name]>
            - attach <[player].flag[profil_1_armorstands].get[1]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,2,0 sync_server

            - adjust <[player].flag[profil_1_armorstands].get[2]> custom_name:<[player].flag[Profil_1.Volk]>
            - attach <[player].flag[profil_1_armorstands].get[2]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,1.75,0 sync_server

            - adjust <[player].flag[profil_1_armorstands].get[3]> custom_name:<[player].flag[Profil_1.Class.current_class]>
            - attach <[player].flag[profil_1_armorstands].get[3]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,1.50,0 sync_server

            - adjust <[player].flag[profil_1_armorstands].get[4]> custom_name:<[player].flag[Profil_1.Profil.level]>
            - attach <[player].flag[profil_1_armorstands].get[4]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,1.25,0 sync_server

            - attach <[player].flag[profil_1_armorstands].get[5]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,300,0 sync_server
        - else:
            - attach <[player].flag[profil_1_armorstands].get[1]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,300,0 sync_server

            - attach <[player].flag[profil_1_armorstands].get[2]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,300,0 sync_server

            - attach <[player].flag[profil_1_armorstands].get[3]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,300,0 sync_server

            - attach <[player].flag[profil_1_armorstands].get[4]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,300,0 sync_server

            - adjust <[player].flag[profil_1_armorstands].get[5]> custom_name:Freies<&sp>Profil
            - attach <[player].flag[profil_1_armorstands].get[5]> to:<npc[<server.flag[npc_profil_1]>]> for:<[player]> offset:0,1.25,0