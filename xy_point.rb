class XYPoint

  attr_reader :x, :y

  def initialize(*args)
    if args.length == 0
      @x = 0
      @y = 0
    elsif args.length == 2
      @x = args[0]
      @y = args[1]
    else
      puts "Please supply x,y coordinates or not coordinates at all"
      puts "Exiting..."
      exit
    end
  end

  def compare(other)
    @x < other.x && @y < other.y
  end

  def to_s
    "(#{x}, #{y})"
  end
end
