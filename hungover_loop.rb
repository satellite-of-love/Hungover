

def prompt
  print "holla at me bro "
end

class Kitties
  attr_reader :prints, :leaves, :moar
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

    if  kitty.leaves
      exit
    end
    go(options.merge kitty.moar)

  else
    puts "holla one more time"
    go(options)
  end
end

@options =  {"loki" => Kitties.new("you are fat", false, {"scratch" => Kitties.new("stop it you fucker"), "snuggle" => Kitties.new("who's my lil man")}),
 "grim" => Kitties.new("you are fluffy", true)
}
puts @options

go(@options)

