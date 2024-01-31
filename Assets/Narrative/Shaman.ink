LIST shamanLines = (line1), (line2), (line3)
{randomShamanLine()}
* [...]
-> END

=== function randomShamanLine ===
{LIST_RANDOM(shamanLines):
- line1: ~ return "In the heart of the forest, the echo of ancient spirits resonates. You will find your inner strength in the search for sumac; its colors will weave the story of your journey."
- line2: ~ return "In the smoke of the sacred fire, I see the signs of your destiny. Prepare yourself, young hunter, because nature speaks to us and it is up to you to listen."
- else: ~ return "Did you know that the birds that sing at dawn are the messengers of the spirits in our belief? Pay attention to the melodies of dawn, as they can guide you at crucial moments in your journey."
}