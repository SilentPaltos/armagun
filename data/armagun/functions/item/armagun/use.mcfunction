
    loot replace entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{armagun:{id:"armagun"}}}}}] weapon.mainhand loot armagun:item/armagun
    loot replace entity @s[nbt={Inventory:[{Slot:-106b,components:{"minecraft:custom_data":{armagun:{id:"armagun"}}}}]}] weapon.offhand loot armagun:item/armagun

    advancement revoke @s only armagun:trigger/shot_armagun

    playsound entity.armadillo.roll player @a ~ ~ ~ 3 1 0

    execute anchored eyes positioned ^ ^ ^0.5 run function summon:armagun/armaball
    execute anchored eyes positioned ^ ^ ^0.5 run damage @e[limit=1,sort=nearest,type=breeze_wind_charge] 1 player_attack by @s

    kill @e[type=arrow,nbt={item:{components:{"minecraft:custom_data":{armagun:"armagun_projectile_filler"}}}}]
    playsound entity.firework_rocket.blast player @a ~ ~ ~ 1 0 0
    stopsound @a[distance=..15] player item.crossbow.shoot