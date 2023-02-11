## PIGS
execute as @e[type=pig,nbt={Age:-24000}] at @s run summon pig ~ ~ ~ {Age:-23999}

## BATS
# Store item count values for berry consumption
scoreboard players set @a BerryCount 1
execute at @a as @e[distance=..30,type=item,nbt={Item:{id:"minecraft:glow_berries"}}] store result score @s BerryCount run data get entity @s Item.Count

# Fix nearby bats scoreboard
execute at @a as @e[distance=..30,type=bat,tag=!CanEat] run scoreboard players set @s BatEatingCooldown 0
execute at @a run tag @e[distance=..30,type=bat,tag=!CanEat,scores={BatEatingCooldown=0}] add CanEat

# Check for glowberries near bats
execute at @a as @e[type=bat,distance=..30,scores={BatEatingCooldown=0}] at @s if entity @e[distance=..1.5,type=item,nbt={Item:{id:"minecraft:glow_berries"}}] if entity @e[type=#usefulmobs:berryglows,limit=1,sort=nearest,distance=..100] run function usefulmobs:eatberry

# Lower eating cooldown for nearby bats
execute at @a run scoreboard players remove @e[type=bat,scores={BatEatingCooldown=1..},distance=..30] BatEatingCooldown 1