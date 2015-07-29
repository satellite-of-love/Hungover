

class Kitties
  attr_reader :prints, :travelling, :moar, :new_stuff
  def stuff(inventory)
    inventory + @new_stuff
  end
  def initialize (p, e = false, m = {}, s = [])
    @prints = if p.is_a? String then ->(inventory) {p} else p end
    @travelling = e
    @moar = m
    @new_stuff = s
  end
end


module Game
  def self.prompt
    print "==> "
  end
  def self.go(options, inventory = [] )
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
end

  