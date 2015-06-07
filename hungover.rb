@inventory = []

def prompt ()
  print "What is your sorry ass gonna do next?"
end

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
  bed_room()
end
  
def bed_room 
  puts "The memory of all that tequila turns your stomach and you quickly focus your"
  puts "attention back to the present. The clock on the wall informs you that it\'s"
  puts "already 1 p.m. so it\'s probably time to drag your sorry ass out of bed and get on with your day."
  puts ''
  prompt; next_move = gets.chomp
  
def bed_room 
  puts "The memory of all that tequila turns your stomach and you quickly focus your attention back to the present. The clock on the wall informs you that it’s already 1 p.m. so it’s probably time to drag your sorry ass out of bed and get on with your day."
  prompt; next_move = gets.chomp
    
  if next_move == "Stand up"
    puts "Whoah there, cowgirl. Don't know if you're ready to be entirely vertical just yet."
    prompt; next_move = get.chomp
  end
  if next_move == "Look around"
    puts "You’re in your bedroom, sprawled on top of your comforter and pillows. There’s a poster up on the wall of the Star Trek captains and Picard seems to have a distinct look of disapproval on his face as he gazes down at your rather undignified state. Whatever, Jean-Luc, no need to be so snooty about it."
    puts "Next to the bed is a table. On top of the table is a bottle of water. The table also has a drawer, currently closed. The door leading out of the bedroom is to your left."
  end 
  prompt; next_move = gets.chomp
  if next_move == "take water" 
    puts "You gulp down the water until the bottle is empty, and say a brief word of thanks to Drunk-you for so helpfully placing it there before passing out last night. Great job, Drunk-you!"
  elsif next_move == "open drawer"
    drawer_sequence()
  elsif next_move == "go left"
    bedroom_doorway()
  end
end
    
def drawer_sequence 
  puts "You open the bedside table drawer. Inside is your phone, your vibrator, and a small bag of weed. Nice."
  prompt; next_move = gets.chomp
  if next_move == "take vibrator"
    puts "Eh, you’re not really in the mood at the moment."
    prompt; next_move = gets.chomp
  elsif next_move == "take phone"
    puts "You pick up your phone. Ten Facebook notifications?! Okay, which one of your asshole friends thought it was okay to tag you in so many horribly unflattering pictures? You quickly untag yourself and send your friend a series of angry emojis to express your displeasure. You place the phone back in the drawer."
    prompt; next_move == gets.chomp
  elsif next_move == "take weed"
    puts "Yass, now the morning is really coming together! Weed is great for a hangover. Sadly, there’s nothing in this room to smoke it with. You’re currently pants-less (no pockets) but you didn’t bother to taking off your sports bra last night so you stuff the baggie in there for safekeeping. Classy."
    @weed_present = true
    @inventory << "weed"
    prompt; next_move = gets.chomp
    if next_move == "go left"
      bedroom_dooryway()
    end
  end
end
start




    
    
    
