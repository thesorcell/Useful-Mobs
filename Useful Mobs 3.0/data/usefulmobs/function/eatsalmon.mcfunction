## Executing as and at polar bear eating salmon

# Reset eating cooldown 
scoreboard players set @s UsefulMobs_EatingCooldown 200

# Give nearest players strength
effect give @a[distance=..12] strength 30 1 false

# Grant advancement
advancement grant @p only usefulmobs:feed_polar_bear

# Aesthetics
particle entity_effect{color:[1.000,0.902,0.000,1.00]} ~ ~1 ~ 0.5 0.5 0.5 0 50 force
playsound minecraft:entity.polar_bear.warning neutral @a ~ ~ ~ 1 1
playsound minecraft:entity.villager.celebrate neutral @a ~ ~ ~ 1 0

# Remove salmon
execute as @e[type=item,nbt={Item:{id:"minecraft:salmon"}},distance=..3] run function usefulmobs:decreaseitem