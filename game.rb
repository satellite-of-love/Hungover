

class Kitties
  attr_reader :prints, :travelling, :moar, :new_stuff, :only_once
  def stuff(inventory)
    inventory + @new_stuff - @take_out
  end
  def initialize (p, e = false, m = {}, s = [], o = false, t = [])
    @prints = if p.is_a? String then ->(inventory) {p} else p end
    @travelling = e
    @moar = m
    @new_stuff = s
    @only_once = o
    @take_out = t
  end
  def where_to_be (where_i_was_before)
    if (travelling && travelling != :stay_here)
      travelling
    else
      where_i_was_before
    end
  end
  def narrow_options (options, next_move)
    if @only_once
      options.delete(next_move)
    end
    options
  end
end

class Dozer
  def initialize (p)
    @prints = p
    @travelling = :stay_here
    @moar = {}
    @new_stuff = []
    @only_once = false
    @take_out = []
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
    Kitties.new(@prints, @travelling, @moar, @new_stuff, @only_once, @take_out)
  end
  def you_get (n)
    @new_stuff = [n]
    self
  end
  def take_out (t)
    @take_out = t
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

  def self.modify_forever_options(old_ones, magic, inventory)
    new_forever_options = old_ones.merge(magic.call(inventory))
    new_forever_options
  end
  

  def self.go(old_forever_options, room_options, current_room, inventory = [], magic = ->(inventory) { {} } )
    new_forever_options = modify_forever_options(old_forever_options, magic, inventory)
    available_options = room_options[current_room].merge new_forever_options
    prompt
    next_move = gets.chomp.strip
    kitty = available_options[next_move]

    if kitty
      puts kitty.prints.call(inventory)
      new_room = kitty.where_to_be(current_room)
      if new_room != :quit
        go(kitty.narrow_options(new_forever_options, next_move),
           modify_options(room_options, kitty, next_move, current_room),
           new_room,
           kitty.stuff(inventory), magic)
      end
    else
      if next_move == "think"
        puts "what are some of my options?"
        puts available_options.keys.join(", ")
      else
        puts "say what now"
      end
      go(new_forever_options, room_options, current_room, inventory, magic)
    end
  end
end


