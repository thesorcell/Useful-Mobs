## Executing as and at bat eating a berry

# Reset eating cooldown 
scoreboard players set @s UsefulMobs_EatingCooldown 200

# Give nearest monster glowing
effect give @e[type=#usefulmobs:berryglows,limit=1,sort=nearest,distance=..100] glowing 8 0 true

# Grant advancement
advancement grant @p only usefulmobs:feed_bat

# Aesthetics
particle minecraft:glow ~ ~ ~ 0.2 0.2 0.2 0 10 force
playsound minecraft:entity.bat.ambient neutral @a ~ ~ ~ 1 1.25
playsound minecraft:entity.generic.eat neutral @a ~ ~ ~ 1 1.25

# Remove berry
execute as @e[type=item,nbt={Item:{id:"minecraft:glow_berries"}},distance=..2] run function usefulmobs:decreaseitem