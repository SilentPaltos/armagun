
    # Накопление времени жизни
    scoreboard players add @s armagun.entity.lifetime 1

    # Если время жизни истекло
    execute \
        if score @s armagun.entity.lifetime matches 600 \
        positioned as @s \
    run function armagun:entity/armaball/lifetime_is_out
    
    # При столкновении
    execute \
        if predicate armagun:entity/armaball/collided \
        positioned as @s \
    run function armagun:entity/armaball/collide with entity @s item.components."minecraft:custom_data".armagun