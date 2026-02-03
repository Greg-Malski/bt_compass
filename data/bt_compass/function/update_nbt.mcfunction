# SETUP CONTAINER
setblock ~ 319 ~ minecraft:barrel

# MOVE ITEM
item replace block ~ 319 ~ container.0 from entity @s weapon.mainhand

# SET COORDINATES
$data modify block ~ 319 ~ Items[0].components."minecraft:lodestone_tracker" set value {target:{pos:[$(target_x),0,$(target_z)],dimension:"minecraft:overworld"},tracked:0b}

# LOCK THE COMPASS
data modify block ~ 319 ~ Items[0].components."minecraft:custom_data".bt_state set value "locked"

# RETURN ITEM
item replace entity @s weapon.mainhand from block ~ 319 ~ container.0

# CLEAN UP
setblock ~ 319 ~ minecraft:air

# SOUND EFFECT
playsound minecraft:ui.cartography_table.take_result player @s ~ ~ ~ 1 1