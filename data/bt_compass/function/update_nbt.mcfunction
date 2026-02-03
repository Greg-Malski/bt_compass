# 1. SETUP CONTAINER
setblock ~ 319 ~ minecraft:barrel

# 2. MOVE ITEM
item replace block ~ 319 ~ container.0 from entity @s weapon.mainhand

# 3. SET COORDINATES (The Macro)
$data modify block ~ 319 ~ Items[0].components."minecraft:lodestone_tracker" set value {target:{pos:[$(target_x),0,$(target_z)],dimension:"minecraft:overworld"},tracked:0b}

# 4. LOCK THE COMPASS (The Fix)
# We change the state to 'locked' so the tick loop stops finding it.
data modify block ~ 319 ~ Items[0].components."minecraft:custom_data".bt_state set value "locked"

# 5. RETURN ITEM
item replace entity @s weapon.mainhand from block ~ 319 ~ container.0

# 6. CLEAN UP
setblock ~ 319 ~ minecraft:air

# 7. OPTIONAL: Sound Effect
# Play a sound so the player knows the compass has 'found' the signal.
playsound minecraft:ui.cartography_table.take_result player @s ~ ~ ~ 1 1