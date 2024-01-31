INCLUDE Globals.ink

{first_time_lina:
    ~ first_time_lina = false
    Welcome, I'm Lina. <>
}
Rock Art is a special art. We use different methods to create animals like the ones you see on this wall. We generally focus on the larger animals, such as the aurochs, horse, deer and goat, as they are the ones that bring the most food to the tribe, and are often portrayed with rounded bellies, to bring good luck and prosperity to future generations of the tribe. It is a tradition passed down from generation to generation and a form of communication with the spiritual world.
{not has_pyrite and not first_time_vorn:
    * [Hey, isn't that pyrite?]
    -> Get_Pyrite
}

* [Hmm... sure, thanks for the information.]
-> END

=== Get_Pyrite ===
#Pyrite: true
~ has_pyrite = true
Of course, there's plenty here for years of activity! Here you go. I hope it's enough.
* [That'll do, thank you.]
-> END