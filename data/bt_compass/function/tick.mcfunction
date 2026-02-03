# CALCULATE
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{bt_state:"new"}}}}] at @s run function bt_compass:calculate

# DETECT DROPPED COMPASS
execute as @e[type=item,nbt={Item:{id:"minecraft:compass",components:{"minecraft:custom_data":{bt_state:"locked"}}}}] at @s run function bt_compass:reset_state