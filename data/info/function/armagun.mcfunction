
        tellraw @s [ \
            { \
                "translate": "pack.armagun.info", \
                "with": [ \
                    { \
                        "translate": "emoji.armagun.armadillo_scute_concept", \
                        "font": "armagun:emoji", \
                        "shadow_color": 0 \
                    }, \
                    { \
                        "translate": "pack.armagun.name", \
                        "color": "red", \
                        "hoverEvent": { \
                            "action": "show_text", \
                            "value": { "translate": "pack.armagun.description" } \
                        } \
                    }, \
                    { \
                        "translate": "pack.armagun.authors", \
                        "color": "yellow", \
                        "with": [ \
                            { \
                                "text": "SilentPaltos", \
                                "color": "green" \
                            }, \
                            { \
                                "text": "Fedea", \
                                "color": "green" \
                            } \
                        ] \
                    }, \
                    { \
                        "translate": "pack.armagun.version", \
                        "color": "yellow", \
                        "with": [ \
                            { \
                                "text": "Beta 1.4", \
                                "color": "green" \
                            } \
                        ] \
                    } \
                ] \
            }, \
            { \
                "text": "\n> [", \
                "color": "aqua" \
            }, \
            { \
                "translate": "pack.armagun.get_links", \
                "color": "aqua", \
                "clickEvent": { \
                    "action": "run_command", \
                    "value": "/function armagun:info/links" \
                } \
            }, \    
            { \
                "text": "]\n", \
                "color": "aqua" \
            } \
        ]