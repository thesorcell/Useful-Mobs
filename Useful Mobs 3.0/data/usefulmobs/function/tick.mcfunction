## MORE BABY PIGS
execute unless score [UsefulMobs] UsefulMobs_PigBabiesDisabled matches 1.. as @e[type=pig,nbt={Age:-24000}] at @s run function usefulmobs:spawnbabypig

## SQUID INKING
execute unless score [UsefulMobs] UsefulMobs_SquidInkingDisabled matches 1.. as @e[type=squid] if data entity @s {HurtTime:10s} at @s positioned ^ ^ ^-1.5 if entity @p[distance=..2] as @a[distance=..1.5] at @s run function usefulmobs:inked
execute unless score [UsefulMobs] UsefulMobs_SquidInkingDisabled matches 1.. as @e[type=glow_squid] if data entity @s {HurtTime:10s} at @s positioned ^ ^ ^-1.5 if entity @p[distance=..2] as @a[distance=..1.5] at @s run function usefulmobs:inked_glow


## COMMON EATING
# Fix nearby mob scoreboard
execute at @a as @e[distance=..30,type=#usefulmobs:affectedmobs,tag=!UsefulMobs_CanEat] run scoreboard players set @s UsefulMobs_EatingCooldown 0
execute at @a run tag @e[distance=..30,type=#usefulmobs:affectedmobs,tag=!UsefulMobs_CanEat,scores={UsefulMobs_EatingCooldown=0}] add UsefulMobs_CanEat
# Lower nearby mob eating cooldown
execute at @a run scoreboard players remove @e[distance=..30,type=#usefulmobs:affectedmobs,scores={UsefulMobs_EatingCooldown=1..}] UsefulMobs_EatingCooldown 1

## BATS EATING
# Store item count values for berry consumption
scoreboard players set @a UsefulMobs_ItemCount 1
execute at @a as @e[distance=..30,type=item,nbt={Item:{id:"minecraft:glow_berries"}}] store result score @s UsefulMobs_ItemCount run data get entity @s Item.count
# Check for glowberries near bats
execute unless score [UsefulMobs] UsefulMobs_BatEcholocationDisabled matches 1.. at @a as @e[type=bat,distance=..30,scores={UsefulMobs_EatingCooldown=0}] at @s if entity @e[distance=..1.5,type=item,nbt={Item:{id:"minecraft:glow_berries"}}] if entity @e[type=#usefulmobs:berryglows,limit=1,sort=nearest,distance=..100] run function usefulmobs:eatberry

## BEARS EATING
# Store item count values for salmon consumption
scoreboard players set @a UsefulMobs_ItemCount 1
execute at @a as @e[distance=..30,type=item,nbt={Item:{id:"minecraft:salmon"}}] store result score @s UsefulMobs_ItemCount run data get entity @s Item.count
# Check for salmon near polar bears
execute unless score [UsefulMobs] UsefulMobs_PolarRoarDisabled matches 1.. at @a as @e[type=polar_bear,distance=..30,scores={UsefulMobs_EatingCooldown=0},nbt={Age:0}] at @s if entity @e[distance=..1.5,type=item,nbt={Item:{id:"minecraft:salmon"}}] if entity @p[distance=..10] run function usefulmobs:eatsalmon

## PIGS EATING
# Store item count values for golden carrot consumption
scoreboard players set @a UsefulMobs_ItemCount 1
execute at @a as @e[distance=..30,type=item,nbt={Item:{id:"minecraft:golden_carrot"}}] store result score @s UsefulMobs_ItemCount run data get entity @s Item.count
# Check for golden carrot near ridden pigs
execute unless score [UsefulMobs] UsefulMobs_PigSniffingDisabled matches 1.. at @a as @e[type=pig,distance=..30,scores={UsefulMobs_EatingCooldown=0}] on passengers on vehicle at @s if entity @e[distance=..1,type=item,nbt={Item:{id:"minecraft:golden_carrot"}}] if entity @p[distance=..10] if block ~ ~-1 ~ #usefulmobs:diggable run function usefulmobs:eatgoldencarrot
# Dirt particle animation
execute at @a as @e[type=pig,distance=..30,scores={UsefulMobs_EatingCooldown=1950..}] on passengers on vehicle at @s if entity @p[distance=..10] run function usefulmobs:dirtparticles
# Spawn pig loot
execute unless score [UsefulMobs] UsefulMobs_PigSniffingDisabled matches 1.. at @a as @e[type=pig,distance=..30,scores={UsefulMobs_EatingCooldown=1950}] on passengers on vehicle at @s if entity @p[distance=..10] run function usefulmobs:spawnpigloot
