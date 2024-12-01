

    # [Создание броненосца]
    
        # Motion
        scoreboard objectives add armagun.motion dummy

        # Сохранение Motion'а снежка в скорборд
        execute store result score *x armagun.motion run data get entity @s Motion[0] 200
        execute store result score *y armagun.motion run data get entity @s Motion[1] 120
        execute store result score *z armagun.motion run data get entity @s Motion[2] 200

        # Запись Motion и Rotation в хранилище
        execute store result storage armagun macro_input.Motion_x double 0.01 run scoreboard players get *x armagun.motion
        execute store result storage armagun macro_input.Motion_y double 0.01 run scoreboard players get *y armagun.motion
        execute store result storage armagun macro_input.Motion_z double 0.01 run scoreboard players get *z armagun.motion
        execute store result storage armagun macro_input.Rotation_y float 1 on origin run data get entity @s Rotation[0]

        # Создание броненосца с полученными значениями
        function armagun:entity/armafly/transform_untransformed/run__macro with storage armagun macro_input
        
        # Очистка
        data remove storage armagun macro_input
        scoreboard objectives remove armagun.motion
        kill @s

    # Аудио-визаульные эффекты
    playsound entity.breeze.wind_burst neutral @a ~ ~ ~ 1 2 0
    playsound entity.armadillo.roll neutral @a ~ ~ ~ 1 1 0
    particle poof ~ ~ ~ 0 0 0 0 3 normal @a
    particle gust ~ ~ ~ 0 0 0 0 1 normal @a
