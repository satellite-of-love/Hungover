

def prompt
  print "==> "
end

class Kitties
  attr_reader :prints, :travelling, :moar, :new_stuff
  def stuff(inventory)
    inventory + @new_stuff
  end
  #property or field: what is inside of each object of type Kitties
  #syntax sugar: makes something easier for you to type
  #statements: only DO something, like an assignment or puts
  #expression: returns a value
  def initialize (p, e = false, m = {}, s = [])
    @prints = if p.is_a? String then ->(inventory) {p} else p end
    @travelling = e
    @moar = m
    @new_stuff = s
  end
end

def go(options, inventory = [] )
  prompt
  next_move = gets.chomp.strip
  kitty = options[next_move]

  if kitty
    puts kitty.prints.call(inventory)
    if kitty.travelling != :quit
      go(options.merge(kitty.moar), kitty.stuff(inventory))
    end
  else
    if next_move == "think"
      puts "what are some of my options?" 
      puts options.keys.join(", ")
    else
      puts "say what now"
    end
    go(options, inventory)
  end
end

@drawer_options = { 
  "take vibrator" => Kitties.new("Eh, you’re not really in the mood at the moment.", false),
  "take phone"    => Kitties.new("You pick up your phone. Ten Facebook notifications?! Okay, which one of your asshole friends thought it was okay to tag you in so many horribly unflattering pictures? You quickly untag yourself and send your friend a series of angry emojis to express your displeasure. You place the phone back in the drawer.", false),
  "take weed"     => Kitties.new("Yass queen, now the morning is really coming together! Weed is great for a hangover. Sadly, there’s nothing in this room to smoke it with. You’re currently pants-less (no pockets) but you didn’t bother to taking off your sports bra last night so you stuff the baggie in there for safekeeping. Classy.", false, 
    {}, 
    [:weed])  
}

print_inventory = ->(inventory) do 
    if inventory.empty? then "you ain't got nothing" 
    else "you have something:   " +inventory.join(", ") 
    end
  end
  
@leave_room =
  Kitties.new("You slowly manuver yourself forward, offering a brief prayer to any booze-friendly deity that might take pity on your current state. \n ('Are you there, Bacchus? It's me, Margaret'). \n You slowly make your way to the door, open it, and lean against the frame while you contemplate your next move. \n Directly ahead is the living room, to your right is the kitchen.",
:bedroom_doorway
  ) 

  @bedroom_doorway =
  {"go back" =>Kitties.new("You backtrack into the bedroom.", :bedroom),
    "go right" =>Kitties.new("You shuffle into the kitchen, feeling like every generic zombie you’ve ever seen on screen. You peek into the fridge. Apple juice! Mmm yes, drink that. Delicious. There’s also a few slices of leftover pizza. Maybe you’d feel better if you ate something?", :kitchen)
  }
  

@starting_options = 
{ "look around" => 
  Kitties.new("You’re in your bedroom, sprawled on top of your comforter and pillows. There’s a poster up on the wall of the Star Trek captains and Picard seems to have a distinct look of disapproval on his face as he gazes down at your rather undignified state. Whatever, Jean-Luc, no need to be so snooty about it. \n Next to the bed is a table. On top of the table is a bottle of water. The table also has a drawer, currently closed. The door leading out of the bedroom is to your left.",
              false, 
              { "take water" => Kitties.new("You gulp down the water until the bottle is empty, and say a brief word of thanks to Drunk-you for so helpfully placing it there before passing out last night. Great job, Drunk-you!",
                                            false, 
                                            {"stand up" => Kitties.new("Congratulations! You're vertical now. Good job buddy.", false, 
                                              {"leave room" => 
@leave_room
                                                
                                                }) 
               }), 
                "open drawer" => Kitties.new("You open the bedside table drawer. Inside is your phone, your vibrator, and a small bag of weed. Nice.", false, @drawer_options)}),
  "fuck it" => Kitties.new("crawl back into bed you loser", :quit),
  "inventory" => Kitties.new(print_inventory),
  "stand up" => Kitties.new("Whoah there, cowgirl. Don't know if you're ready to be entirely vertical just yet.", false)

}




def start
  puts "Your head is pounding and what feels like the light of ten thousand suns"
  puts "is assaulting your brain directly through your eyes."
  puts '' 
  puts "Squinting, you manage to roll over on your bed, reaching out to tug the curtain across the window. Ahh, much better. The effort of moving leaves your head spinning and you collapse back on your pillow to reflect on your situation."
  puts ''
  puts "The night before had started as just a few drinks out with friends, but had"
  puts "quickly professed to a somewhat rowdier evening."
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

go(@starting_options)

