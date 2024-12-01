
    tellraw @s [ \
        { \
            "translate": "pack.armagun.links", \
            "with": [ \
                { \
                    "translate": "pack.armagun.link_modrinth", \
                    "color": "green", \
                    "clickEvent": { \
                        "action": "open_url", \
                        "value": "https://modrinth.com/project/armagun" \
                    } \
                }, \
                { \
                    "translate": "pack.armagun.link_planetminecraft", \
                    "color": "aqua", \
                    "clickEvent": { \
                        "action": "open_url", \
                        "value": "https://www.planetminecraft.com/data-pack/armagun/" \
                    } \
                }, \
                { \
                    "translate": "pack.armagun.link_github", \
                    "color": "gray", \
                    "clickEvent": { \
                        "action": "open_url", \
                        "value": "https://github.com/SilentPaltos/armagun" \
                    } \
                } \
            ] \
        } \
    ]