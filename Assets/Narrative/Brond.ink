INCLUDE Globals.ink

{first_time_brond:
    ~ first_time_brond = false
    Ahoy, newbie! I hope you're rested after what you went through yesterday.
    Everyone here calls me captain, but my name is Brond. I keep this wonder that you see here in condition for the various trips we make through the waters of this majestic river, in search of sustenance and others like us.
}
I heard that your brother is preparing a hunt in the forest. Apparently, it's to train for some kind of test, but I don't know the details...
{first_time_korg:
    * [OK, I'll see if I can find him...]
    -> END
    - else:
    * [I've spoken to him, but thank you for the heads up.]
    -> END
}