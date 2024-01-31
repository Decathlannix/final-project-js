INCLUDE Globals.ink

{first_time_elira:
    ~ first_time_elira = false
    Hello, I'm Elira, and I treat the skins brought by hunters, to prepare them to be transformed into clothes, blankets and essential items. This process of treating animal skins and hides, which we call tanning, is an ancestral art passed down through generations, an expression of our ability to use all resources to ensure our comfort and protection. 
    Either way, you came at a good time. Since we found you and your brother last night, we noticed that you have nothing in the way of warm clothing in this freezing climate, and I have been preparing you some for the last few hours. 
    However, I'm running out of sumac, a plant that I always use to dye my clothes and also for the tanning process itself. Could you do me a favor and go get some for me? The shaman must have something he doesn't need.
    * [That's kind of you. I'll be sure to bring some.]
    -> END
    - else:
    {has_sumac:
        {has_clothes:
            Enjoy your new clothes!
            * [I will.]
            -> END
            - else:
            Appreciate it. Now I can finally finish the clothes. Here you have. #Sumac: false #Clothes: true
            ~ has_clothes = true
            * [Thanks!]
            -> END    
        }
        - else:
        Still need that sumac... There should be some in the shaman's tent...
        * [Sure, I'll go get it]
        -> END
    }
}