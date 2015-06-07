@options = []
class Kitties
  attr_reader :command, :prints, :leaves
  def initialize (c, p, e)
    @command = c
    @prints = p
    @leaves = e
  end
  def to_s
    "meow meow" +@command
  end
end

@options = [Kitties.new("loki", "you are fat", false),
  Kitties.new("grim", "you are fluffy", true)]

while true
  next_move = gets.chomp
  kitty = @options.select{|k| k.command == next_move}.first
  puts kitty.prints
  if kitty.leaves 
    exit
  end
end

