Editor:
    type: command
    name: Editor
    description: Setzt dich in den Baumodus
    usage: /Editor
    permission: tendral.editor
    script:
    - if <player.has_flag[map.editor]>:
        - flag <player> map.editor:!
        - if <player.has_permission[tendral.admin]>:
            - inventory set o:Server_Selector slot:1
        - inventory set o:Characters slot:5
        - inventory set o:Changelogs slot:9
        - narrate "Baumodus deaktiviert"
    - else:
        - flag <player> map.editor
        - narrate "Baumodus aktiviert"
        - inventory clear