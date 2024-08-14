Login_item_menu:
    type: world
    events:
        on player clicks Server_Selector in inventory slot:1:
        - determine passively cancelled
        - inventory open d:Server_Selector_Gui
        on player DROP clicks Server_Selector in inventory slot:1:
        - determine passively cancelled
        - inventory open d:Server_Selector_Gui
        on player SWAP_OFFHAND clicks Server_Selector in inventory slot:1:
        - determine passively cancelled
        - inventory open d:Server_Selector_Gui
        on player SHIFT_LEFT clicks Server_Selector in inventory slot:1:
        - determine passively cancelled
        - inventory open d:Server_Selector_Gui
        on player SHIFT_RIGHT clicks Server_Selector in inventory slot:1:
        - determine passively cancelled
        - inventory open d:Server_Selector_Gui
        on player drops Server_Selector:
        - determine passively cancelled
        - inventory open d:Server_Selector_Gui
        on player swaps items offhand:Server_Selector:
        - determine passively cancelled
        - inventory open d:Server_Selector_Gui
        on player right clicks block with:Server_Selector:
        - ratelimit <player> 1
        - determine passively cancelled
        - inventory open d:Server_Selector_Gui
        on player left clicks block with:Server_Selector:
        - ratelimit <player> 1
        - determine passively cancelled
        - inventory open d:Server_Selector_Gui
        ########################################################
        on player clicks Characters in inventory slot:1:
        - determine passively cancelled
        - inventory open d:Charakters
        on player DROP clicks Characters in inventory slot:1:
        - determine passively cancelled
        - inventory open d:Charakters
        on player SWAP_OFFHAND clicks Characters in inventory slot:1:
        - determine passively cancelled
        - inventory open d:Charakters
        on player SHIFT_LEFT clicks Characters in inventory slot:1:
        - determine passively cancelled
        - inventory open d:Charakters
        on player SHIFT_RIGHT clicks Characters in inventory slot:1:
        - determine passively cancelled
        - inventory open d:Charakters
        on player drops Characters:
        - determine passively cancelled
        - inventory open d:Charakters
        on player swaps items offhand:Characters:
        - determine passively cancelled
        - inventory open d:Charakters
        on player right clicks block with:Characters:
        - ratelimit <player> 1
        - determine passively cancelled
        - inventory open d:Charakters
        on player left clicks block with:Characters:
        - ratelimit <player> 1
        - determine passively cancelled
        - inventory open d:Charakters