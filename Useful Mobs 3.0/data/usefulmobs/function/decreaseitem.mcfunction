## Executing as and at nearest item

# If one item remaining, kill item entity
kill @s[nbt={Item:{count:1}}]

# If more than one item remaining, lower item count
execute if score @s UsefulMobs_ItemCount matches 1.. store result entity @s Item.count byte 1 run scoreboard players operation @s UsefulMobs_ItemCount -= @p UsefulMobs_ItemCount
