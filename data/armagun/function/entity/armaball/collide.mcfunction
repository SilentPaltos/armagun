
    # macro_input
    #> $(Owner)

    # Аудивовизуальные эффекты
    playsound entity.turtle.egg_break neutral @a ~ ~ ~ 10 1 0
    playsound entity.generic.explode neutral @a ~ ~ ~ 10 2 0
    particle item{ item: { id: "armadillo_scute" } } ~ ~ ~ 0.5 0.5 0.5 0.5 200 normal @a

    # Тег для быстрого поиска сущности
    tag @s add armagun.entity.select

    # Нанесение урона всем вблизи
    execute \
        as @e[ distance = ..4.5 ] \
    run damage @s 5 arrow by @n[ type = item_display, tag = armagun.entity.select ]

    # Выдача данных об источнике урона
    $execute \
        as @e[ distance = ..4.5 ] \
    run data modify entity @s AngryAt set value $(Owner)

    # Самоуничтожение
    kill @s