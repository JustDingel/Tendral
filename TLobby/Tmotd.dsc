Tmotd_Data:
    type: data
    data:
    - Hallo das ist eine Test MOTD
    - Tendral Dev Server Version 0.0.1


Tmotd:
    type: world
    events:
        on proxy server list ping:
        - determine MOTD:<script[tmotd_data].data_key[data].separated_by[<&nl>]>
