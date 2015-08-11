

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
  def where_to_be (where_i_was_before)
    if (travelling && travelling != :stay_here)
      travelling
    else
      where_i_was_before
    end
  end
end

class Dozer
  def initialize (p)
    @prints = p
    @travelling = :stay_here
    @moar = {}
    @new_stuff = []
    @only_once = false
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
    Kitties.new(@prints, @travelling, @moar, @new_stuff, @only_once)
  end  
  def you_get (n)
    @new_stuff = [n]
    self
  end
end


module Game
  def self.prompt
    print "==> "
  end
  def self.modify_options(old_room_options, kitty, next_move, current_room)
    old_options = old_room_options[current_room]
    new_options = old_options.merge(kitty.moar)
    if kitty.only_once
      new_options.delete(next_move)   
    end
   old_room_options.merge({current_room => new_options}) 
  end
  def self.go(forever_options, room_options, current_room, inventory = [])
    prompt
    next_move = gets.chomp.strip
    kitty = room_options[current_room][next_move]

    if kitty
      puts kitty.prints.call(inventory)
      new_room = kitty.where_to_be(current_room)
      if new_room != :quit   
        go(forever_options, modify_options(room_options, kitty, next_move, current_room), 
           new_room,
           kitty.stuff(inventory))
      end
    else
      if next_move == "think"
        puts "what are some of my options?" 
        puts room_options[current_room].keys.join(", ")
      else
        puts "say what now"
      end
      go(forever_options, room_options, current_room, inventory)
    end
  end
end

  