
    # Обновление инвентаря (слот с бронестрелом)
    loot replace entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{armagun:{id:"armagun"}}}}}] weapon.mainhand loot armagun:item/armagun
    loot replace entity @s[nbt={Inventory:[{Slot:-106b,components:{"minecraft:custom_data":{armagun:{id:"armagun"}}}}]}] weapon.offhand loot armagun:item/armagun

    # Отзыв достижения
    advancement revoke @s only armagun:trigger/shot_armagun

    # Звуки
        # Выстрел
        playsound entity.armadillo.roll player @a ~ ~ ~ 3 1 0
        playsound entity.firework_rocket.blast player @a ~ ~ ~ 1 0 0

        # Выключение звука арбалета
        stopsound @a[distance=..15] player item.crossbow.shoot

    # Создание запущенного снаряда
    
            scoreboard objectives add armagun.motion dummy
            
            execute store result score *x armagun.motion run data get entity @s Pos[0] 200
            execute store result score *y armagun.motion run data get entity @s Pos[1] 200
            execute store result score *z armagun.motion run data get entity @s Pos[2] 200

            summon marker ^ ^ ^1 {Tags:["armagun.marker"]}
                execute store result score *dx armagun.motion run data get entity @n[tag=armagun.marker] Pos[0] 200
                execute store result score *dy armagun.motion run data get entity @n[tag=armagun.marker] Pos[1] 200
                execute store result score *dz armagun.motion run data get entity @n[tag=armagun.marker] Pos[2] 200

            scoreboard players operation *dx armagun.motion -= *x armagun.motion
            scoreboard players operation *dy armagun.motion -= *y armagun.motion
            scoreboard players operation *dz armagun.motion -= *z armagun.motion

            execute store result storage armagun Motion.dx double 0.01 run scoreboard players get *dx armagun.motion
            execute store result storage armagun Motion.dy double 0.01 run scoreboard players get *dy armagun.motion
            execute store result storage armagun Motion.dz double 0.01 run scoreboard players get *dz armagun.motion

        execute anchored eyes positioned ^ ^ ^0.5 run function summon:armagun/armaball__macro with storage armagun Motion

            data remove storage armagun Motion
            scoreboard objectives remove armagun.motion
            kill @n[tag=armagun.marker]

    # Убийство выпущенной из арбалета стрелы
    kill @e[type=arrow,nbt={item:{components:{"minecraft:custom_data":{armagun:"armagun_projectile_filler"}}}}]