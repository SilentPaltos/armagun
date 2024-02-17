
    loot replace entity @s[nbt={SelectedItem:{tag:{armagun:{id:"armagun"}}}}] weapon.mainhand loot armagun:item/armagun
    loot replace entity @s[nbt={Inventory:[{Slot:-106b,tag:{armagun:{id:"armagun"}}}]}] weapon.offhand loot armagun:item/armagun

    advancement revoke @s only armagun:trigger/shot_armagun

    playsound entity.armadillo.roll player @a ~ ~ ~ 3 1 0

    execute anchored eyes positioned ^ ^ ^0.5 run function summon:armagun/armaball
    execute anchored eyes positioned ^ ^ ^0.5 run damage @e[limit=1,sort=nearest,type=breeze_wind_charge] 1 player_attack by @s
