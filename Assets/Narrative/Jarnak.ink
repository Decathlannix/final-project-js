    INCLUDE Globals.ink

{first_time_jarnak:
    ~ first_time_jarnak = false
    Hello, my name is Jarnak. I'm in charge of preparing and cooking the tribe's food and I need your help. 
    White fish are one of the most common fish here and I'm trying to cook these three that came from the last catch, but first I need a blade to open them, made out of a hard mineral like flint. I'd be so grateful if you could get me one.
    * [You bet!]
    -> END
    - else:
    {has_fish_tool:
        {has_food and done_fish_quest:
            Save that fish somewhere cool for when you need it.
            * [I will, thanks for the advice.]
            -> END
            - else:
            You managed to find a flint blade! It will do nicely. Here, take one of these fish, for your troubles. #Fish_Tool: false #Food: true
            ~ has_food = true
            ~ done_fish_quest = true
            * [No problem, have fun preparing lunch.]
            -> END   
        }
        - else:
        Seems like you haven't found the blade yet. If I had to guess, I would say there's probably one laying around on one of the working stations to the east side of the camp. Those guys always have some.
        * [I'll try there. Be back soon.]
        -> END
    }
}