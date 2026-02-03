# 1. CALCULATE
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{bt_state:"new"}}}}] at @s run function bt_compass:calculate

# 2. DETECT DROPPED COMPASS
# Run a function on the item so we can do multiple things (sound + modify)
execute as @e[type=item,nbt={Item:{id:"minecraft:compass",components:{"minecraft:custom_data":{bt_state:"locked"}}}}] at @s run function bt_compass:reset_state