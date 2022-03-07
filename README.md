# Streamlined Heisting Complements

Complementary skill, perk and weapon changes to go with [Streamlined Heisting](https://github.com/segabl/pd2-streamlined-heisting).

## Skill changes

### Mastermind

#### Medic

- Combat Medic
  - Ace: Revive health increase 30% → 50%

*Since this percentage is multiplied with the revive health percentage, the ace version of this skill was not doing much at high difficulties.*
*While bumping the numbers will not increase revive health notably, it will slightly counterbalance the general revive health reduction.*

- Inspire
  - Ace: Cooldown 20s → 60s

*Inspire's cooldown is low enough to not really matter, the time it takes for someone to go into custody when downed is longer than the cooldown of the skill.*
*Increasing the cooldown makes Inspire usage more strategic and less abusable.*

#### Controller

- Confident
  - Basic: Added missing intimidation power upgrade, removed intimidation duration upgrade

*Confident claims to increase the power of your intimidation but instead it increases intimidation duration (something that Stockholm Syndrome should do).*
*Swapping out the upgrades and moving the duration upgrade to Stockholm Syndrome makes more sense.*

- Stockholm Syndrome
  - Basic: Added missing intimidation duration upgrade

*See notes on Confident.*

- Partners In Crime
  - Ace: Damage reduction 54% → 50%

*Jokers in general are a low effort way to gain strong benefits and Partners In Crime is giving too much survivability to Jokers.*
*Reducing the total damage reduction to 95% will decrease effective HP by 80% and force players to take new Jokers more frequently.*

#### Sharpshooter

- Aggressive Reload
  - Ace: Reload speed increase 100% → 75%

*The reload speed increase of Aggressive Reload seems a bit extreme for something as basic as hitting headshots.*

- Graze
  - Ace: Damage on headshot 100% → 90%

*Graze is a strong room clearing ability and giving 100% of the damage to close enemies makes it not very strategic to use.*
*Slightly reducing the damage on a headshot kill will encourage players to shoot higher health targets first.*

### Enforcer

#### Shotgunner

- Far Away
  - Basic and Ace skill swapped
  - Ace: Steelsight accuracy increase 40% → 75%

*While one might want to increase the effective range of shotguns, increased accuracy might not always desireable.*
*Swapping basic and ace allows for increasing shotgun range without messing with accuracy and buffing the accuracy bonus makes it a more useful pick.*

- Overkill
  - Basic: Duration 20s → 8s

*Overkill's duration is way too long for the strong bonus damage it provides.*
*Reducing the duration will force players to engage with enemies more.*

#### Ammo Specialist

- Bullet Storm
  - Fixed increased duration when ammo bag was used up
  - Ace: Duration 15s → 10s

*Depending on the ammo bag upgrades, Bullet Storm had comically long durations when the bag was used up due to a bug.*
*The intended duration also seems a tad too long, providing large benefits for a low skill point cost.*

- Saw Massacre
  - Basic: Reduced wear 50% → 95%

*Saw Massacre is a useless skill and 50% reduced wear is not enough to make the saw a viable weapon against enemies.*
*Decreasing the wear further will make it more viable at least in some cases.*

- Fully Loaded
  - Ace: Throwable pickup chance increase 1% → 5%

*The chance increase is multiplied with the base chance instead of added, which makes it completely negligible as it takes 70 ammo pickups to even reach 10% chance.*
*With a chance increase of 5%, reaching more meaningful chance numbers will be possible.*

### Technician

#### Breacher

- Hardware Expert
  - Changed drill auto restart chance to trigger everytime the drill breaks instead of on drill placement
  - Auto restart delay 5-20s → 5-10s
  - Ace: Auto restart chance 10% → 20%

*Auto restart is an inconsistent mechanic as it only has a chance to apply once when the drill is placed. This means if you were lucky you would not need to look after the drill at all, while if you were unlucky, the skill would not do anything for you.*
*Changing the mechanic to have a chance to trigger everytime the drill breaks and increasing the restart chance makes the skill less luck based.*

- More Firepower
  - Basic: Shaped charges 1 → 2
  - Ace: Shaped charges 2 → 3

*While the tripmine part of the skill is fine, the amount of shaped charges you get is not really great considering how little use they have on most heists.*
*Increasing the amount from a maximum of 6 to 8 will give the skill more value on heists that have use for shaped charges.*

- Kickstarter
  - Basic: Auto restart chance 20% → 30%

*See notes on Hardware Expert.*

- Fire Trap
  - Fixed tripmines placed on walls spawning fire on the walls
  - Basic: Base burn duration 10s → 20s
  - Ace: Burn duration increase 10s → 20s

*Fire Trap doesn't really feel useful as a top tier skill and you're basically getting a non-replenishable Molotov effect from it.*
*Increasing the burn duration to a total of 35s and allowing them to be placed on walls without making the fire useless should make the skill more useful for area denial.*

#### Oppressor

- Heavy Impact
  - Basic: Stagger chance 5% → 15%
  - Ace: Stagger chance 20% → 40%

*Heavy Impact is a niche skill that is not very useful with the current numbers.*
*Increasing the stagger chance should give it some more use.*

- Body Expertise
  - Basic: Damage 30% → 20%
  - Ace: Damage 90% → 60%

*Body Expertise gives too much value for very low effort.*
*Reducing the damage percentage should bring the skill more in line.*

### Ghost

#### Silent Killer

- Optical Illusions
  - Basic: Trageting chance decrease 35% → 20%

*Optical Illusions is a niche skill but it provides slightly too much value when it's used with Jokers.*

- Low Blow
  - Changed crit damage multiplier to a static 3x multiplier

*The crit damage multiplier uses the headshot multiplier, which made crits too effective against enemies like Bulldozers and Cloakers.*
*Making the multiplier static will keep their strength against regular units but slightly nerf them against enemies with high headshot multipliers*

- Unseen Strike
  - Changed crit damage multiplier to a static 3x multiplier
  - Basic: Crit duration 6s → 4s
  - Ace: Crit duration 18s → 12s

*The duration for crits is a bit too long, given that part of the skill's description is wrong and you do not lose the bonus on getting hit.*

### Fugitive

#### Revenant

- Nine Lives
  - Basic: Bleedout health increase 50% → 100%

*The percentage value for this skill was still stuck in a time were enemies didn't even deal half as much damage and where the murder tactic was non-functional.*
*Increasing the gained health value should make the basic skill more useful.*

#### Brawler

- Bloodthirst
  - Basic and Ace skill swapped
  - Basic: Reload speed increase 50% for 10s → 30% for 4s
  - Ace: Damage increase +100% up to 1600% → +50% up to 800%

*Bloodthirst provides a way too strong bonus for a basic skill that involves no effort to gain as the requirement for it is something you do anyways.*
*Swapping the basic and ace version and reducing the numbers should bring this skill more in line.*

- Pumping Iron
  - Basic: Damage increase 100% → 200%
  - Ace: Damage increase 100% → 150%

*Pumping Iron could do with a little numbers increase, especially with Bloodthirst nerfed.*
*Increasing the damage will make it possible to reach similar damage numbers against non specials in combination with Bloodthirst.*

- Berserker
  - Swapped with Frenzy

*Berserker provides a very strong benefit that is a bit too easy to reach in the skilltree.*
*Swapping Berserker and Frenzy makes investing into it a bit more costly.*

- Frenzy
  - Swapped with Berserker

*See notes on Berserker.*

## Perk deck changes

### Crook

- Expert Composure
  - Armor increase 25% → 30%

*Crook could use a slight armor buff to make other ballistic vests more usable.*

### Burglar

- Dutch Courage
  - Pager answer speed 10% → 20%

*Increasing the speed for answering pagers makes Burglar more useful as an alternative for Yakuza as a stealth deck.*

### Infiltrator

- Overdog
  - Moved hidden melee damage boost duration from Advanced Close Combat to Overdog
  - Updated description to state the correct damage boost duration
  - Melee damage boost duration 7s → 4s

*Overdog's description incorrectly states the duration of the damage boost only being 1s while Advanced Close Combat increases the duration to 7s.*
*Reducing the duration to 4s brings it a bit more in line with other damage boosts.*

### Sociopath

- Overdog
  - Renamed back to "No Talk"
  - Added melee damage boost duration upgrade

*When Infiltrator got the hidden melee damage boost duration upgrade, Sociopath was left out and still has only 1s, which is not enough for slower melee weapons.*
*Adding the same duration increase as in Infiltrator should make all melee weapons useful with Sociopath.*

### Gambler

- Medical Supplies
  - Cooldown 3s → 2s

- Ammo Give Out
  - Cooldown 5s → 3s

*As a team oriented deck, Gambler needs some tweaks to its cooldowns for health and ammo restore to make it more useful.*

### Grinder

- Histamine
  - Healing interval 0.3s → 0.2s
  - Healing duration 3s → 2s
  - Effect cooldown 1.5s → 1s

- Euphoria
  - Healing duration 4.2s → 3s

*Speeding up healing over time but shortening its duration will keep the overall healing the same but should feel better against the lower grace period.*

### Stoic

- Virtue
  - Damage over time duration 12s → 9s

*Stoic is a very powerful deck as it gives you a lot of time to react to incoming damage, often without even the need to use the flask.*
*Decreasing the time it takes to apply the damage over time will force the usage of the flask more often.*

### Hacker

- Botnet
  - Removed hidden dodge chance bonus

*Hacker has two instances of dodge chance bonuses of 15% each, which makes it a bit too strong.*
*Removing one of those instances should make it more balanced.*

### Leech

- Momentum
  - Number of health segments 5 → 8
  - Teammate heal amount 5% → 3%

- Stalwart
  - Teammate heal amount 10% → 6%

- Symbiosis
  - Number of health segments 10 → 16

*Leech depends heavily on vanilla values of grace period and enemy firing behaviour and as such falls off with lower grace period and enemies firing in full auto.*
*Increasing the number of health segments should improve survivability, while lowering the healing amount keeps the total amount of healing similar to vanilla.*

## General changes

### Weapons

- All weapons
  - Removed aim assist

*There is a form of aim assist that makes you more likely to hit a target the longer you shoot at it while missing.*
*Removing this aim assist will make it harder to hit enemies at distance with low accuracy weapons.*

- LMGs
  - Added 15% reduced movement speed penalty

*Even after the nerfs LMGs are still very powerful with very little drawbacks.*
*Adding back the movement speed penalty gives a more unique drawback than nerfing stats.*

- Miniguns
  - Added 15% reduced movement speed penalty
  - Added damage falloff
  - Increased damage by 10%

*With the reduced movement speed and added damage falloff, miniguns could use a slight damage buff to justify using them over LMGs.*

- Shotguns
  - Restored original base pellet amount of 12
  - Buckshot ammo: Now reduces pellet amount by 3

*Shotgun pellet amount was changed for "optimization", without touching shotgun balance at all.*
*Restoring the pellet amount to the original values and reducing the amount with buckshot ammo is a quick fix as opposed to rebalancing all shotguns.*

- Grenade Launchers
  - Reduced max ammo pickup by 20%

*Grenade launchers are a bit too easy to keep topped off, a slight decrease in the maximum ammo pickup should discourage use against single targets.*

- Saw
  - Fixed hardcoded damage increase against Bulldozers
  - Made damage against Bulldozers multiply base damage instead of a fixed number

*Saws have a hidden damage increase against Bulldozers but the list for the affected enemies is hardcoded so it only applies to the regular Bulldozer variants.*
*Changing it to check for the "tank" tag instead of the hardcoded list will make it affect every Bulldozer.*
