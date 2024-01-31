INCLUDE Globals.ink

{first_time_vorn:
    ~ first_time_vorn = false
    Hello new guy, I'm Vorn. One of my jobs is to ensure that the heart of this camp, this central fire pit, stays lit for cooking and warming at night. I need your assistance. Contrary to what most people here at camp think, maintaining a fire is complicated. It is necessary to rub a piece of hard rock on a piece of mineral, and then the sparks produced are used to ignite a piece of fungus. For the rock I typically use flint and for the mineral, pyrite. I need you to bring me a little of each. As a reward, you'll get a double portion of drinking water.
    * [Deal!]
    -> END
    - else:
    {has_flint and has_pyrite and has_fungus:
        {has_water and done_fire_quest:
            Treasure that water, it's not everyday that I give it away.
            * [Don't worry, it's safe with me.]
            -> END
            - else:
            Great, you got all of the materials. Thanks a bunch! Here, there's your water.
            #Flint: false #Pyrite: false #Moss: false #Water: true
            ~ has_water = true
            ~ done_fire_quest = true
            * [My pleasure to help.]
            -> END   
        }
        - else:
        Still missing those materials. The craftsmen and artists of the tribe might have pyrite and flint left. Regarding the moss, the shaman typically always has some in stock.
        * [I'll look for them then.]
        -> END
    }
}