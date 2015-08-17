
require './game.rb'

print_inventory = ->(inventory) do
    if inventory.empty? then "you ain't got nothing"
    else "you have something:   " +inventory.join(", ")
    end
  end

forever_options = {
      "fuck it" => Kitties.new("crawl back into bed you loser", :quit),
      "inventory" => Kitties.new(print_inventory)
    }

@drawer_options = {
  "take vibrator" => Kitties.new("Eh, you’re not really in the mood at the moment.", false),
  "take phone"    => Kitties.new("You pick up your phone. Ten Facebook notifications?! Okay, which one of your asshole friends thought it was okay to tag you in so many horribly unflattering pictures? You quickly untag yourself and send your friend a series of angry emojis to express your displeasure. You place the phone back in the drawer.", false),


  "take weed" => Dozer.new("Yass queen, now the morning is really coming together! Weed is great for a hangover. Sadly, there’s nothing in this room to smoke it with. You’re currently pants-less (no pockets) but you didn’t bother to taking off your sports bra last night so you stuff the baggie in there for safekeeping. Classy.").
  you_get(:weed).
  only_once.build
}



@leave_room =
  Dozer.new("You slowly manuver yourself forward, offering a brief prayer to any booze-friendly deity that might take pity on your current state. \n ('Are you there, Bacchus? It's me, Margaret'). \n You slowly make your way to the door, open it, and lean against the frame while you contemplate your next move. \n To your left is the living room, to your right is the kitchen.").
travelling(:bedroom_doorway).build


  @bedroom_doorway =
  {"go back" =>Kitties.new("You backtrack into the bedroom.", :bedroom),
    "go right" =>Kitties.new("You shuffle into the kitchen, feeling like every generic zombie you’ve ever seen on screen. You peek into the fridge. Apple juice! Mmm yes, drink that. Delicious. There’s also a few slices of leftover pizza. Maybe you’d feel better if you ate something?", :kitchen)
  }


@starting_bedroom_options =
{ "look around" => Dozer.new("You’re in your bedroom, sprawled on top of your comforter and pillows. There’s a poster up on the wall of the Star Trek captains and Picard seems to have a distinct look of disapproval on his face as he gazes down at your rather undignified state. Whatever, Jean-Luc, no need to be so snooty about it. \n Next to the bed is a table. On top of the table is a bottle of water. The table also has a drawer, currently closed. The door leading out of the bedroom is to your left.").
       add_options({"take water" =>
                Dozer.new("You gulp down the water until the bottle is empty, and say a brief word of thanks to Drunk-you for so helpfully placing it there before passing out last night. Great job, Drunk-you!"
                ).add_options({"stand up" => Kitties.new("Congratulations! You're vertical now. Good job buddy.", false, {"leave room" => @leave_room })}).
                only_once.build,
            "open drawer" => Dozer.new("You open the bedside table drawer. Inside is your phone, your vibrator, and a small bag of weed. Nice.").add_options(@drawer_options).build
            }).build,
            "stand up" => Kitties.new("Whoah there, cowgirl. Don't know if you're ready to be entirely vertical just yet.")
}

@table_options = {
"take money" => Dozer.new("Well you don’t really have a use for the money at the moment. So, you choose to make it rain on top of your cat, who has so helpfully jumped up on the table to investigate it with you. The bills scatter around him. He looks unimpressed.").build,
"take papers" => Dozer.new("There are only a few left, but that’s enough to get the job done!").
you_get(:papers).
only_once.build
}

bedroom_doorway_options = {
  "go kitchen" => Dozer.new("You shuffle into the kitchen, feeling like every generic zombie you’ve ever seen on screen. You peek into the fridge. Apple juice! Mmm yes, drink that. Delicious. There’s also a few slices of leftover pizza. Maybe you’d feel better if you ate something?").
  travelling(:kitchen).build,
  "go back" => Dozer.new("Turning around makes you dizzy").
travelling(:bedroom).build,
  "go living room" => Dozer.new("The living room is small and a little cluttered. The table has a few items scattered across it.")
     .travelling(:living_room).build,
}

living_room_options =  {
    "look at table" => Dozer.new("Among all the usual table detritus of empty Solo cups and silverware you find some crumpled dollar bills, a few joint-rolling papers and we all say hallelujah.").add_options(@table_options).build,
    "go back" => Dozer.new("Walking backward makes you only a little dizzy.").travelling(:bedroom_doorway).build}


kitchen_options = {"eat pizza" =>
Dozer.new("Oh no. Ohhhh no. Bad idea. You really should have done something about the nausea before attempting food. Now you’re prostate on the kitchen floor, willing your stomach to obey you. Your cat chooses this moment to come paw at your face like the little asshole he is. Eventually you’re able to stand again. Better not try that again until you've gotten your stomach under control").build,
"go back" => Dozer.new("Oof, turning around makes you dizzy. You're by the bedroom doorway again. The kitchen is to your right. The living room is to your left, and the bedroom is behind you.").
travelling(:bedroom_doorway).build}

@starting_options = {
  :bedroom => @starting_bedroom_options,
  :bedroom_doorway => bedroom_doorway_options,
  :kitchen => kitchen_options,
  :living_room => living_room_options
}


def start
  puts "Your head is pounding and what feels like the light of ten thousand suns"
  puts "is assaulting your brain directly through your eyes."
  puts ''
  puts "Squinting, you manage to roll over on your bed, reaching out to tug the curtain across the window. Ahh, much better. The effort of moving leaves your head spinning and you collapse back on your pillow to reflect on your situation."
  puts ''
  puts "The night before had started as just a few drinks out with friends, but had"
  puts "quickly progressed to a somewhat rowdier evening."
  puts ''
  puts "As you lay there in bed some of the details start trickling back..."
  puts ''
  puts "There had definitely been shots at some point..."
  puts ''
  puts "oh God."
  puts ''
  puts "So."
  puts "many."
  puts "shots."
  puts ''
  puts "The memory of all that tequila turns your stomach and you quickly focus your"
  puts "attention back to the present. The clock on the wall informs you that it\'s"
  puts "already 1 p.m. so it\'s probably time to drag your sorry ass out of bed and get on with your day."
end

start

Game.go(forever_options, @starting_options, :bedroom)

