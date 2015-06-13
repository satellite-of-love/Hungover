@options = []
class Kitties
  attr_reader :prints, :leaves
  def initialize (p, e)
    @prints = p
    @leaves = e
  end
  def to_s
    "meow meow" +@command
  end
end

@options =  {"loki" => Kitties.new("you are fat", false),
 "grim" => Kitties.new("you are fluffy", true)
}

while true
  next_move = gets.chomp
  kitty = @options[next_move]
  puts kitty.prints
  if kitty.leaves 
    exit
  end
end

