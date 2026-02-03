# Play a "hiss" sound
playsound minecraft:block.fire.extinguish master @a[distance=..5] ~ ~ ~ 0.5 2

# Reset the state to 'new'
data modify entity @s Item.components."minecraft:custom_data".bt_state set value "new"

# Clear the Lodestone Target
data remove entity @s Item.components."minecraft:lodestone_tracker"