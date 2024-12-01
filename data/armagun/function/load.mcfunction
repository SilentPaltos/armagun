
    # Время жизни бронешара (снаряд бронестрела)
    scoreboard objectives add armagun.entity.lifetime dummy

    execute \
        if items entity @s weapon.offhand totem_of_undying[custom_data={"regeneration":1}] \
    run effect give @s regeneration 10 2