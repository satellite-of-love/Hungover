

def prompt
  print "==> "
end

class Kitties
  attr_reader :prints, :leaves, :moar
  #property or field: what is inside of each object of type Kitties
  #syntax sugar: makes something easier for you to type
  def initialize (p, e = false, m = {})
    @prints = p
    @leaves = e
    @moar = m
  end
end

def go(options)
  prompt
  next_move = gets.chomp
  kitty = options[next_move]

  if  kitty
    puts kitty.prints

    if !kitty.leaves
      go(options.merge kitty.moar)
    end
    

  else
    puts "==> "
    go(options)
  end
end

@starting_options = { "look around" => Kitties.new("You’re in your bedroom, sprawled on top of your comforter and pillows. There’s a poster up on the wall of the Star Trek captains and Picard seems to have a distinct look of disapproval on his face as he gazes down at your rather undignified state. Whatever, Jean-Luc, no need to be so snooty about it. \n Next to the bed is a table. On top of the table is a bottle of water. The table also has a drawer, currently closed. The door leading out of the bedroom is to your left.", false, 
                   { "take water" => Kitties.new("You gulp down the water until the bottle is empty, and say a brief word of thanks to Drunk-you for so helpfully placing it there before passing out last night. Great job, Drunk-you!"), 
                     "snuggle" => Kitties.new("who's my lil man")}),
              "fuck it" => Kitties.new("crawl back into bed you loser", true),
              "stand up" => Kitties.new("Whoah there, cowgirl. Don't know if you're ready to be entirely vertical just yet.", false)
            }
puts @starting_options

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

