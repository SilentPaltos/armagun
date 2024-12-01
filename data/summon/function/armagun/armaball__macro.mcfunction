
    # macro_input
    #> $(dx)
    #> $(dy)
    #> $(dz)
    #> $(UUID)

    # Сама сущность
    $execute \
        anchored eyes \
    run \
        summon breeze_wind_charge ~ ~ ~ { \
            Passengers: [ \
                { \
                    id: "item_display", \
                    item: { \
                        id: "diamond", \
                        components: { \
                            "minecraft:item_model": "armagun:armaball", \
                            "minecraft:custom_data": { armagun: { Owner: $(UUID) } } \
                            } \
                    }, \
                    transformation: { \
                        left_rotation: [ 0f, 0f, 0f, 1f ], \
                        right_rotation: [ 0f, 0f, 0f, 1f ], \
                        scale: [ 1.15f, 1.15f, 1.15f ], \
                        translation: [ 0f, -0.3f, 0f ] \
                    }, \
                    Tags: [ \
                        "armagun.entity.armaball", \
                        "armagun.entity.select" \
                    ] \
                } \
            ], \
            Tags: [ "armagun.entity.armaball_base_entity" ], \
            Motion: [ $(dx)d, $(dy)d, $(dz)d ], \
            Owner: $(UUID) \
        }
    
    # Дополнительные данные
    data modify entity @n[ \
        type = item_display, \
        tag = armagun.entity.select \
    ] \
        Rotation[0] set from entity @s Rotation[0]
    
    tag @n[ \
        type = item_display, \
        tag = armagun.entity.select \
    ] \
        remove armagun.entity.select