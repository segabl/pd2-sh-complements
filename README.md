# Streamlined Heisting Complements

Complementary skill, perk and weapon changes to go with [Streamlined Heisting](https://github.com/segabl/pd2-streamlined-heisting).

## Skill changes

### Mastermind

#### Medic

- Combat Medic
  - Ace
    - Revive health increase 30% → 60%

*Since this percentage is multiplied with the revive health percentage, the ace version of this skill was not doing much at high difficulties.*
*While bumping the numbers will not increase revive health notably, it will slightly counterbalance the general revive health reduction.*

- Inspire
  - Ace
    - Cooldown 20s → 40s

*Inspire's cooldown is low enough to not really matter, the time it takes for someone to go into custody when downed is longer than the cooldown of the skill.*
*Increasing the cooldown makes Inspire usage more strategic and less abusable.*

#### Controller

- Forced Friendship
  - Ace
    - Damage absorption 0.5 → 1.5
    - Max stacks 8 → 4

*Keeping that many hostages for a measly 4 damage absorption is not really practical and not even possible on heists without civilians or after civilians are gone.*
*Reducing the stacks makes it possible to keep up the buff through police hostages and slightly increasing the total absorption should make it more useful.*

- Confident
  - Basic
    - Added missing intimidation power upgrade, removed intimidation duration upgrade

*Confident claims to increase the power of your intimidation but instead it increases intimidation duration (something that Stockholm Syndrome should do).*
*Swapping out the upgrades and moving the duration upgrade to Stockholm Syndrome makes more sense.*

- Stockholm Syndrome
  - Basic
    - Added missing intimidation duration upgrade

*See notes on Confident.*

- Partners In Crime
  - Ace
    - Damage reduction 54% → 50%

*Jokers in general are a low effort way to gain strong benefits and Partners In Crime is giving too much survivability to Jokers.*
*Reducing the total damage reduction to 95% will decrease effective HP by 80% and force players to take new Jokers more frequently.*

#### Sharpshooter

- Aggressive Reload
  - Ace
    - Reload speed increase 100% → 75%

*The reload speed increase of Aggressive Reload seems a bit extreme for something as basic as hitting headshots.*

### Enforcer

#### Shotgunner

- Far Away
  - Basic and Ace skill swapped
  - Ace
    - Steelsight accuracy increase 40% → 75%

*While one might want to increase the effective range of shotguns, increased accuracy might not always desireable.*
*Swapping basic and ace allows for increasing shotgun range without messing with accuracy and buffing the accuracy bonus makes it a more useful pick.*

- Overkill
  - Basic
    - Duration 20s → 10s

*Overkill's duration is way too long for the strong bonus damage it provides.*
*Reducing the duration will force players to engage with enemies more.*

#### Ammo Specialist

- Bullet Storm
  - Now only needs one gun to be fully empty to gain the maximum duration
  - Fixed increased duration when ammo bag was used up
  - Ace
    - Duration 15s → 10s

*Bullet Storm had comically long durations when the bag was used up, outside of that, reaching the full duration was annoying due to needing both guns to be empty.*
*Reducing the requirement to get the maximum duration and slightly reducing the full duration should make the skill feel better.*

- Saw Massacre
  - Basic
    - Reduced wear 50% → 95%

*Saw Massacre is a useless skill and 50% reduced wear is not enough to make the saw a viable weapon against enemies.*
*Decreasing the wear further will make it more viable at least in some cases.*

- Fully Loaded
  - Ace
    - Throwable pickup chance increases additively now

*The chance increase was multiplied with the base chance instead of added, which made it completely negligible as it took 70 ammo pickups to even reach 10% chance.*
*With an additive chance increase reaching more meaningful chance numbers will be possible.*

### Technician

#### Engineer

- Eco Sentry
  - Basic
    - Reduced deploy cost 5% → 10%

*The basic version does exactly the same as the basic version of Third Law, but costs 2 points instead of 1.*
*Giving Eco Sentry a slight boost should allow placing an additional sentry from full ammo in most cases.*

#### Breacher

- Hardware Expert
  - Changed drill auto restart chance to trigger everytime the drill breaks instead of on drill placement
  - Auto restart delay 5-20s → 3-8s
  - Ace
    - Auto restart chance 10% → 30%

*Auto restart is an inconsistent mechanic as it only has a chance to apply once when the drill is placed. This means if you were lucky you would not need to look after the drill at all, while if you were unlucky, the skill would not do anything for you.*
*Changing the mechanic to have a chance to trigger everytime the drill breaks and increasing the restart chance makes the skill less luck based.*

- More Firepower
  - Basic
    - Shaped charges 1 → 2
  - Ace
    - Shaped charges 2 → 3

*While the tripmine part of the skill is fine, the amount of shaped charges you get is not really great considering how little use they have on most heists.*
*Increasing the amount from a maximum of 6 to 8 will give the skill more value on heists that have use for shaped charges.*

- Kickstarter
  - Basic
    - Auto restart chance 20% → 30%

*See notes on Hardware Expert.*

- Fire Trap
  - Fixed tripmines placed on walls spawning fire on the walls
  - Basic
    - Base burn duration 10s → 20s
  - Ace
    - Burn duration increase 10s → 20s

*Fire Trap doesn't really feel useful as a top tier skill and you're basically getting a non-replenishable Molotov effect from it.*
*Increasing the burn duration and allowing them to be placed on walls without making the fire useless should make the skill more useful for area denial.*

#### Oppressor

- Heavy Impact
  - Basic
    - Stagger chance 5% → 10%
  - Ace
    - Stagger chance 20% → 30%

*Heavy Impact is a niche skill that is not very useful with the current numbers.*
*Increasing the stagger chance should give it some more use.*

- Body Expertise
  - Basic
    - Damage 30% → 20%
  - Ace
    - Damage 90% → 60%

*Body Expertise simply gives too much value for very low effort.*
*Reducing the damage percentage should bring the skill more in line.*

### Ghost

#### Silent Killer

- Optical Illusions
  - Basic
    - Trageting chance decrease 35% → 20%

*Optical Illusions is a niche skill but it provides slightly too much value when it's used with Jokers.*

- Low Blow
  - Changed crit damage multiplier to a static 3x multiplier

*The crit damage multiplier uses the headshot multiplier, which made crits a bit too effective against enemies like Bulldozers and Cloakers.*
*Making the multiplier static will keep their strength against regular units but slightly nerf them against enemies with high headshot multipliers*

- Unseen Strike
  - Changed crit damage multiplier to a static 3x multiplier
  - Basic
    - Crit duration 6s → 4s
  - Ace
    - Crit duration 18s → 12s

*The duration for crits is a bit too long, given that part of the skill's description is wrong and you do not lose the bonus on getting hit.*

### Fugitive

#### Gunslinger

- Desperado
  - Basic
    - Now refreshes buff duration on hit
    - Stack boost is now additive
    - Duration 10s → 5s

*Losing the accuracy bonus after a fixed amount of time despite consistently hitting shots didn't really feel good.*
*Refreshing the buff duration on hit but reducing the base duration makes the skill feel better while still providing a good boost to accuracy.*

- Trigger Happy
  - Now refreshes buff duration on hit
  - Stack boost is now additive
  - Basic
    - Damage increase 120% → 25%
    - Max stacks 1 → 4
  - Ace
    - Max stacks 1 → 6

*The Ace version of Trigger happy wasn't really worth it, since all the important stuff was in the basic skill.*
*Increasing the maximum stack size and moving some of the skill's power to the ace version should improve how this skill plays.*

#### Revenant

- Nine Lives
  - Basic
    - Bleedout health increase 50% → 100%

*The percentage value for this skill was still stuck in a time were enemies didn't even deal half as much damage and where the murder tactic was non-functional.*
*Increasing the gained health value should make the basic skill more useful.*

- Up You Go
  - Ace
    - Revive health increase 40% → 100%

*See notes on Combat Medic.*

#### Brawler

- Bloodthirst
  - Basic and Ace skill swapped
  - Basic
    - Reload speed increase 50% for 10s → 30% for 4s
  - Ace
    - Damage increase +100% up to 1600% → +50% up to 800%

*Bloodthirst provides a way too strong bonus for a basic skill that involves no effort to gain as the requirement for it is something you do anyways.*
*Swapping the basic and ace version and reducing the numbers should bring this skill more in line.*

- Pumping Iron
  - Basic
    - Damage increase 100% → 200%
  - Ace
    - Damage increase 100% → 150%

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
  - Melee damage boost duration 7s → 5s

*Overdog's description incorrectly states the duration of the damage boost only being 1s while Advanced Close Combat increases the duration to 7s.*
*Reducing the duration to 5s brings it a bit more in line with other damage boosts.*

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

### Anarchist

- Lust for Life
  - Armor gain 30 → 20

*The final card description in Anarchist is incorrect and it actually gives 30 armor instead of the stated 10.*
*Slightly reducing the armor gain should still allow decent gains while being a bit more risky.*

### Stoic

- Virtue
  - Damage over time duration 12s → 9s

*Stoic is a very powerful deck as it gives you a lot of time to react to incoming damage, often without even the need to use the flask.*
*Decreasing the time it takes to apply the damage over time will force the usage of the flask more often.*

### Hacker

- Botnet
  - Removed dodge chance bonus

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
  - Reworked and rebalanced ammo pickup

*There is a form of aim assist that makes you more likely to hit a target the longer you shoot at it while missing.*
*Removing this aim assist will make it harder to hit enemies at distance with low accuracy weapons.*
*Ammo pickup is highly inconsistent since fractional parts of ammo pickup are just discarded.*
*Adding any fractional leftovers to the next ammo pickup will guarantee a pickup at some point no matter how low the pickup rate.*

- LMGs
  - Added 15% reduced movement speed penalty

*Even after the nerfs LMGs are still very powerful with very little drawbacks.*
*Adding back the movement speed penalty gives a more unique drawback than nerfing stats.*

- Miniguns
  - Added 15% reduced movement speed penalty
  - Added damage falloff
  - Increased damage by 20%

*With the reduced movement speed and added damage falloff, miniguns could use a slight damage buff to justify using them over LMGs.*

- Shotguns
  - Restored original base pellet amount of 12
  - Double Barrel Shotguns
    - Increased damage by 25%
    - Increased reload speed by 50%
  - Buckshot
    - Now reduces pellet amount by 3
  - Tombstone Slug
    - Now reduces pellet amount by 3
  - AP Slug
    - Accuracy bonus 8 → 24

*Shotgun pellet amount was changed for "optimization", without touching shotgun balance at all.*
*Restoring the pellet amount to the original values and rebalancing ammo types should make the choice of ammo more impactful.*

- Saws
  - Fixed hardcoded damage increase against Bulldozers
  - Made damage against Bulldozers multiply base damage instead of a fixed number

*Saws have a hidden damage increase against Bulldozers but the list for the affected enemies is hardcoded so it only applies to the regular Bulldozer variants.*
*Changing it to check for the "tank" tag instead of the hardcoded list will make it affect every Bulldozer.*

- Akimbo
  - Set reload speed to roughly 75% of their single weapon counterparts

*Reload speeds for akimbo weapons seem random and don't really correlate to their single counterparts, in some cases even being faster than the base weapon reload speed.*
*This change bases reload times on their single counterparts which results in a slight buff for most akimbo pistols and a nerf for most other akimbo weapons.*

- Bows
  - Reduced damage by 50%
  - Reduced charge time by 30%
  - Increased minimum projectile speed to 50%
  - Added innate armor piercing

*Bows don't really feel good to use due to requiring long charge times before being able to fire a usable shot.*
*Allowing bows to be quickly fired without charging and reducing the damage in exchange makes bows more fun to use.*

- Crossbows
  - Added innate armor piercing

*Similar to bows, crossbows are not that fun to use, adding armor piercing should make them feel better.*

- Grenade Launchers
  - Reduced overall ammo pickup
  - Piglet
    - Increased reload speed by 70%

*Reducing the overall ammo pickup of grenade launchers in favour of more consistent pickup should make them feel like less of a gamble to use.*

- Flamethrowers
  - Moved 70% of DoT damage to base damage

*Shortly tapping flamethrowers and letting the DoT do the actual damage is not a very fun way to use them.*
*Moving a majority of the damage to the base damage makes flamethrowers feel more powerful while keeping the same average DPS.*

- Melee
  - Rebalanced all melee weapons based on speed, concealment and range

*There are only a handful of relevant melee weapons and most of the others are arbitrarily balanced.*
*Basing the damage and knockdown of melee weapons on their other stats with the Ice Pick as a reference should make the choice of melee weapon more interesting.*
