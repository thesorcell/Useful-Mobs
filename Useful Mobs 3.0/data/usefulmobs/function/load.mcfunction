# Scoreboard used to control how often bats can eat
scoreboard objectives add BatEatingCooldown dummy "Bat Eating Cooldown"
scoreboard objectives add UsefulMobs_EatingCooldown dummy "Mob Eating Cooldown (Useful Mobs)"
scoreboard objectives remove BatEatingCooldown

# Scoreboard used to ensure mobs only eat one item, not a whole stack
scoreboard objectives add BerryCount dummy "Berry Count"
scoreboard objectives add UsefulMobs_ItemCount dummy "Item Count (Useful Mobs)"
scoreboard objectives remove BerryCount

# Scoreboards used for feature config
scoreboard objectives add UsefulMobs_SquidInkingDisabled dummy
scoreboard objectives add UsefulMobs_PigBabiesDisabled dummy
scoreboard objectives add UsefulMobs_PigSniffingDisabled dummy
scoreboard objectives add UsefulMobs_BatEcholocationDisabled dummy
scoreboard objectives add UsefulMobs_PolarRoarDisabled dummy
