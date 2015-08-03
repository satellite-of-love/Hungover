

class Kitties
  attr_reader :prints, :travelling, :moar, :new_stuff, :only_once
  def stuff(inventory)
    inventory + @new_stuff
  end
  def initialize (p, e = false, m = {}, s = [], o = false)
    @prints = if p.is_a? String then ->(inventory) {p} else p end
    @travelling = e
    @moar = m
    @new_stuff = s
    @only_once = o
  end
end

class Dozer
  def initialize (p)
    @prints = p
    @travelling = :stay_here
    @moar = {}
    @once_once = false
  end
  def add_options (m)
    @moar = m
    self 
  end
  def only_once 
    @only_once = true
    self 
  end
  def travelling (t)
    @travelling = t
    self
  end
  def build 
    Kitties.new(@prints, @travelling, @moar, [], @only_once)
  end  
end


module Game
  def self.prompt
    print "==> "
  end
  def self.modify_options(old_options, kitty, next_move)
    new_options = old_options.merge(kitty.moar)
    if kitty.only_once
      new_options.delete(next_move)   
    end
    new_options
  end
  def self.go(options, inventory = [] )
    prompt
    next_move = gets.chomp.strip
    kitty = options[next_move]

    if kitty
      puts kitty.prints.call(inventory)
      if kitty.travelling != :quit
        go(modify_options(options, kitty, next_move), kitty.stuff(inventory))
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

  