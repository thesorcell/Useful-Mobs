## Executing as and at pig eating golden carrot
# Reset eating cooldown 
scoreboard players set @s UsefulMobs_EatingCooldown 2000

# Grant advancement
advancement grant @p only usefulmobs:feed_pig

# Aesthetics
effect give @s minecraft:slowness 4 10 true

# Remove golden carrot
execute as @e[type=item,nbt={Item:{id:"minecraft:golden_carrot"}},distance=..3] run function usefulmobs:decreaseitem

