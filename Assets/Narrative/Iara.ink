INCLUDE Globals.ink

LIST weaponMaterials = (deer_antler), (schist), (wood), (pebbles), (hemp)
LIST slingshotMaterials = (deer_antler), (pebbles), (hemp)
LIST spearMaterials = (schist), (wood), (hemp)
LIST bowMaterials = (deer_antler), (hemp)
VAR correctAnswers = 0

-> main

=== main ===
{first_time_iara:
    ~ first_time_iara = false
    Hello, I'm Iara, responsible for weapon production and repair, essential to hunting activities. Depending on the target to be killed, different weapons are needed and, consequently, different resources to create them. 
    For example, if your objective is to hunt a small animal, such as a rabbit, you will need lighter and more accurate weapons. On the other hand, when it comes to larger hunting, you will need a powerful and more resistant arsenal. 
    I heard you're getting ready to go hunting with Korg, and I guess you need some weapons. Well, I'm curious to understand your knowledge, so if you want to try creating your own weapons with what I have here, you're welcome. I'm here if you need help.
        -> Choose_Weapon
    - else:
    {has_slingshot and has_spear and has_bow:
        I hope I was able to help. Good luck with the hunt.
        * [Thanks, couldn't have done it without you.]
        -> END
        - else:
            There's still enough around to build some more stuff. Better safe than sorry!
            -> Choose_Weapon
    }
}

=== Choose_Weapon ===
~ correctAnswers = 0
* {not has_slingshot} [I'll try to build a slingshot.]
-> Slingshot_Build
* {not has_spear} [I think I can build a spear.]
-> Spear_Build
* {not has_bow} [I'll go for a bow.]
-> Bow_Build
* [Not right now.]
-> END

// Slingshot

=== Slingshot_Build ===
Which three materials are needed to make a slingshot?
* [Deer Antler]
-> Check_Slingshot_Materials(slingshotMaterials.deer_antler)
* [Schist]
-> Check_Slingshot_Materials(weaponMaterials.schist)
* [Wood]
-> Check_Slingshot_Materials(weaponMaterials.wood)
* [Pebbles]
-> Check_Slingshot_Materials(slingshotMaterials.pebbles)
* [Hemp]
-> Check_Slingshot_Materials(slingshotMaterials.hemp)

=== Check_Slingshot_Materials(material) ===
{material:
- slingshotMaterials.deer_antler:
    The upper section of the deer antler is needed to form the 'V' structure.
- slingshotMaterials.pebbles:
    Pebbles are used as projectiles to be launched by the slingshot.
- slingshotMaterials.hemp:
    Fibers such as hemp are essential to create the elastic section of the slingshot and to hold all the parts together.
- weaponMaterials.schist:
    Schist isn't used.
- weaponMaterials.wood:
    Wood isn't used.
}
{slingshotMaterials has material:
    ~ correctAnswers += 1
    {correctAnswers == LIST_COUNT(slingshotMaterials):
        -> Acquire_Slingshot
        - else:
            -> Slingshot_Build
    }
    - else:
        -> Slingshot_Build
}

=== Acquire_Slingshot ===
#Slingshot: true
~ has_slingshot = true
Wow! I'm impressed with the quality of that slingshot!
-> main

// Spear

=== Spear_Build ===
Which three materials are needed to make a spear?
* [Deer Antler]
-> Check_Spear_Materials(weaponMaterials.deer_antler)
* [Schist]
-> Check_Spear_Materials(spearMaterials.schist)
* [Wood]
-> Check_Spear_Materials(spearMaterials.wood)
* [Pebbles]
-> Check_Spear_Materials(weaponMaterials.pebbles)
* [Hemp]
-> Check_Spear_Materials(spearMaterials.hemp)

=== Check_Spear_Materials(material) ===
{material:
- weaponMaterials.deer_antler:
    Deer antlers aren't used.
- weaponMaterials.pebbles:
    Pebbles aren't used.
- spearMaterials.hemp:
    The hemp fiber is needed to hold the spearhead and mast.
- spearMaterials.schist:
    The schist is polished to form the tip of the spear.
- spearMaterials.wood:
    The wood is cut and polished to form the mast.
}
{spearMaterials has material:
    ~ correctAnswers += 1
    {correctAnswers == LIST_COUNT(spearMaterials):
        -> Acquire_Spear
        - else:
            -> Spear_Build
    }
    - else:
        -> Spear_Build
}

=== Acquire_Spear ===
#Spear: true
~ has_spear = true
Wow! I'm impressed with the quality of that spear!
-> main

// Bow

=== Bow_Build ===
Which two materials are needed to make a bow?
* [Deer Antler]
-> Check_Bow_Materials(bowMaterials.deer_antler)
* [Schist]
-> Check_Bow_Materials(weaponMaterials.schist)
* [Wood]
-> Check_Bow_Materials(weaponMaterials.wood)
* [Pebbles]
-> Check_Bow_Materials(weaponMaterials.pebbles)
* [Hemp]
-> Check_Bow_Materials(bowMaterials.hemp)

=== Check_Bow_Materials(material) ===
{material:
- bowMaterials.deer_antler:
    The core of deer antlers, typically curved and flexible, can be serve as the structure for the bow.
- weaponMaterials.pebbles:
    Pebbles aren't used.
- bowMaterials.hemp:
    Hemp is used as the bowstring, taking into account its resistance and elasticity.
- weaponMaterials.schist:
    Schist isn't used.
- weaponMaterials.wood:
    Wood isn't used.
}
{bowMaterials has material:
    ~ correctAnswers += 1
    {correctAnswers == LIST_COUNT(bowMaterials):
        -> Acquire_Bow
        - else:
            -> Bow_Build
    }
    - else:
        -> Bow_Build
}

=== Acquire_Bow ===
#Bow: true
~ has_bow = true
Wow! I'm impressed with the quality of that bow!
-> main
