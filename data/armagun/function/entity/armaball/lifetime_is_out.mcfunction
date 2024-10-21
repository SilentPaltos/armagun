
    # Уничтожение базовой сущности
    execute \
        on vehicle \
    run kill @s
    
    # Столкновение
    function armagun:entity/armaball/collide with entity @s item.components."minecraft:custom_data".armagun