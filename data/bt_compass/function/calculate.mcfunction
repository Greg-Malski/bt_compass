# Get Distance from CENTER (Current Spot)
execute store result score #dist_center bt_math run locate structure minecraft:buried_treasure

# Get Distance from X+100 (Wide Stance)
execute at @s positioned ~100 ~ ~ store result score #dist_x bt_math run locate structure minecraft:buried_treasure

# Get Distance from Z+100 (Wide Stance)
execute at @s positioned ~ ~ ~100 store result score #dist_z bt_math run locate structure minecraft:buried_treasure

# CALCULATE X COORDINATE
# Formula: TargetX = PlayerX + (DistCenter^2 - DistX^2 + 10000) / 200
scoreboard players operation #dist_center bt_math *= #dist_center bt_math
scoreboard players operation #dist_x bt_math *= #dist_x bt_math
scoreboard players operation #dist_center bt_math -= #dist_x bt_math
scoreboard players operation #dist_center bt_math += #const_10000 bt_math
scoreboard players operation #dist_center bt_math /= #const_200 bt_math

# Apply to Player X
execute store result score #final_x bt_math run data get entity @s Pos[0]
scoreboard players operation #final_x bt_math += #dist_center bt_math

# CALCULATE Z COORDINATE
execute store result score #dist_center bt_math run locate structure minecraft:buried_treasure
scoreboard players operation #dist_center bt_math *= #dist_center bt_math
scoreboard players operation #dist_z bt_math *= #dist_z bt_math
scoreboard players operation #dist_center bt_math -= #dist_z bt_math
scoreboard players operation #dist_center bt_math += #const_10000 bt_math
scoreboard players operation #dist_center bt_math /= #const_200 bt_math

# Apply to Player Z
execute store result score #final_z bt_math run data get entity @s Pos[2]
scoreboard players operation #final_z bt_math += #dist_center bt_math

# RUN MACRO
execute store result storage bt_compass:macro target_x int 1 run scoreboard players get #final_x bt_math
execute store result storage bt_compass:macro target_z int 1 run scoreboard players get #final_z bt_math

function bt_compass:update_nbt with storage bt_compass:macro