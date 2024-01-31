INCLUDE Globals.ink

The shaman is a mysterious figure... In addition to rituals and ceremonies, he is often the tribe's healer, using herbs and ancient knowledge to treat injuries and illnesses. He once created a potion that made a warrior snore loud enough to scare a bear! In the end, we all laughed and the warrior recovered, but it was a story we won't forget.

{not first_time_elira and not has_sumac:
    * [I need sumac and I heard the shaman has some...]
    -> Get_Sumac
}

{not first_time_vorn and not has_fungus:
    * [Somone told me I could find some moss here.]
    -> Get_Moss
}

{first_time_mara:
    ~ first_time_mara = false
    + [Cool story...]
    -> END
    - else:
        + [I've heard that story before...]
        -> END
}

==== Get_Sumac ===
#Sumac: true
~ has_sumac = true
Sumac leaves, harvested wisely, will reveal not only vibrant colors, but also the spiritual essence that will guide you on your journey.
* [Thank you.]
-> END

=== Get_Moss ===
#Moss: true
~ has_fungus = true
May this humble offering help you in whatever you need.
* [It certainly will, thanks.]
-> END