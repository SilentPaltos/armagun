
    # Обновление снарядов бронестрела
    execute as @e[predicate=armagun:entity/armaball] run function armagun:entity/armaball/tick

    # Обновление снарядов-бронелётов
    function armagun:entity/armafly/tick