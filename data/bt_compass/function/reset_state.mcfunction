# 1. Play a "hiss" sound (like magic fading)
playsound minecraft:block.fire.extinguish master @a[distance=..5] ~ ~ ~ 0.5 2

# 2. Reset the state to 'new'
# Note: When checking 'Item', we modify 'Item'.
data modify entity @s Item.components."minecraft:custom_data".bt_state set value "new"

# 3. Clear the Lodestone Target (Optional visual reset)
# This makes the needle spin immediately so you know it's reset.
data remove entity @s Item.components."minecraft:lodestone_tracker"