INCLUDE Globals.ink

{first_time_korg:
    ~ first_time_korg = false
    Glad you're up brother, what an experience last night was! I took the opportunity to get up early and meet the tribe. They told me that we need to prove ourselves so that we can be part of them and show our expertise with weapons. 
    These people love to hunt and we can't afford to displease them. It's our last chance... But before that, we have to get weapons and train to have any chance of impressing them. To do this, you need to build your weapons to carry out a training session in the forest. When you're ready, come here again so we can leave together!
    * [I'll go get them.]
    -> Goodbye
  - else:
    {has_bow and has_slingshot and has_spear:
        Great! I see you already have your weapons made and ready to be used! When you're ready, we head out into the forest to hunt so you can practice and learn how to use them.
        * [What are we waiting for?]
        -> Leave
        * [Not yet.]
        -> Hurry
        - else:
            You still don't have all the weapons you need for training... There should be someone in the tribe responsible for that.
            * [I'll get the ones remaining.]
            -> Goodbye
    }
}

=== Leave ===
Let's go! #End: true
-> END

=== Hurry ===
Hurry up then, we don't have all day!
-> END

=== Goodbye ===
See you later!
-> END