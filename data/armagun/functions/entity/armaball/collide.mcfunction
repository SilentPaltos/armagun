
    particle item armadillo_scute ~ ~ ~ 0.5 0.5 0.5 0.5 200 normal @a
    playsound entity.turtle.egg_break neutral @a ~ ~ ~ 10 1 0
    playsound entity.generic.explode neutral @a ~ ~ ~ 10 2 0

    tag @s add armagun.entity.select

    execute as @e[distance=..4.5] run damage @s 5 arrow by @e[tag=armagun.entity.select,limit=1,sort=nearest]

    kill @s