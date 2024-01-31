INCLUDE Globals.ink

-> main

=== main ===
{first_time_gara:
    ~ first_time_gara = false
    These carvings, are part of our heritage. They've passed from shaman to shaman, generation to generation. Each design and symbol tells the story of those who came before, how they hunted, performed rituals and survived. Now, it is up to us to preserve this traditionand add our own stories to the rocks, ensuring that the wisdom of our tribe endures through time. 
    Oops, sorry, forgot to introduce myself, I'm Gara. Our engraving techniques include abrasion, incision, perforation and scraping. Would you like to know more about any of them?
  - else:
    How are you doing? Interested in learning more about any of our carving methods?
}

+ [Yes, I'd love to know more about abrasion.]
-> Abrasion
+ [Incision seems interesting.]
-> Incision
+ [Tell me more about perforation.]
-> Perforation
+ [I've never heard of scraping.]
-> Scraping
+ [I'm sorry, but I don't have time now...]
-> Goodbye

=== Abrasion ===
Abrasion was often combined with other techniques, as it served to smooth the traced surface, by rubbing it with a stone tool, in order to improve the drawing result.
+ [Incredible!]
-> main

=== Incision ===
Incision is the technique that allows for a cleaner and more continuous result, as it uses sharp tools to form a consistent line as it slides across the stone.
+ [Wow!]
-> main

=== Perforation ===
In this approach, we use an instrument to hammer the rock consecutively, forming a perforated line. Typically, this utensil used to exert pressure is made of stone and, depending on whether it has a sharper or blunter tip, we can adapt the strokes and level of precision.
+ [Understood.]
-> main

=== Scraping ===
Scraping is similar to abrasion, in that it uses friction to improve the engraving. However, while abrasion focuses on smoothing the line itself, scraping uses a vigorous movement of scraping, as the name implies, to remove the rock surface. Typically the line resulting in this technique is more irregular and bumpy, and therefore less accurate.
+ [Interesting...]
-> main

=== Goodbye ===
No problem, catch you later!
-> END