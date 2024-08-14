Tmotd-Data:
    type: data
    data:
    - Hallo das ist eine Test MOTD
    - Tendral Dev Server Version 0.0.1


Tmotd:
    type: world
    events:
        on server list ping:
        - determine MOTD:"<script[tmotd-data].data_key[data].separated_by[<&sp>]>"
