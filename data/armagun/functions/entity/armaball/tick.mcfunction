
    scoreboard players add @s armagun.entity.lifetime 1
    execute if score @s armagun.entity.lifetime matches 600 positioned as @s run function armagun:entity/armaball/lifetime_is_out
    execute if predicate armagun:entity/armaball/collided positioned as @s run function armagun:entity/armaball/collide