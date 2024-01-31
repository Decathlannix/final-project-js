INCLUDE Globals.ink

{first_time_doran:
    ~ first_time_doran = false
    I'm Doran, all good?
}
See those sharp rocks? They are fundamental for us. With them, we make stone blades for hunting and food preparation. We also use them in bone carving. It's unbelievable how something so simple can be so versatile and essential for our survival.
{not has_flint and not has_fish_tool and not first_time_vorn and not first_time_jarnak:
    * [Those tools have impressive quality!]
    -> Get_Flint
}

* [That's some incredible craftsmanship!]
-> END

=== Get_Flint ===
#Flint: true #Fish_Tool: true
~ has_flint = true
~ has_fish_tool = true
Sure, go ahead and take some. That flint is a precious stone. In fishing, it is the sharp blade that reveals the river's sustenance. At the campfire, it is the spark that keeps us warm. Remember, young hunter, that stone is a wise guide between capture and fire.
* [I'll be careful, thanks.]
-> END