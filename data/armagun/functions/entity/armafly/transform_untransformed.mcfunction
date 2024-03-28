

    scoreboard objectives add temp dummy

    execute store result score motion_x temp run data get entity @s Motion[0] 200
    execute store result score motion_y temp run data get entity @s Motion[1] 120
    execute store result score motion_z temp run data get entity @s Motion[2] 200

    execute store result storage temp motion_x double 0.01 run scoreboard players get motion_x temp
    execute store result storage temp motion_y double 0.01 run scoreboard players get motion_y temp
    execute store result storage temp motion_z double 0.01 run scoreboard players get motion_z temp
    execute store result storage temp rotation_y float 1 on origin run data get entity @s Rotation[0]

    function armagun:entity/armafly/transform_untransformed/run__macro with storage temp

    
    particle poof ~ ~ ~ 0 0 0 0 3 normal @a
    particle gust ~ ~ ~ 0 0 0 0 1 normal @a
    playsound entity.breeze.wind_burst neutral @a ~ ~ ~ 1 2 0
    playsound entity.armadillo.roll neutral @a ~ ~ ~ 1 1 0

    data remove storage temp motion_x
    data remove storage temp motion_y
    data remove storage temp motion_z
    data remove storage temp rotation_y
    scoreboard objectives remove temp
    kill @s