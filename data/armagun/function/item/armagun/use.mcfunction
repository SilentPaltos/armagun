    
    # Отзыв достижения
    advancement revoke @s only armagun:trigger/shot_armagun

    # Обновление инвентаря (слот с бронестрелом)
    execute \
        if items entity @s weapon.mainhand crossbow[ custom_data = { armagun: { id: "armagun" } } ] \
    run loot replace entity @s weapon.mainhand loot armagun:item/armagun
    
    execute \
        if items entity @s weapon.offhand crossbow[ custom_data = { armagun: { id: "armagun" } } ] \
    run loot replace entity @s weapon.offhand loot armagun:item/armagun

    # [Звуки]

        # Выстрел
        playsound entity.armadillo.roll player @a ~ ~ ~ 3 1 0
        playsound entity.firework_rocket.blast player @a ~ ~ ~ 1 0 0

        # Выключение звука арбалета
        stopsound @a[ distance = ..15 ] player item.crossbow.shoot

    # [Создание бронешара]

        # Motion
        scoreboard objectives add armagun.motion dummy

        # Запись первой точки в скорборд (х200) - начало вектора
        execute store result score *x armagun.motion run data get entity @s Pos[0] 200
        execute store result score *y armagun.motion run data get entity @s Pos[1] 200
        execute store result score *z armagun.motion run data get entity @s Pos[2] 200

        # Запись второй точки в скорборд (х200) - конец вектора
        summon marker ^ ^ ^1 { Tags: [ "armagun.marker" ] }
        execute store result score *dx armagun.motion run data get entity @n[ tag = armagun.marker ] Pos[0] 200
        execute store result score *dy armagun.motion run data get entity @n[ tag = armagun.marker ] Pos[1] 200
        execute store result score *dz armagun.motion run data get entity @n[ tag = armagun.marker ] Pos[2] 200

        # Разница координат точек = вектор
        scoreboard players operation *dx armagun.motion -= *x armagun.motion
        scoreboard players operation *dy armagun.motion -= *y armagun.motion
        scoreboard players operation *dz armagun.motion -= *z armagun.motion

        # Запись полученного вектора в хранилище (x0.01) ( Итоговая вектора = 2*sqrt(3) )
        execute store result storage armagun macro_input.dx double 0.01 run scoreboard players get *dx armagun.motion
        execute store result storage armagun macro_input.dy double 0.01 run scoreboard players get *dy armagun.motion
        execute store result storage armagun macro_input.dz double 0.01 run scoreboard players get *dz armagun.motion

        # Сохранение UUID стрелка
        data modify storage armagun macro_input.UUID set from entity @s UUID

        # Создание бронешара с полученными данными
        execute \
            anchored eyes \
            positioned ^ ^ ^0.5 \
        run function summon:armagun/armaball__macro with storage armagun macro_input

        # Очистка ( хранилище, скорборд, сущность )
        data remove storage armagun macro_input
        scoreboard objectives remove armagun.motion
        kill @n[ tag = armagun.marker ]

    # Уничтожение выпущенной из арбалета стрелы
    kill @e[ \
        type = arrow, \
        nbt = { item: { components: { "minecraft:custom_data": { armagun: "armagun_projectile_filler" } } } } \
    ]